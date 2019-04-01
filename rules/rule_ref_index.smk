configfile: "config.yaml"

rule ref_index:
    input: 
        ref = config["genome"],
    output: 
        ref_fai = "home/daria/Project2/GRCh37.primary_assembly.genome.fa.fai",
    threads:
        14
    shell: "samtools faidx {input}"