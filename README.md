# Bioactive Molecular Networks

Bioactive molecular networks is comprehensive workflow designed by the Dorrestein Lab (UCSD) that integrates MS/MS molecular networking and bioassay into the concept of bioactive molecular networking. The workflow relies on open bioinformatic tools, such MZmine2 [http://mzmine.github.io/] or Optimus [https://github.com/MolecularCartography/Optimus], a Jupyter notebook, and GNPS web-platform (http://gnps.ucsd.edu). The code is released as a Jupyter notebook for easiness and reproducibility. This notebook has been prepared by Dr. Ricardo Silva (UCSD).

## Installation:
### MZmine2:
- Download MZmine2 (version 2.28 minimum) http://mzmine.github.io/

### Optimus:
- Refers to https://github.com/MolecularCartography/Optimus

### Jupyter:
- For the Jupyter notebook: install Jupyter on http://jupyter.org/
- Install R, https://www.r-project.org/ (if needed add the path to your system).
- Download the Jupyter notebook from the GitHub https://github.com/DorresteinLaboratory/Bioactive_Molecular_Networks/ 

### GNPS and Cytoscape:
- You will need to install Cytoscape version 3.4, http://www.cytoscape.org/

## Run the Bioactive Molecular Networks workflow
NB: Template files for each steps are available in the folder TEMPLATE_FILE https://github.com/DorresteinLaboratory/Bioactive_Molecular_Networks/tree/master/TEMPLATE_FILES

### Step 1 - MZmine2 or Optimus:
- MZmine2: Process your data following instructions described in the GNPS data analysis workflow 2.0 (https://bix-lab.ucsd.edu/display/Public/GNPS+data+analysis+workflow+2.0). For the .CSV export module, by default the dedicated Jupyter notebook will use process table including "Export row ID", "Export row m/z", "Export row retention time", and "Peak area". See the template provided.

- Optimus: Refers to https://github.com/MolecularCartography/Optimus

### Step 2 - Jupyter:
- Upload the Jupyter notebook Bioactive_molecular_networks_MZmine2.ipynb or Bioactive_molecular_networks_Optimus.ipynb in your Jupyter environment.
- In Jupyter, add your input file features_quantification_matrix_edited_bioactivity.csv in the same folder. 
- In your Jupyter environment, open the Bioactive_molecular_networks.ipynb Jupyter notebook.
- Run the Jupyter workflow by clicking in menu Cell/Run All, and wait for the notebook to process (should be less than 30 sec).
- Download the output file features_quantification_matrix_transposed_with_significant_correlation_pvalue_corrected.csv

### Step 3 - GNPS and Cytoscape
- Go on http://gnps.ucsd.edu
- Run a Data Analysis job following the GNPS data analysis 2.0 workflow. Important: the molecular networks will be generated from the .MGF file export with MZmine2 or Optimus, and MS-Cluster will not be used. See GNPS documentation https://bix-lab.ucsd.edu/display/Public/GNPS+data+analysis+workflow+2.0 and video tutorials for how to use GNPS https://www.youtube.com/channel/UCufTdDIUPjfoN604Igv_29g/videos
- Import your molecular networks in Cytoscape following GNPS documentation https://bix-lab.ucsd.edu/display/Public/Molecular+Networking+Documentation
- In Cytoscape, import the output table of the Jupyter notebook (features_quantification_matrix_transposed_with_significant_correlation_pvalue_corrected.csv) into your molecular networks.
- In Cytoscape, use the Select function to select the nodes with significant bioactivity.
- In Cytoscape, bypass the style of these nodes as needed.

## Troubleshooting
- If there is an error, make sure your input file are similar as the template provided on GitHub.
https://github.com/DorresteinLaboratory/Bioactive_Molecular_Networks/tree/master/TEMPLATE_FILES
- Rerun the workflow. Try eventually with a template file.
- If an error is still showing. Please raise an issue in GitHub and we will look into this.
