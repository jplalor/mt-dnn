import numpy as np 

def build_irt_set(data, training_set_size, threshold, balanced=False):
    diffs = [d['difficulty'] for d in data]
    if threshold == 'lower_bound':
        # pick and return the hardest items
        idx = np.argsort(diffs)[::-1]  # high-to-low
    elif threshold == 'upper_bound':
        idx = np.argsort(diffs)  # low-to-high 
    elif threshold = 'AVI':
        idx = np.argsort(abs(diffs)) 
    elif threshold == 'AVO':
        idx = np.argsort(abs(diffs))[::-1] 
    else:
        raise ValueError('selected threshold not implemented. options are lower_bound, upper_bound, AVI, and AVO')

    result = [] 
    for i in range(training_set_size):
        result.append(data[idx[i]]) 

    return result 


training_set_sizes = [549, 5493, 54936, 274683]
percentages = [0.1, 1, 10, 50] 
thresholds = ['lower_bound', 'upper_bound', 'AVI', 'AVO']
full_training_set = []  # TODO: load full training set
outdir = '' 
for i in range(4):
    for j in thresholds:
        t = training_set_sizes[i] 
        p = percentages[i] 
        fname = 'snli_{}_{}.json'.format(p, j) 
        data = build_irt_set(full_training_set, t, j) 
        with open(outdir + fname, 'w') as outwriter:
            for line in data:
                outwriter.write(line)
                outwriter.write('\n') 




