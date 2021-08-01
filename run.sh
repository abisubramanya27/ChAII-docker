# !/bin/bash

# Arguments in decreasing order of priority
TASK=${1:-chaii_hi}
# DATA_DIR for chaii points directly to the dataset (won't be added with any suffix directory path)
DATA_DIR=${2:-"/root/xtreme/download/chaii_data/"}
OUT_DIR=${3:-"/root/xtreme/outputs-temp/"}
MODEL=${4:-bert-base-multilingual-cased}
GPU=${5:-0}
TRAIN_FILE_NAME=${6}
PREDICT_FILE_NAME=${7}

source activate xtreme
cd /root/xtreme
bash scripts/train.sh $MODEL $TASK $GPU $DATA_DIR $OUT_DIR $TRAIN_FILE_NAME $PREDICT_FILE_NAME