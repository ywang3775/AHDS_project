# AHDS_project

This project analyzes trends in COVID-19 research publications using data retrieved from PubMed. The pipeline automates data downloading, processing, and visualization using SnakeMake, Bash, and R.

## **Environment**

This code was run on a Macbook Pro (Sequoia 15.1), in bash and R version 4.4.1.

It was also run on bluecrystal4.

The R environment is recorded in the AHDS_environment.yml file in this directory. To create this environment in Conda, use:

```bash
conda env create -f AHDS_environment.yml
conda activate AHDS_env
```

Note that this environment was initially created with:

```bash
conda create -n AHDS_env
conda activate AHDS_env
conda install r-base=4.4.1 r-tidyverse=2.0.0 r-janitor=2.2.0
conda export --from-history > AHDS_environment.yml
```


