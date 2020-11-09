#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH -A RITTMAN-SL3-GPU
#SBATCH --mail-user=mkp42@medschl.cam.ac.uk
#SBATCH --time=24:00:00

module load Anaconda
source /applications/Anaconda/etc/profile.d/conda.sh

export PATH:/home/mkp42/miniconda3/bin/:$PATH
conda activate rl-medical
echo `which python`

echo $SHELL

python -V

python /lustre/group/p00259/midbrainpons/rl-medical/src/DQN.py --task train --file_type PSP --files /lustre/group/p00259/midbrainpons/Sample_PSPRL.csv --model_name Network3d --multiscale --viz 0 --write --landmarks 0 1 2 3 --train_freq 50
