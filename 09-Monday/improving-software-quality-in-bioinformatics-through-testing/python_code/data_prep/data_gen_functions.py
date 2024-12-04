import numpy as np
import pandas as pd

from pathlib import Path
from typing import Optional, Tuple

def generate_counts(
    output_path: Path,
    number_of_genes: int = 1000,
    number_of_samples: int = 10,
    rng: Optional[np.random.Generator] = None,
    seed: Optional[int] = None,
) -> pd.DataFrame:

    if rng is None:
        rng = np.random.default_rng(seed)

    counts = rng.integers(0, 100, size=(number_of_genes, number_of_samples), 
        endpoint=True)
    colnames = [f'Sample{i}' for i in range(1, number_of_samples+1)]
    rownames = [f'Gene{i}' for i in range(1, number_of_genes+1)]
    count_df = pd.DataFrame(counts, index=rownames, columns=colnames)

    count_df.to_pickle(output_path)

    return count_df


def generate_metadata(
    metadata_output_path: Path,
    condition_vector = ['Control', 'Treatment'],
    number_of_samples: int = 10,
    rng: Optional[np.random.Generator] = None,
    seed: Optional[int] = None,
) -> pd.DataFrame:
    
    if rng is None:
        rng = np.random.default_rng(seed)
    
    conditions = rng.choice(condition_vector, number_of_samples)
    colnames = [f'Sample{i}' for i in range(1, number_of_samples+1)]
    metadata = pd.DataFrame(conditions, index=colnames, columns=['Condition'])

    metadata.to_csv(metadata_output_path, sep='\t')

    return metadata


def generate_counts_with_metadata(
    counts_output_path: Path,
    metadata_output_path: Path,
    number_of_genes: int = 1000,
    number_of_samples: int = 10,
    condition_vector = ['Control', 'Treatment'],
    rng: Optional[np.random.Generator] = None,
    seed: Optional[int] = None,
) -> Tuple[pd.DataFrame, pd.DataFrame]:

    if rng is None:
        rng = np.random.default_rng(seed)
    
    count_df = generate_counts(counts_output_path, number_of_genes, 
        number_of_samples, rng)
    metadata = generate_metadata(metadata_output_path, condition_vector, 
        number_of_samples, rng)
    
    return (count_df, metadata)