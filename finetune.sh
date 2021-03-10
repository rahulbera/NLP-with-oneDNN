#!/bin/bash

HF_HOME="/home/rahbera/modelzoo/tensorflow/huggingface"
SCRIPT="$HF_HOME/scripts/run_tf_glue.py"
DATASET_DIR="$HF_HOME/datasets"
TASK_NAME="sts-b"
MODEL_NAME="bert-base-uncased"
#MODEL_NAME="distilbert-base-uncased"
#MODEL_NAME="roberta-base"
#MODEL_NAME="albert-base-v2"

python $SCRIPT \
	--do_train \
	--do_eval \
	--model_name_or_path $MODEL_NAME \
	--task_name $TASK_NAME \
	--data_dir $DATASET_DIR \
	--max_seq_length 128 \
	--per_device_train_batch_size 32 \
	--learning_rate 1e-5 \
	--num_train_epochs 3.0 \
	--warmup_steps 100 \
	--output_dir $HF_HOME/fine-tuned/${MODEL_NAME}-${TASK_NAME} \
	--overwrite_output_dir
