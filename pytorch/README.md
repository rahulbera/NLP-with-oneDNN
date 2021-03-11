## Issue
Running BERT-base using Pytorch is not printing ***any*** verbose log from oneDNN, though the same Pytorch environment prints DNNL verbose log correctly for a image classification inference using a pretrained Resnet-18 model.

## Steps to regenerate the issue
1. Create a Conda environment from the yml file. This should download all necessary packages (including Intel(R) optimized Tensorflow) and prepare the environement.
```
conda env create -f pytorch1.8-cpu-py38.yml
```
2. Clone the Huggingface transformer library using
```
git clone https://github.com/huggingface/transformers.git
```
3. Checkout version v4.3.3
```
git checkout v4.3.3
```
4. Copy the scripts into the transformers example directory.
```
cp finetune.sh transformers/examples/text-classification/
cp eval.sh transformers/examples/text-classification/
cd transformers/examples/text-classification/
```
5. Finetune BERT-base model. *Note:* This step can be acclerated using Pytorch-gpu version. We are more interested in the evaluation phase that comes next.  
```
./finetune.sh
```
6. Enable DNNL_VERBOSE flag. Use `export` if you are using bash shell.
```
export DNNL_VERBOSE=2
```
8. Evaluate the model using
```
./eval.sh
```
