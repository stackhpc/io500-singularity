import sys, json, pprint

def read_io500_summary(path):
    """ Read a result_summary.txt file and return a dict.
    
        For dict format see below.
    """

    data = {}
    with open(path) as f:
        for line in f:
            if line.startswith('[RESULT]'):
            #   [RESULT]       ior-easy-write        0.764612 GiB/s : time 34.035 seconds
                _,             testname,             value,   unit, _, _,  seconds, _ = line.split()
                data[testname] = {
                    'value': float(value),
                    'unit': unit,
                    'seconds': float(seconds),
                }
            if line.startswith('[SCORE ]'): # NB: this will skip invalid scores!
            #   [SCORE ] Bandwidth 0.585873 GiB/s    : IOPS 4.148649 kiops     : TOTAL 1.559032
                _,    _, _,        bw,      bw_unit, _,_,   iops,    iops_unit,_,_,    total = line.split()
                data['score'] = {
                    'bandwidth': float(bw),
                    'iops': float(iops),
                    'bandwidth_unit': bw_unit,
                    'iops_unit': iops_unit,
                    'total': float(total),
                }

    return data

if __name__ == '__main__':
    pprint.pprint(read_io500_summary(sys.argv[1]))
