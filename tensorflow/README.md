## Issue
Running BERT-base using tensorflow is not printing *matmul* primitive verbose log from oneDNN. All other primitives (e.g., softmax, sum, and inner_product) are printing verbose log correctly.

## Steps to regenerate the issue
1. Create a Conda environment from the yml file. This should download all necessary packages (including Intel(R) optimized Tensorflow) and prepare the environement.
```
conda env create -f tf2.4-cpu-py38.yml
```
2. Download the finetuing/evaluation script:
```
wget https://github.com/huggingface/transformers/blob/master/examples/text-classification/run_tf_glue.py
```
3. Finetune the model using the script. *Note:* You can finetune the model using gpu version of Tensorflow (preferred). As long as they are the same version (i.e., 2.4.0), the finetuned model can be used for evaluation. We are more interested in the evaluation that comes next.
```
./finetune.sh
```
4. Enable DNNL_VERBOSE print. Use export if your are using bash shell.
```
export DNNL_VERBOSE=2
```
6. Evaluate the model using
```
./evaluate.sh
```

## Screenshots
Screenshot of DNNL verbose log for BERT-base evaluating GLUE STS-B. As you can see, the matmul primitive is not printing verbose log, though it gets executed.   
![Alt text](screenshot_BERT-base.png?raw=true "BERT-base DNNL debug log")

But running the same for ALBERT-base-v2 evaluating GLUE STS-B does show the matmul operations (line 254, 258, etc.)
![Alt text](screenshot_ALBERT-base-v2.png?raw=true "ALBERT-base-v2 DNNL debug log")
