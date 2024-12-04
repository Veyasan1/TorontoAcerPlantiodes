# Examining the case behind Acer Platanoides' plight on Toronto's Street Trees

## Overview

This repo includes the paper *Examining the case behind Acer Platanoide's plight on Toronto's Street Trees*, as well as all code used to produce the paper. The paper looks at Toronto's street trees and asks if Acer Platanoide's spread can be explained by location.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from OpenData Toronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `data/model_data` contains the dataset that was used in the model, and the resulting data from it.
-   `model` contains the model that was constructed.
-   `other` details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download clean and test the data. Additionally, '05-replications' contains the code used to generate the graphs used in the paper

## Statement on LLM usage

Aspects of the code were troubleshooted with Chat-GPT 3. The entire chat history is available in inputs/llms/usage.txt.
