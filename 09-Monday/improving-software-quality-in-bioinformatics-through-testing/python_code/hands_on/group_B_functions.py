import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from pandas.api.types import is_numeric_dtype
from pydeseq2.dds import DeseqDataSet
from pydeseq2.ds import DeseqStats
from typing import Optional
from warnings import warn

def check_counts(
    count_df: pd.DataFrame,
) -> None:
    
    if not np.all(count_df.dtypes.apply(is_numeric_dtype)):
        raise RuntimeError('Data frame contains non-numeric values.')

    if count_df.isna().sum().sum() > 0:
        warn('Matrix contains missing values. Consider adding pseudocounts or '
            'data imputation.')
        

def process_counts(
    count_df: pd.DataFrame,
    pseudocount: int = 1,
    min_counts: int = 10,
) -> pd.DataFrame:
    
    ## Impute missing values using average:
    count_df_mod = count_df.T.fillna(count_df.mean(axis=1)).T

    ## Add pseudocount:
    count_df_mod += pseudocount

    ## Filtering lowly expressed genes:
    keep_genes = (count_df_mod >= min_counts).sum(axis=1) > 0
    count_df_mod = count_df_mod.loc[keep_genes]

    return count_df_mod


def calculate_deg(
    count_df: pd.DataFrame,
    metadata: pd.DataFrame,
    design_factors: str = 'Condition',
) -> pd.DataFrame:

    dds = DeseqDataSet(
        counts = count_df.T,
        metadata = metadata,
        design_factors = design_factors,
    )
    dds.deseq2()
    stat_res = DeseqStats(dds)
    stat_res.summary()

    ## Extract differential expression results
    return stat_res.results_df


def plot_deg_results(
    results: pd.DataFrame,
    ax: Optional[plt.Axes] = None,
) -> plt.Axes:
    
    if ax is None:
        _,ax = plt.subplots(figsize=(6,6))
        
    ax.scatter(
        x=results['log2FoldChange'],
        y=results['padj'].apply(lambda x: -np.log10(x)),
        s=1.5,
        c=['red' if i < 0.05 else 'black' for i in results['padj']],
    )
    ax.set_xlabel('Log2 fold change')
    ax.set_ylabel('-Log10 p-value')
    ax.set_title('DGE results')

    return ax