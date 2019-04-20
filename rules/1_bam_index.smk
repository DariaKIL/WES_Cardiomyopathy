configfile: "config.yaml"

rule bam_index:
    input:
        bam_file = config["bam_file"],
    output:
        bai_file = "home/daria/Documents/Project2/SoCHR22_hg19.bam.bai",
    threads:
        4
    shell: "samtools index {input.bam_file} -o {output}" 