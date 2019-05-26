configfile: '/home/kilina_da/project-ib/config.yaml'

rule snpEff_snp:
    input: work_dir + '/kilina_da/output/combine_genotype.g.vcf.gz',
    output: work_dir + '/kilina_da/output/combine_genotype_snpEff.vcf',
    threads: 14
    shell: 'java -Xmx4g -jar  ~/snpEff/snpEff.jar GRCh37.75 -stats ~/snpEff/html/ {input} > {output}'