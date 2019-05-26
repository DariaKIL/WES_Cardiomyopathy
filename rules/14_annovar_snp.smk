configfile: '/home/kilina_da/project-ib/config.yaml'

rule anovar_snp:
    input:
        "work_dir + '/kilina_da/output/norm_filter_snp_left_combine_genotype.vcf'" 
    output:
        "work_dir + '/kilina_da/output/snp_myanno.hg19_multianno.vcf'"
    params:
        ref,
        vcf = "work_dir + '/kilina_da/output/snp_myanno'",
        operation = "g,f,f,f,f",
        buildver = "hg19",
        protocol="refGene,cytoBand,exac03,clinvar_20160302,dbnsfp30a",                
        db = "~/annovar/humandb/",
    threads:
        14
    shell:
        r"""
        perl ~/annovar/table_annovar.pl \
        {input} \
        {params.db} \
        -buildver {params.buildver} \
        -outfile {params.vcf} \
        --protocol {params.protocol} \
        --operation {params.operation} \
        -thread {threads} \
        -remove \
        -nastring
        -vcfinput
        """
