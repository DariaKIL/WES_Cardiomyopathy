configfile: work_dir + '/config.yaml'

rule anovar_ind:
    input:
        work_dir + '/output/norm_filter_indel_left_trim_combine_genotype.vcf'
    output:
        work_dir + '/output/indel_myanno.hg19_multianno.vcf'
    params:
        ref,
        vcf = work_dir + '/output/indel_myanno',
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