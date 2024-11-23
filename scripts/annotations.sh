# Method 2: Using sed for Quick In-Place Editing 
# replace chr1 <-> 1 in sample variant file for annotating
sed 's/^chr//; s/ID=chr/ID=/' ./variants/ERR229775_variants.vcf > ./variants/ERR229775_variants_nochr.vcf
