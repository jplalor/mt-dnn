#!/bin/bash
#
#SBATCH --output=res_%j.txt  # output file
#SBATCH -e res_%j.err        # File to which STDERR will be written
#SBATCH --partition=titanx-long # Partition to submit to 
#
#SBATCH --ntasks=1
#SBATCH --mem=47GB    
#SBATCH --gres=gpu:4

echo "percentage: $1, threshold-type: $2"
prefix=snli_$1_$2
TOP_DIR=/mnt/nfs/work1/hongyu/lalor/data/mt-dnn
sh domain_adaptation_run.sh $prefix $TOP_DIR/mt_dnn_models/mt_dnn_base.pt $prefix snli $TOP_DIR/data/domain_adaptation $TOP_DIR/checkpoints 8 0,1,2,3 
exit
