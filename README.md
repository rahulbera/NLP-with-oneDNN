# Problem
We are facing some discrepancies in DNNL verbose log while running NLP models from [Huggingface transformers](https://github.com/huggingface/transformers) library, while using (1) Tensorflow and (2) Pytorch. The common system confugration is mentioned below. The specific framework level configurations are mentioned along with the specific problem.

#### Common System Configuration
* Huggingface Transformers v4.3.3
* Processor: Intel(R) Xeon(R) Gold 5118 CPU @ 2.30GHz
* OS: Ubuntu 18.04.1 LTS 4.15.0-29-generic

## Problem 1: Using Tensorflow v2.4.0
Running BERT-base using tensorflow is not printing *matmul* primitive verbose log from oneDNN. All other primitives (e.g., softmax, sum, and inner_product) are printing verbose log correctly.

#### System Tested
* Tensorflow: intel-tensorflow-avx512==2.4.0
* oneDNN v1.6.4

## Problem 2: Using Pytorch v1.8.0
Running BERT-base using Pytorch is not printing ***any*** verbose log from oneDNN.

#### System Tested
* Pytoch v1.8.0
* oneDNN v1.7.0 (commit `7aed236906b1f7a05c0917e5257a1af05e9ff683`)

## Steps to regenerate the issue
Please follow the README file inside each directory to regenerate the issue.
