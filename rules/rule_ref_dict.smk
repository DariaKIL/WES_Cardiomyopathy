configfile: "config.yaml"

rule ref_dict:
    input: 
        ref = config["genome"],
    output: 
        ref_dict = "home/daria/Project2/GRCh37.primary_assembly.genome.dict",
    threads:
        14
    shell: "gatk CreateSequenceDictionary -R {input} -O {output}"