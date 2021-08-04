# ChAII-docker
Repo to build the docker image for Google ChAII

## Docker
### Building the image
`docker build -t <name:tag> .`

### Running the image (with jupyter)
`docker run -it -v <absolute path of directory to be mounted from local>:/root/mount -p 8081:8081 <name:tag>`



## Scripts and Arguments
#### [RUN SCRIPT](/run.sh)
- **TASK :** chaii_hi / chaii_ta
- **DATA_DIR :** the absolute directory path containing the dataset files *(no suffix will be added for chaii tasks)*
- **OUT_DIR :** the absolute directory path to where the output files need to be written
- **MODEL :** model
    - *default* : bert-base-multilingual-cased
- **GPU :** GPU number
    - *default* : 0
- **TRAIN_FILE_NAME :** the name of the file containing the training data (inside **DATA_DIR**)
    - *default* : for **TASK** == chaii_hi, train.hi.qa.jsonl;  for **TASK** == chaii_hi, train.ta.qa.jsonl
- **PREDICT_FILE_NAME :** the name of the file containing the validation data (inside **DATA_DIR**)
    - *default* : for **TASK** == chaii_hi, dev.hi.qa.jsonl;  for **TASK** == chaii_hi, dev.ta.qa.jsonl

#### [PREDICT SCRIPT](/predict.sh)
- **MODEL_PATH :** the absolute path to the model file
- **TASK :** chaii_hi / chaii_ta
- **DATA_DIR :** the absolute directory path containing the dataset files *(no suffix will be added for chaii tasks)*
- **PREDICTIONS_DIR :** the absolute directory path to where the predictions need to be written *(no suffix will be added for chaii tasks)*
- **MODEL :** model
    - *default* : bert-base-multilingual-cased
- **MODEL_TYPE :** model type
    - *default* : bert
- **GPU:** GPU number
    - *default* : 0
- **PREDICT_FILE_NAME:** the name of the file containing the prediction data (inside *DATA_DIR*)
    - *default* : for **TASK** == chaii_hi, dev.hi.qa.jsonl;  for **TASK** == chaii_hi, dev.ta.qa.jsonl

#### [PRE-EVALUATE SCRIPT](/pre_evaluate.sh)
- **TASK_NAME :** chaii_hi / chaii_ta
- **GOLD_DATA_LOCATION :** the absolute directory path containing the dataset files *(no suffix will be added for chaii tasks)*
- **PREDICTIONS_DIR :** the absolute directory path to which predictions were written *(by predict_qa.sh script)*

#### [EVALUATE SCRIPT](/evaluate.sh)
-- NIL --