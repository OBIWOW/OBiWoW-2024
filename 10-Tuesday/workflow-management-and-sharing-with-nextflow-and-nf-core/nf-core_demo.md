# Introduction to nf-core #

We will try a few useful things and get started with nf-core.

## Build and activate the environment ##

Before we start, build and activate nf-core environment.

```bash
## Build the environment
conda env create --name nf-core --file nf-core.yaml

## Activate the environment
conda activate nf-core
```

## Help and list of pipelines ##

You can access all ```nf-core``` parameters with ```nf-core -h```.

You can see all available pipelines with ```nf-core pipelines list```.

## Interface ##

```bash
nf-core interface
```

## Single-cell RNA-seq sample sheetfile ##

```
"https://github.com/nf-core/test-datasets/raw/scrnaseq/samplesheet-2-0.csv"
```

## Demo pipeline ##

Pipeline page [here](https://nf-co.re/demo/1.0.1/).

```bash
mkdir demo_pipeline
cd demo_pipeline

nextflow run nf-core/demo -r 1.0.1 -profile test,apptainer --outdir test_profile

```

## RNA-seq pipeline ##

Pipeline page [here](https://nf-co.re/rnaseq/3.17.0/).

```bash
mkdir rnaseq_pipeline
cd rnaseq_pipeline

nextflow run nf-core/rnaseq -r 3.16.1 -profile test,singularity --outdir test_profile

```