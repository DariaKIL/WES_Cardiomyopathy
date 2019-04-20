configfile: "config.yaml"

rule snp_filter:
    input:
        raw_snps = "home/daria/Documents/Project2/SoCHR22_hg19_snps.vcf",
    output:
        filt_snps = "home/daria/filtered_snps.vcf",
    params:
        ref = config["ref"]["genome"],
    threads:
        4
    shell: "gatk VariantFiltration -R {params.ref} -V {input.raw_snps} --filterExpression {snps} --filterName my_snp_filter -O {output}"
