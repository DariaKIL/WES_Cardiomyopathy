configfile: "config.yaml"

rule snp_filter:
    input:
	    raw_snps = "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf" 
	    ref = config["genome"]
    output:
	    filt_snps = "home/daria/filtered_snps.vcf"
    shell: "gatk -T VariantFiltration -R {input.ref} -V {input.raw_snps} --filterExpression QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0 --filterName my_snp_filter -o {output}"