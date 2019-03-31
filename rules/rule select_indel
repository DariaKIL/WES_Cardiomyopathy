configfile: "config.yaml"

rule select_indel:
    input:
	    vcf_file = "home/daria/Documents/Project2/SoCHR22_hg19.vcf" 
	    ref = config["genome"]
    output:
	    raw_indels = "home/daria/Documents/Project2/SoCHR22_hg19_indels.vcf"
    shell: "gatk -T SelectVariants -R {imput.ref} -V {imput.vcf_file} -selectType INDEL -o {output}"