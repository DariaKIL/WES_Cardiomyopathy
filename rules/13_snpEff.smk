configfile: work_dir + '/config.yaml'

rule snpEff_snp:
    input: work_dir + '/output/combine_genotype.g.vcf.gz',
    output: work_dir + '/output/combine_genotype_snpEff.vcf',
    threads: 14
    shell: 'java -Xmx4g -jar  ~/snpEff/snpEff.jar GRCh37.75 -stats ~/snpEff/html/ {input} > {output}'