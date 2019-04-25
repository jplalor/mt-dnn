#!/bin/bash
#
#SBATCH --job-name=baseline_04_23
#SBATCH --output=res_%j.txt  # output file
#SBATCH -e res_%j.err        # File to which STDERR will be written
#SBATCH --partition=1080ti-long # Partition to submit to 
#
#SBATCH --ntasks=1
#SBATCH --mem=47GB    
#SBATCH --gres=gpu:4

TOP_DIR=/mnt/nfs/work1/hongyu/lalor/data/mt-dnn
sh domain_adaptation_run.sh snli_full_tl $TOP_DIR/mt_dnn_models/mt_dnn_base.pt snli snli $TOP_DIR/data/domain_adaptation $TOP_DIR/checkpoints 8 0,1,2,3 |tee snli_full_tl.log
sleep 1
exit
