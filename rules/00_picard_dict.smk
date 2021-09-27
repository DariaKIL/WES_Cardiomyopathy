configfile: work_dir + '/config.yaml'

rule picard_dict:
    input: ref,
    output: reference_path + reference_name + '.dict',
    shell: 'PicardCommandLine CreateSequenceDictionary R={input} O={output}'