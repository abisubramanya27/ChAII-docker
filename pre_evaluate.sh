# !/bin/bash

# shift to mounted directory so that the predictions are written to it
cd /root/mount

# Arguments
TASK_NAME=${1:-"chaii_hi"}
GOLD_DATA_LOCATION=${2:-"/root/mount/dataset/"}
PRED_DIR=${3:-"/root/xtreme/predictions/chaii_hi"}

mkdir -p /root/eval_dir/predictions/$TASK_NAME/
mkdir -p /root/eval_dir/labels/$TASK_NAME/

cp $GOLD_DATA_LOCATION/* /root/eval_dir/labels/$TASK_NAME/
for file in /root/eval_dir/labels/$TASK_NAME/dev.*.jsonl; do
filename=$(basename "$file")
fname="${filename%.*}"
lg=$(echo $fname | cut -d"." -f 2)
mv $file /root/eval_dir/labels/$TASK_NAME/test-$lg.json
done

cp ${PRED_DIR}/predictions* /root/eval_dir/predictions/$TASK_NAME/
for file in /root/eval_dir/predictions/$TASK_NAME/predictions*.json; do
filename=$(basename "$file")
fname="${filename%.*}"
lg=$(echo $fname | cut -d"_" -f 2)
mv $file /root/eval_dir/predictions/tydiqa/test-$lg.json
done