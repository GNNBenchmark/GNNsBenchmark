import numpy as np
import os
import pickle
from scipy import sparse

from base import BaseDataset

from ogb.nodeproppred import PygNodePropPredDataset

from sknetwork.data import load_netset, Bunch

import torch
from torch_geometric.data import Data
from torch_geometric.datasets import Planetoid, Coauthor, Actor, Amazon, WebKB
from torch_geometric.utils.convert import from_scipy_sparse_matrix


class PubMedDataset(BaseDataset):
    """ Specific class for """
    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(PubMedDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_netset(self, dataset: str, pathname: str, use_cache: bool = True):
        """Get data in Netset format (scipy.sparse CSR matrices). Save data in Bunch format if use_cache is set to False.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        pathname: str
            Path to data.
        use_cache: bool (default=True)
            If True, use cached data (if existing).

        Returns
        -------
            Bunch object.
        """
        if os.path.exists(os.path.join(pathname, dataset)) and use_cache:
            raise Exception('error')
        else:
            print(f'Load netset data...')
            graph_raw = load_netset('pubmed')
            
            graph = Bunch()
            graph.adjacency = graph_raw.adjacency
            graph.biadjacency = graph_raw.biadjacency
            graph.labels_true = graph_raw.labels

            # Save Netset dataset
            with open(os.path.join(pathname, dataset), 'bw') as f:
                pickle.dump(graph, f)
            print(f'Netset data saved in {os.path.join(pathname, dataset)}')
        
        self.netset = graph
        
        return self.netset

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """

        # Load netset
        graph = load_netset('pubmed')
        adjacency = graph.adjacency
        biadjacency = graph.biadjacency
        labels_true = graph.labels
        # torch.Data object
        data = Data(x=torch.FloatTensor(biadjacency.todense()),
                    edge_index=from_scipy_sparse_matrix(adjacency)[0],
                    y=torch.tensor(labels_true),
                    num_classes=len(np.unique(labels_true)))

        return data


class WikivitalsDataset(BaseDataset):
    """Wikivitals networks: Wikivitals, Wikivitals-fr, Wikischools, Wikivitals+"""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(WikivitalsDataset, self).__init__(dataset, undirected, random_state, k, stratified)
    
    def get_netset(self, dataset: str, pathname: str, use_cache: bool = True):
        """Get data in Netset format (scipy.sparse CSR matrices). Save data in Bunch format if use_cache is set to False.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        pathname: str
            Path to data.
        use_cache: bool (default=True)
            If True, use cached data (if existing).

        Returns
        -------
            Bunch object.
        """
        if os.path.exists(os.path.join(pathname, dataset)) and use_cache:
            with open(os.path.join(pathname, dataset), 'br') as f:
                graph = pickle.load(f)
            print(f'Loaded dataset from {os.path.join(pathname, dataset)}')
        else:
            print(f'Load netset data...')
            graph_raw = load_netset(dataset)
            
            graph = Bunch()
            graph.adjacency = graph_raw.adjacency
            graph.biadjacency = graph_raw.biadjacency
            graph.names = graph_raw.names
            graph.labels_true = graph_raw.labels

            # Save Netset dataset
            with open(os.path.join(pathname, dataset), 'bw') as f:
                pickle.dump(graph, f)
            print(f'Netset data saved in {os.path.join(pathname, dataset)}')
        
        self.netset = graph
        
        return self.netset
    
    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        if not undirected:
            # Load netset
            graph = load_netset(dataset)
            adjacency = graph.adjacency
            biadjacency = graph.biadjacency
            names = graph.names
            labels_true = graph.labels
            # torch.Data object
            data = Data(x=torch.FloatTensor(biadjacency.todense()),
                        edge_index=from_scipy_sparse_matrix(adjacency)[0],
                        y=torch.tensor(labels_true),
                        num_classes=len(np.unique(labels_true)))
        else:
            raise Exception('Wikivitals dataset should be used with argument --undirected=false.')
        
        return data
    
    
class PlanetoidDataset(BaseDataset):
    """Citation networks: Cora, PubMed, Citeseer."""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(PlanetoidDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_netset(self, dataset: str, pathname: str, use_cache: bool = True):
        """Get data in Netset format (scipy.sparse CSR matrices). Save data in Bunch format if use_cache is set to False.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        pathname: str
            Path to data.
        use_cache: bool (default=True)
            If True, use cached data (if existing).

        Returns
        -------
            Bunch object.
        """
        if os.path.exists(os.path.join(pathname, dataset)) and use_cache:
            with open(os.path.join(pathname, dataset), 'br') as f:
                graph = pickle.load(f)
            print(f'Loaded dataset from {os.path.join(pathname, dataset)}')
        else:
            print(f'Building netset data...')
            # Convert dataset to NetSet format (scipy CSR matrices)
            graph = self.to_netset()

            # Save Netset dataset
            with open(os.path.join(pathname, dataset), 'bw') as f:
                pickle.dump(graph, f)
            print(f'Netset data saved in {os.path.join(pathname, dataset)}')
        
        self.netset = graph
        
        return self.netset

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        if dataset == 'cora':
            if not undirected:
                # Load netset
                graph = load_netset(dataset)
                adjacency = graph.adjacency
                biadjacency = graph.biadjacency
                names = graph.names
                labels_true = graph.labels
                # torch.Data object
                data = Data(x=torch.FloatTensor(biadjacency.todense()),
                                edge_index=from_scipy_sparse_matrix(adjacency)[0],
                                y=torch.tensor(labels_true),
                                num_classes=len(np.unique(labels_true)))
            else:
                data = self._to_custom_data(Planetoid(root=f'/tmp/{dataset.capitalize()}',
                                                      name=f'{dataset.capitalize()}'))
        elif dataset in ['pubmed', 'citeseer']:
            data = self._to_custom_data(Planetoid(root=f'/tmp/{dataset.capitalize()}',
                                                      name=f'{dataset.capitalize()}'))

        return data


class CoAuthorDataset(BaseDataset):
    """Co authors dataset: CS and Physics."""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(CoAuthorDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        data = self._to_custom_data(Coauthor(root=f'/tmp/{dataset.capitalize()}',
                                                      name=f'{dataset.capitalize()}'))
        return data
    
    def _to_custom_data(self, dataset):
        """Convert Dataset format from Pytorch to a modifiable Data object."""
        n_nodes = dataset.x.shape[0]
        data = Data(x=dataset.x,
               edge_index=dataset.edge_index,
               num_classes=dataset.num_classes,
               y=dataset.y,
               train_mask=torch.zeros(n_nodes, dtype=torch.bool),
               val_mask=torch.zeros(n_nodes, dtype=torch.bool),
               test_mask=torch.zeros(n_nodes, dtype=torch.bool))
        
        return data
    

class ActorDataset(BaseDataset):
    """Actor datasets (https://pytorch-geometric.readthedocs.io/en/latest/generated/torch_geometric.datasets.Actor.html#torch_geometric.datasets.Actor)"""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(ActorDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        data = self._to_custom_data(Actor(root=f'/tmp/{dataset.capitalize()}'))
        return data


class AmazonDataset(BaseDataset):
    """Amazon datasets (https://pytorch-geometric.readthedocs.io/en/latest/generated/torch_geometric.datasets.Amazon.html#torch_geometric.datasets.Amazon)"""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(AmazonDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        data = self._to_custom_data(Amazon(root=f'/tmp/{dataset.capitalize()}', name=f'{dataset.capitalize()}'))
        return data
    
    def _to_custom_data(self, dataset):
        """Convert Dataset format from Pytorch to a modifiable Data object."""
        n_nodes = dataset.x.shape[0]
        data = Data(x=dataset.x,
               edge_index=dataset.edge_index,
               num_classes=dataset.num_classes,
               y=dataset.y,
               train_mask=torch.zeros(n_nodes, dtype=torch.bool),
               val_mask=torch.zeros(n_nodes, dtype=torch.bool),
               test_mask=torch.zeros(n_nodes, dtype=torch.bool))
        
        return data
    

class WebKBDataset(BaseDataset):
    """WebKB datasets (https://pytorch-geometric.readthedocs.io/en/latest/generated/torch_geometric.datasets.WebKB.html#torch_geometric.datasets.WebKB)"""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(WebKBDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        data = self._to_custom_data(WebKB(root=f'/tmp/{dataset.capitalize()}', name=f'{dataset.capitalize()}'))
        return data
    
    def _to_custom_data(self, dataset):
        """Convert Dataset format from Pytorch to a modifiable Data object."""
        n_nodes = dataset.x.shape[0]
        data = Data(x=dataset.x,
               edge_index=dataset.edge_index,
               num_classes=dataset.num_classes,
               y=dataset.y,
               train_mask=torch.zeros(n_nodes, dtype=torch.bool),
               val_mask=torch.zeros(n_nodes, dtype=torch.bool),
               test_mask=torch.zeros(n_nodes, dtype=torch.bool))
        
        return data


class OGBDataset(BaseDataset):
    """OGBN dataset (https://ogb.stanford.edu/docs/nodeprop/#ogbn-mag), restricted to citations between paper-paper."""

    def __init__(self, dataset: str, undirected: bool, random_state: int, k: int, stratified: bool):
        super(OGBDataset, self).__init__(dataset, undirected, random_state, k, stratified)

    def get_data(self, dataset: str, undirected: bool):
        """Get dataset information.
        
        Parameters
        ----------
        dataset: str
            Dataset name
        undirected: bool
            If True dataset is forced to undirected.
            
        Returns
        -------
            Torch Dataset. """
        data = self._to_custom_data(PygNodePropPredDataset(name=dataset), dataset)
        return data
    
    def _to_custom_data(self, data, dataset):
        """Convert Dataset format from Pytorch to a modifiable Data object."""
        g = data[0]
        if dataset == 'ogbn-mag':
            paper_n_nodes = g.num_nodes_dict.get('paper')
            paper_labels = g.y_dict.get('paper').view(-1)
            paper_n_labels = len(torch.unique(paper_labels))
            edge_index_key = ('paper', 'cites', 'paper')
            data = Data(x=g.x_dict.get('paper'),
                edge_index=g.edge_index_dict[edge_index_key],
                num_classes=paper_n_labels,
                y=paper_labels,
                train_mask=torch.zeros(paper_n_nodes, dtype=torch.bool),
                val_mask=torch.zeros(paper_n_nodes, dtype=torch.bool),
                test_mask=torch.zeros(paper_n_nodes, dtype=torch.bool))
        elif dataset == 'ogbn-products':
            n_nodes = data.x.shape[0]
            data = Data(x=data.x,
            edge_index=data.edge_index,
            num_classes=len(torch.unique(data.y.view(-1))),
            y=data.y.view(-1),
            train_mask=torch.zeros(n_nodes, dtype=torch.bool),
            val_mask=torch.zeros(n_nodes, dtype=torch.bool),
            test_mask=torch.zeros(n_nodes, dtype=torch.bool))
        elif dataset == 'ogbn-arxiv':
            n_nodes = data.x.shape[0]
            data = Data(x=data.x,
            edge_index=data.edge_index,
            num_classes=len(torch.unique(data.y.view(-1))),
            y=data.y.view(-1),
            train_mask=torch.zeros(n_nodes, dtype=torch.bool),
            val_mask=torch.zeros(n_nodes, dtype=torch.bool),
            test_mask=torch.zeros(n_nodes, dtype=torch.bool))

        return data