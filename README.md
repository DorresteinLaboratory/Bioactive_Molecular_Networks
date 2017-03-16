# Bioactive Molecular Networks

Bioactive molecular networks is comprehensive workflow designed by the Dorrestein Lab (UCSD) that integrates MS/MS molecular networking and bioassay into the concept of bioactive molecular networking. The workflow relies on open bioinformatic tools, including Optimus [https://github.com/MolecularCartography/Optimus], a Jupyter notebook, and GNPS web-platform (http://gnps.ucsd.edu). The code is released as a Jupyter notebook for easiness and reproducibility. This notebook has been prepared by Ricardo Silva (UCSD).

## Installation:
Optimus:
- Refers to https://github.com/MolecularCartography/Optimus
Jupyter:
- For the Jupyter notebook: install Jupyter on http://jupyter.org/
- Install R, https://www.r-project.org/ (if needed add the path to your system)
- Download the Jupyter notebook from the GitHub https://github.com/DorresteinLaboratory/Bioactive_Molecular_Networks/ 
GNPS:
- You will need Cytoscape version 3.4, http://www.cytoscape.org/

## Run the Bioactive Molecular Networks workflow
Step 1 - Optimus:
- Refers to https://github.com/MolecularCartography/Optimus

Step 2 - Jupyter:
- Upload the Jupyter notebook Bioactive_molecular_networks.ipynb in your Jupyter environment.
- In Jupyter, add your input file features_quantification_matrix_edited_bioactivity.csv in the same folder. 
- In your Jupyter, open the Bioactive_molecular_networks.ipynb Jupyter notebook.
- Run the Jupyter workflow by clicking in menu Cell/Run All, and wait for the notebook to process (should be less than 30 sec)
- Download the output file features_quantification_matrix_transposed_with_significant_correlation_pvalue_corrected.csv

Step 3 - GNPS:
- Go on http://gnps.ucsd.edu
- Run a Data Analysis job. See GNPS documentation https://bix-lab.ucsd.edu/display/Public/GNPS+Documentation+Page or video tutorials https://www.youtube.com/channel/UCufTdDIUPjfoN604Igv_29g/videos

Troubleshooting
- If there is an error, make sure to use your input file as the same format as template features_quantification_matrix_edited_bioactivity.csv
- Rerun the workflow
- If an error is still showing. Please raise an issue in GitHub and will solve that.
