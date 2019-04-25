
for p in 0.1 1 10 50 
do 
    for t in lower_bound upper_bound AVI AVO 
    do 
        sbatch run_snli_gypsum.sh $p $t 
    done
done 
