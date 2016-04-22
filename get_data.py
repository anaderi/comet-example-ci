#!/usr/bin/env python3
import pandas as pd
import openml
# amueller's read/write key that he will throw away later
openml.config.apikey='610344db6388d9ba34f6db45a3cf71de'

def save_csv(openml_id, file_name):
    dataset = openml.datasets.get_dataset(openml_id)
    data, attribute_names = dataset.get_data(
        return_attribute_names=True)
    pd.DataFrame(data=data, columns=attribute_names).to_csv(
        file_name, index=False)


def main():
    save_csv(23394, "train.csv")
    save_csv(23396, "test.csv")
    
if __name__ == "__main__":
    main()
