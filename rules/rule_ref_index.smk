configfile: "config.yaml"

rule ref_index:
    input: 
        ref = config["ref"]["genome"]
    output: 
        ref_fai = "home/daria/Project2/hs37d5.fa.fai"
    threads:
        4
    shell: "samtools faidx {input}"
