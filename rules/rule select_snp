configfile: "config.yaml"

rule select_snp:
    input:
	    vcf_file = "home/daria/Documents/Project2/SoCHR22_hg19.vcf" 
	    ref = config["genome"]
    output:
	    raw_snps = "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf" 
    shell: "gatk -T SelectVariants -R {input.ref} -V {input.vcf_file} -selectType SNP -o {output}"