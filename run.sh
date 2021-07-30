# !/bin/bash

# Arguments in decreasing order of priority
# DATA_DIR for chaii points directly to the dataset (won't be added with any suffix directory path)
DATA_DIR=${1:-"/root/xtreme/download/chaii_data/"}
OUT_DIR=${2:-"/root/xtreme/outputs-temp/"}
MODEL=${3:-bert-base-multilingual-cased}
GPU=${4:-0}

source activate xtreme
cd /root/xtreme
bash scripts/train.sh $MODEL chaii_hi $GPU $DATA_DIR $OUT_DIR