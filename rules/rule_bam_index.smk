configfile: "config.yaml"

rule bam_index:
    input: 
        bam_file = config["bam_file"]
    output: 
        bai_fail = "home/daria/Documents/Project2/"SoCHR22_hg19.bam.bai"
    shell: "samtools index {input}"