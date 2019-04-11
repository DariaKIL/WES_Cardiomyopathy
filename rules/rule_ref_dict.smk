configfile: "config.yaml"

rule ref_dict:
    input: 
        ref = config["ref"]["genome"],
    output: 
        ref_dict = "home/daria/Project2/hs37d5.dict",
    threads:
        4
    shell: "gatk CreateSequenceDictionary -R {input.ref} -O {output.ref_dict}"
