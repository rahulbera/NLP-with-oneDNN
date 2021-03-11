TASK_NAME=stsb
#export MODEL_NAME=bert-base-cased
#MODEL_NAME=bert-base-cased
MODEL_NAME="albert-base-v2"

python run_glue.py \
	--model_name_or_path $MODEL_NAME \
	--task_name $TASK_NAME \
	--do_train \
	--do_eval \
	--max_seq_length 128 \
	--per_device_train_batch_size 32 \
	--learning_rate 2e-5 \
	--num_train_epochs 3 \
	--output_dir ./$MODEL_NAME-$TASK_NAME
