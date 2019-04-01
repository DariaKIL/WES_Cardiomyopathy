configfile: "config.yaml"

rule filter_indel:
    input:
	    raw_indels = "home/daria/Documents/Project2/SoCHR22_hg19_indels.vcf""
	    ref = config["genome"]
    output:
	    filt_indels = "home/daria/Documents/Project2/SoCHR22_hg19_filtered_indels.vcf"
    shell: "gatk -T VariantFiltration -R {input.ref} -V {input.raw_indels} --filterExpression {indels} --filterName my_indel_filter -o {output}"