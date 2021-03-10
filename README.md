Steps to recreate the issue
======================================== 

Step 1: Create a Conda environment from the supplied yml file: `conda env create -f tf2.4-cpu-py38.yml`
Step 2: Download the script by: `wget https://github.com/huggingface/transformers/blob/master/examples/text-classification/run_tf_glue.py`
Step 3: Fine tune the model by: `./finetune.sh` (we can do this step with TF2-gpu version too. That would be faster)
Step 4: Once the fine-tuned model is created, evaluate the model using: `./evaluate.sh`