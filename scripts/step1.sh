
mkdir raw

curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=%22long%20covid%22&retmax=10000" > raw/pmids.xml

mkdir raw/article-data
 
pmids=$(grep "<Id>" raw/pmids.xml | sed -e 's/<Id>//g' -e 's/<\/Id>//g')

for pmid in $pmids; do

curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=${pmid}" > raw/article-data/${pmid}.xml
sleep 1

done
