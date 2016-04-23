rule get_data_openml:
    output:
        "train.csv", "test.csv"
    shell:
        "python get_data.py"

rule get_data_cern:
    output:
        "train.csv", "test.csv"
    shell:
        "bash get_data_cern.sh"

ruleorder: get_data_cern > get_data_openml
    
rule run_ml:
    input:
        "train.csv", "test.csv"
    output:
        "ml_score.dat"
    shell:
        "runipy COMET\ -\ ML.ipynb"

rule run_manual:
    input:
        "train.csv", "test.csv"
    output:
        "manual_score.dat"
    shell:
        "runipy COMET\ -\ manual.ipynb"
