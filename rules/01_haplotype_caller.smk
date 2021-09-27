configfile: work_dir + '/config.yaml'

rule haplotype_caller:
    input: 
        files = work_dir + '/ExomesData/{sample}.bam',
        bai = work_dir + '/ExomesData/{sample}.bam.bai',
        fai = ref +'.fai',
        dict = reference_path + reference_name + '.dict'
    output: 
        work_dir + '/output/{sample}.g.vcf.gz',
    params: 
        ref
    threads: 
        14
    shell: 
        r"""
        gatk --java-options "-Xms3032m -Xmx4056m" HaplotypeCaller \
        -I {input.files} \
        -R {params} \
        -O {output} \
        --native-pair-hmm-threads {threads} \
        -ERC GVCF
        """