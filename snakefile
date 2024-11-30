
raw_dir = "raw/"
clean_dir = "clean/"
scripts_dir = "scripts/"

rule all:
    input:
        clean_dir + "keyword_trends_plot.png",

rule step1:
    output:
        raw_dir + "pmids.xml"
    shell:
        """
        bash {scripts_dir}/step1.sh
        """

rule step2:
    input:
        raw_dir + "pmids.xml"
    output:
        clean_dir + "processed_titles.tsv"
    shell:
        """
        bash {scripts_dir}/step2.sh
        """

rule step3:
    input:
        clean_dir + "processed_titles.tsv"
    output:
        clean_dir + "processed_tidy_titles.tsv"
    shell:
        """
        Rscript {scripts_dir}/step3.R
        """

rule step4:
    input:
        clean_dir + "processed_tidy_titles.tsv"
    output:
        clean_dir + "keyword_trends_plot.png",
    shell:
        """
        Rscript {scripts_dir}/step4.R
        """