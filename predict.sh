# !/bin/bash
 
source activate xtreme
cd /root/xtreme

# Arguments in decreasing order of priority
MODEL_PATH=${1:-"/root/xtreme/outputs-temp/chaii_hi/bert-base-multilingual-cased_LR3e-5_EPOCH2.0_maxlen384"}
TASK=${2:-chaii_hi}
DATA_DIR=${2:-"/root/xtreme/download/chaii_data/"}
MODEL=${3:-bert-base-multilingual-cased}
MODEL_TYPE=${4:-bert}
GPU=${5:-0}
 
bash scripts/predict_qa.sh bert-base-multilingual-cased bert $MODEL_PATH $TASK $GPU $DATA_DIR