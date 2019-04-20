configfile: "config.yaml"

rule snp_filter:
    input:
	    raw_snps = "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf",
	    ref = config["genome"],
    output:
	    filt_snps = "home/daria/filtered_snps.vcf",
	threads:
        14
    shell: "gatk VariantFiltration -R {input.ref} -V {input.raw_snps} --filterExpression {snps} --filterName my_snp_filter -O {output}"