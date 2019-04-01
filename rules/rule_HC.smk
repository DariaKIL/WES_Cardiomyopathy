configfile: "config.yaml"

rule HC:
    input:
	    bam_file = config["bam_file"],
	    ref = config["genome"],
    output:
	    HC = "home/daria/Documents/Project2/SoCHR22_hg19.vcf",
	 threads:
        14
    shell: "gatk HaplotypeCaller -I {input.bam_file} -R {input.ref} -O {output.HC}"
