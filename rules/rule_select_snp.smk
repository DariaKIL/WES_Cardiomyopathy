configfile: "config.yaml"

rule select_snp:
	input:
		vcf_file = "home/daria/Documents/Project2/SoCHR22_hg19.vcf",
		ref = config["ref"]["genome"],
	output:
		raw_snps = "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf",
	threads:
        	4
    shell: "gatk SelectVariants -R {input.ref} -V {input.vcf_file} -О {output}"
