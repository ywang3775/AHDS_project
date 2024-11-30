
mkdir clean

output_file="clean/processed_titles.tsv"

echo -e "PMID\tYear\tTitle" > "$output_file"

for file in raw/article-data/*.xml; do

pmid=$(basename "$file" .xml)

year=$(sed -n 's:.*<Year>\([0-9]\{4\}\)</Year>.*:\1:p' "$file" | head -n 1)

title=$(sed -n 's:.*<ArticleTitle>\(.*\)</ArticleTitle>.*:\1:p' "$file")

if [[ -z "$title" ]]; then

 continue

fi

title=$(echo "$title" | sed 's/<[^>]*>//g')

echo -e "$pmid\t$year\t$title" >> "$output_file"

done






