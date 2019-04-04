configfile: "config.yaml"

rule filter_indel:
	indels:
		raw_indels = "home/daria/Documents/Project2/SoCHR22_hg19_indels.vcf",
		ref = config["ref"]["genome"],
	output:
		filt_indels = "home/daria/Documents/Project2/SoCHR22_hg19_filtered_indels.vcf",
	threads:
        	4
	shell: "gatk VariantFiltration -R {input.ref} -V {input.raw_indels} --filterExpression {indels} --filterName my_indel_filter -o {output}"
