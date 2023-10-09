# Graph Neural Networks: The Surprising Superiority of Logistic Regression

[Submitted at TheWebConf2024]

This repository contains all the source code for reproducing our experiments.

## Usage

For all experiments, use:
```bash
./run.sh
```

For a specific model, the `main.py` can be used with the following parameters:
```bash
--dataset         Graph dataset {cora, pubmed, ...}
--undirected      If true, force graph to be undirected 
--randomstate     Random state seed (default=8)
--k               Value for k-fold splits
--stratified      If true, perform stratified split in training folds (default=true)
--model           Model name {Diffusion, GCN, ...}
--use_features    [optional] If true, use features as input (for baseline models)
--use_concat      [optional] If true, use concatenation of adajcency and feature matrices as input (for baseline models)
```
