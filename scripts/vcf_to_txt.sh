bcftools query -f '%ID,%CHROM,%POS,%REF,%ALT,[%GT]\n' ./variants/ERR229775_variants_annotated.vcf \
| awk 'BEGIN {print "ID,Chromosome,Position,Reference,Alternate,Genotype"} {print}' > ./variants/ERR229775_variants.csv
