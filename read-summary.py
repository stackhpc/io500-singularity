import sys, json, pprint

def read_io500_summary(path):
    """ Read a result_summary.txt file and return a dict """

    data = {}
    with open(path) as f:
        for line in f:
            if line.startswith('[RESULT]'):
                # [RESULT]       ior-easy-write        0.764612 GiB/s : time 34.035 seconds
                _, testname, value, unit, _, _, seconds, _ = line.split()
                data[testname] = {
                    'value': value,
                    'unit': unit,
                    'seconds': seconds,
                }
    return data

if __name__ == '__main__':
    pprint.pprint(read_io500_summary(sys.argv[1]))
