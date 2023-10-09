#!/bin/sh

for i in {3..10}
do
    # Baselines
    # ---------
    # Using Structure
    # ---------------
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression

    # Using features instead of structure
    # -----------------------------------
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true 
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true 
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_features=true
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_features=true
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_features=true

    # Using adjacency and features concatenated
    # -----------------------------------
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true

    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Diffusion --use_concat=true
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=KNN --embedding_method=true --use_concat=true
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=Logistic_regression --use_concat=true
    

    # GNNs
    # ----
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=cora --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=citeseer --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=pubmed --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=cs --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=actor --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=photo --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=cornell --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=wisconsin --undirected=true --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=wikivitals --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=wikivitals-fr --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=wikischools --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCN
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GraphSage
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GAT
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=SGC
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=jumpingknowledge
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=GCNII
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=APPNP
    python main.py --dataset=wikivitals+ --undirected=false --penalized=true --randomstate=8 --k=$i --stratified=true --model=H2GCN

done