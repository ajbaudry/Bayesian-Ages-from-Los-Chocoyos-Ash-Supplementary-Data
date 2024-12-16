## Supplementary materials for the response to comments on thearticle ["A Bayesian age from dispersed plagioclase and zircon dates in the Los Chocoyos ash, Central America"](https://doi.org/10.1016/j.epsl.2024.118826) 

LosChocoyos.ipynb           % Can be run as a Binder notebook as mentioned below.

Manifest.toml               % Source file for running julia locally as mentioned below.

Project.toml                % Source file for running julia locally as mentioned below.

Supplemental_Data zip file contains:

    - USGS_Model_Age                       % Contains the USGS spreadsheet that was used for the U-Th data recalculation for data from Cisneros de Leon et al. (2021).

    - Integrated_Ages        % Contains this Ar-Ar and U-Th age datasets from Baudry et al. (2024) and the recalculated U-Th ages from Cisneros de Leon et al. (2021).

    - Table S1 U-Th_Supplemental materials               % Contains the updated U-Th ages from Baudry et al. (2024).

    - Supplemental Materials_S1.docx                     % Contains Ar-Ar ages from Baudry et al. (2024).

    - Table S2 Ar-Ar_Summary_Supplemental materials.xlsx % Contains Supplemental methods and figures from Baudry et al. (2024).

Los_Chocoyos_Bayesian folder contains:

    - Chocoyos_All.jl             % Produces Bayesian ages for Ar-Ar and both U-Th datasets including all U-Th data from Cisneros de Leon et al. (2021).

    - Chocoyos_Pumice_Rim_Only.jl % Produces Bayesian ages for Ar-Ar and both U-Th datasets including only pumice zircon rim data from from Cisneros de Leon et al. (2021).

    - Raw_Cisneros_Samples.jl     % Produces Bayesian ages for each of the "raw" on non-recalculated U-Th data from Cisneros de Leon et al. (2021).

    - Recalc_Cisneros_Samples.jl  % Produces Bayesian ages for each of the U-Th samples recalculated from Cisneros de Leon et al. (2021).

Younger_Toba_Tuff_Bayesian Folder:

    - YoungestTobaTuff.jl:    % Julia script for the Younger Toba Tuff Bayesian Approach.

    - YTT_Combined_Data.xlsx: % Spreadsheet containing both Ar-Ar and U-Th ages for the Younger Toba Tuff.

Monte_Carlo_Simulation Folder:

    - overlap.jl % Julia script of the Monte Carlo Simulation for the overlap of the Younger Toba Tuff and Los Chocoyos Ash.

Ar_Closure_Distribution_Bootstrapping Folder:

    - ArClosureDistribution.jl    % Julia script for the Ar-Ar closure distribution for various eruptions.

    - ArClosureDistribution.xlsx  % Spreadsheet containing the different Ar-Ar data.

    - Ar-Ar-Compilation Folder    % Folder containing source spreadsheets for the different Ar-Ar data used in the Ar Closure Distribution.
    

To aid in reproducibility, the notebook [LosChocoyos.ipynb]() can be run as a Binder notebook without installing anything:
    [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ajbaudry/Bayesian-Ages-from-Los-Chocoyos-Ash-Supplementary-Data/HEAD?labpath=LosChocoyos.ipynb)

If reproducing locally in Julia, the provided Project.toml and Manifest.toml specify the versions of all package dependencies.

