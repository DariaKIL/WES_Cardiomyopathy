rule snp_filter:
    input:
	    "raw_snps.vcf" 
	    "ref"
    output:
	    "filtered_snps.vcf" 
    shell: "~/Documents/Project2/gatk-4.1.0.0/gatk -T VariantFiltration -R ref -V raw_snps.vcf --filterExpression QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0 --filterName my_snp_filter -o filtered_snps.vcf "