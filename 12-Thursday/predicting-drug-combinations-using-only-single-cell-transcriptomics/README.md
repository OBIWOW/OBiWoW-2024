# Predicting Drug Combinations Using Single-Cell Transcriptomics

The challenge of cancer treatment lies in the vast number of potential drug combinations and dosing options. Each cancer type presents unique biological characteristics, and tumors often consist of diverse cell populations that respond differently to therapies. This complexity creates a computational explosion in identifying the most effective treatments, underscoring the need for advanced computational tools.

## Introducing **scTherapy**
We present **scTherapy**, a machine learning tool designed to tackle these challenges. By leveraging single-cell transcriptomic profiles, scTherapy identifies patient-specific treatment options that:

- **Target multiple cancer subclones** effectively.
- **Minimize harm to normal cells**, ensuring low toxicity.
- Optimize treatment through data-driven prioritization of multi-targeting therapies.

### Key Results
- **96%** of predicted multi-targeting treatments demonstrate **selective efficacy** or **synergy**.
- **83%** exhibit **low toxicity**, ensuring safer treatment options.

## Learning Outcomes
Participants will:
- Understand scTherapy's innovative approach to analyzing **single-cell RNA sequencing (scRNA-seq)** data.
- Explore how phenotypic response profiles are used to identify therapies targeting specific tumor subclones, addressing intra- and inter-patient heterogeneity.
- Gain hands-on experience with the **pre-trained machine learning model** in scTherapy, learning to predict compound and dose pairs tailored for individual patients with **solid or hematological malignancies**.


## Instructors
**Kristen Nader**  [kristen.nader@helsinki.fi](mailto:kristen.nader@helsinki.fi)

---

## Live Troubleshooting Session

Time: Dec 9, 2024 01:00 PM Oslo
https://helsinki.zoom.us/j/69094091120?pwd=NAwZ4uOUOwXEJNO3Gq5ZzSIiHlfAJx.1 

Meeting ID: 690 9409 1120
Passcode: 968062

---

## Software Requirements
You can either run this locally (R) or through a docker.
Recommendation: docker

### Pull the scTherapy v5 Docker Image
Download the latest **scTherapy** Docker image from Docker Hub: https://hub.docker.com/r/kmnader/sctherapy_v5

We will mount to a local directory so all output can be readily viewed.
```bash
# Pull the scTherapy v5 Docker image from Docker Hub https://hub.docker.com/r/kmnader/sctherapy_v5
docker pull kmnader/sctherapy_v5
# Run docker (Ensure that the directory /absolute/path/sctherapy_dir exists on your machine)
docker run -it --name sctherapy_docker -v /absolute/path/sctherapy_dir:/home kmnader/sctherapy_v5:latest bash  
```

