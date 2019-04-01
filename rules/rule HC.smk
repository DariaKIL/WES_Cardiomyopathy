configfile: "config.yaml"

rule_HC:
    input:
	    bam_file = config["bam_file"]
	    ref = config["genome"]
    output:
	    HC = "home/daria/Documents/Project2/SoCHR22_hg19.vcf"
    shell: "gatk -T HaplotypeCaller -I {input.bam_file} -R {input.ref} -o {output.HC}"