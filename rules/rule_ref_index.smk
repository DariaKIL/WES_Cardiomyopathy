configfile: "config.yaml"

rule ref_index:
    input: 
        "/home/daria/Documents/Project2/hs37d5.fa"
    output: 
        "hs37d5.fa.fai"
    threads:
        4
    shell: "samtools faidx {input} -o {output}"
