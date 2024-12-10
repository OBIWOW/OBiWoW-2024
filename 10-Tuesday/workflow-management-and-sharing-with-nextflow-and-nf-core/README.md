# Workflow management and sharing with Nextflow and nf-core
Managing bioinformatics workflows (e.g. sequencing analysis pipeline) is a central problem for many of us. Simple bash scripts are maybe easy to write, but hard to run and maintain. Snakemake is a good solution for reproducibility and automation, but it is hard to reuse its components. Nextflow is a workflow manager tool like Snakemake, but solves those problems too that make Snakemake sometimes difficult to run. The price to pay is that getting into Nextflow might be hard. Here, we would like to reduce the initial time investment and help you understand the main concepts while you try building a small pipeline.

## Instructors
Katalin Ferenc, Ieva Rauluseviciute

## Live Troubleshooting Session

Katalin Ferenc is inviting you to a scheduled Zoom meeting.

Topic: Nextflow setup
Time: Dec 9, 2024 03:00 PM Oslo

Join Zoom Meeting
https://uio.zoom.us/j/69099897749?pwd=rVKCgvAoqtCXsHdb73lx97Bb5Xbx19.1

Meeting ID: 690 9989 7749
Passcode: 141917

## Software Requirements

Nextflow and nf-core to be installed.

To clone this repository:

```bash
git https://github.com/OBIWOW/OBiWoW-2024.git

cd OBiWoW-2024
```

To create and enter a conda environment:

```bash
conda env create --file nf-core.yaml -n obiwow2024

conda activate obiwow2024
```

### How to do it without the environment? ###

If the environment doesn't work or you don't want to create one, just install Nextflow and nf-core yourself and make sure they are available on a path. You can check the success of installation with ```nextflow -h``` and ```nf-core -h```.

#### Nextflow ####

Install Nextflow following instructions here:

```bash
https://www.nextflow.io/docs/latest/install.html
```

#### nf-core ####

Install with pip:

```bash
pip install nf-core
```