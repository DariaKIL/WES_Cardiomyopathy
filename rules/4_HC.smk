configfile: "config.yaml"

rule HC:
    input:
        bam_file = config["bam_file"],
    output:
        vcf = "home/daria/Documents/Project2/SoCHR22_hg19.vcf",
    params: 
        ref = config["ref"]["genome"],
    threads:
        4
    shell: "gatk HaplotypeCaller -I {input.bam_file} -R {params.ref} -O {output.vcf}"
