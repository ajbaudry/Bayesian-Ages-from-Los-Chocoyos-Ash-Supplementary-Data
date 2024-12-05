## Supplementary materials for the article ["A Bayesian age from dispersed plagioclase and zircon dates in the Los Chocoyos ash, Central America"](https://doi.org/10.1016/j.epsl.2024.118826)

To aid in reproducibility, the notebook [LosChocoyos.ipynb]() can be run as a Binder notebook without installing anything:
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ajbaudry/Bayesian-Ages-from-Los-Chocoyos-Ash-Supplementary-Data/HEAD?labpath=LosChocoyos.ipynb)

If reproducing locally in Julia, the provided Project.toml and Manifest.toml specify the versions of all package dependencies.

Los_Chocoyos_Bayesian folder contains:
    - Chocoyos_All: Produces Bayesian ages for Ar-Ar and both U-Th datasets including all U-Th data from Cisneros de Leon et al. (2021).
    - Chocoyos_Pumice_Rim_Only: Produces Bayesian ages for Ar-Ar and both U-Th datasets including only pumice zircon rim data from from Cisneros de Leon et al. (2021).
    - Raw_Cisneros_Samples: Produces Bayesian ages for each of the "raw" on non-recalculated U-Th data from Cisneros de Leon et al. (2021).
    - Recalc_Cisneros_Samples: Produces Bayesian ages for each of the U-Th samples recalculated from Cisneros de Leon et al. (2021).
    - LosChocoyos.ipynb: Can be run as a Binder notebook as above
    - Manifest.toml: Source file for running julia locally
    - Project.toml: Source file for running julia locally

Supplemental_Data zip file contains:
    - USGS_Model_Age: Contains the USGS spreadsheet that was used for the U-Th data recalculation for data from Cisneros de Leon et al. (2021).
    - Integrated_Ages: Contains this Ar-Ar and U-Th age datasets from Baudry et al. (2024) and the recalculated U-Th ages from Cisneros de Leon et al. (2021).
    - Table S1 U-Th_Supplemental materials: Contains the updated U-Th ages from Baudry et al. (2024)