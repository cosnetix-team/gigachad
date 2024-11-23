
echo "indexing"
samtools faidx ./reference/hg38.fa

echo "adding defualt read groups for variant calling"
picard AddOrReplaceReadGroups \
  I=./sorted/ERR229775_sorted.bam \
  O=./sorted/ERR229775_sorted_rg.bam \
  RGID=1 \
  RGLB=library1 \
  RGPL=illumina \
  RGPU=unit1 \
  RGSM=sample1

echo "generating reference dictionary"
picard CreateSequenceDictionary R=./reference/hg38.fa O=./reference/hg38.dict


# Default Command
# gatk3 -T HaplotypeCaller \
#   -R ./reference/hg38.fa \
#   -I ./sorted/ERR229775_sorted.bam \
#   -o ./variants/ERR229775_variants.vcf \
#   --genotyping_mode DISCOVERY \
#   -stand_call_conf 30.0 \
#   -variant_index_type LINEAR \
#   -variant_index_parameter 128000

# Recommended Command
echo "indexing sorted sequence"
samtools index ./sorted/ERR229775_sorted_rg.bam

echo "gatk3 variant calling"
gatk3 -T HaplotypeCaller \
  -R ./reference/hg38.fa \
  -I ./sorted/ERR229775_sorted_rg.bam \
  -o ./variants/ERR229775_variants.vcf \
  -stand_call_conf 30.0



