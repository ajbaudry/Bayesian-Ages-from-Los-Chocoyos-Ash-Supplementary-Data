## Supplementary materials for the article ["A Bayesian age from dispersed plagioclase and zircon dates in the Los Chocoyos ash, Central America"](https://doi.org/10.1016/j.epsl.2024.118826)

Contents of Repository:

    Supplemental Materials_S1.docx

    Table S1 U-Th_Supplemental material.xlsx

    Table S2 Ar-Ar_Summary_Supplemental materials.xlsx

    Los Chocoyos Ash Bayesian
        chocoyos.jl # Julia script for the Los Chocoyos Bayesian Approach
        LosChocoyos_Combined_Data.xlsx  # Spreadsheet containing both Ar-Ar and U-Th ages for the Los Chocoyos Ash

    Younger Toba Tuff Bayesian 
        YoungestTobaTuff.jl # Julia script for the Younger Toba Tuff Bayesian Approach
        YTT_Combined_Data.xlsx  # Spreadsheet containing both Ar-Ar and U-Th ages for the Younger Toba Tuff

    Monte Carlo Simulation
        overlap.jl  # Julia script of the Monte Carlo Simulation for the overlap of the Younger Toba Tuff and Los Chocoyos Ash

    Ar Closure Distribution Bootstrapping
        ArClosureDistribution.jl    # Julia script for the Ar-Ar closure distribution for various eruptions
        ArClosureDistribution.xlsx  # Spreadsheet containing the different Ar-Ar data
        Ar-Ar-Compilation Folder    # Folder containing source spreadsheets for the different Ar-Ar data used in the Ar Closure Distribution
    

    To aid in reproducibility, the notebook [LosChocoyos.ipynb]() can be run as a Binder notebook without installing anything:
        [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ajbaudry/Bayesian-Ages-from-Los-Chocoyos-Ash-Supplementary-Data/HEAD?labpath=LosChocoyos.ipynb)


    If reproducing locally in Julia, the provided Project.toml and Manifest.toml specify the versions of all package dependencies.
