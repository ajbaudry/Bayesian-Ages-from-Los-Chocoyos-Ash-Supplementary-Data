
# Compare the Bayesian eruption ages for different subsets of the Cisneros et al. dataset
## --- Set number of steps and burnin
    using Chron, Plots

    N = 2*10^7
    burnin = 10^4

    stepify(x::AbstractVector) = vec(vcat(x', x'))
    stepifyedges(x::AbstractVector) = vec(vcat(x[1:end-1]', x[2:end]'))

## --- G17-23 pumice zircon rims
    # "Zircon rims (outermost face) from Los Chocoyos ignimbrite pumice (latitude 14.74897, longitude -90.97638)"
    # σ is +1sigma uncertainty
    G17_23_rims = (;
        sample_id = ["G17-23@2", "G17-23@3", "G17-23@4", "G17-23@5", "G17-23@6", "G17-23@7", "G17-23@8", "G17-23@10", "G17-23@11", "G17-23@12", "G17-23@14", "G17-23@15", "G17-23@16", "G17-23@17", "G17-23@18", "G17-23@19", "G17-23@20", "G17-23@21", "G17-23@22", "G17-23@23", "G17-23@24", "G17-23@25", "G17-23@26", "G17-23@28", "G17-23@29", "G17-23@30", "G17-23@31", "G17-23@32", "G17-23@33", "G17-23@34", "G17-23@35", "G17-23@36", "G17-23@37", "G17-23@39", "G17-23@40", "G17-23@41", "G17-23@42", "G17-23@43", "G17-23@44", "G17-23@45", "G17-23@46", "G17-23@47", "G17-23@48", "G17-23@49", "G17-23@50", "G17-23@51", "G17-23@52", "G17-23@53", "G17-23@55", "G17-23@56", "G17-23@57", "G17-23@58", "G17-23@59", "G17-23@60",],
        μ = [81.544691467, 85.271075107, 86.309357075, 89.524077430, 89.882976190, 89.898431553, 90.112490620, 90.528110007, 91.367540069, 92.607043806, 93.800912188, 92.851070132, 93.275391613, 94.643657399, 95.305515443, 95.157284898, 96.090661585, 96.205768174, 97.303477647, 97.929345225, 100.215551136, 100.203789791, 101.824752121, 102.766156313, 103.931596423, 103.944603557, 103.954116364, 106.285543299, 105.812982187, 108.630639904, 108.233217023, 108.158361211, 112.006250988, 109.832180163, 110.266654042, 110.903509620, 111.374890828, 112.903342614, 117.453364969, 116.420736140, 117.573024049, 119.316013597, 119.123310443, 119.173612558, 119.622777905, 123.464249438, 123.214888917, 125.954854952, 130.668594550, 140.970318206, 143.218754737, 152.310742161, 192.574774890, 200.422257498],
        σ = [12.869706018, 10.399487114, 12.539517362, 16.363942701, 13.086449249, 17.248053792, 12.140039452, 11.755035809, 39.403067228, 16.828350462, 13.554354524, 6.341294618, 27.261664844, 10.652604747, 6.135803114, 7.340705450, 10.903805750, 11.644332421, 9.209316763, 7.860852839, 16.827512333, 15.870547184, 13.452441772, 12.045247390, 15.860344463, 8.235254884, 15.256084360, 12.791648728, 22.336936998, 21.325444761, 7.802288991, 8.419122879, 16.878411304, 16.883354898, 8.734340602, 8.453604092, 15.734017480, 18.315242784, 14.640351089, 13.761963902, 26.525848396, 10.834553003, 9.910254926, 17.895174277, 23.768839071, 11.833451695, 15.859492604, 25.859622508, 29.475114458, 20.131525590, 21.088808980, 25.623437741, 25.364850790, 52.312180670],
    )

    G17_23_rims_dist = metropolis_min(N, HalfNormalDistribution, G17_23_rims.μ, G17_23_rims.σ; burnin)
    G17_23_rims_terupt = CI(G17_23_rims_dist)
    @info "G17-23 pumice zircon rims: $G17_23_rims_terupt"

## --- G17-23 pumice zircon interiors
    # "Zircon interiors (polished grains) from Los Chocoyos ignimbrite pumice (latitude 14.74897, longitude -90.97638)"
    # Excluding two analyses with infinite uncertainties
    # σ is +1sigma uncertainty
    G17_23_interiors = (;
        sample_id = ["G17-23@1", "G17-23@2", "G17-23@3", "G17-23@4", "G17-23@5", "G17-23@6", "G17-23@7", "G17-23@8", "G17-23@9", "G17-23@10", "G17-23@12", "G17-23@13", "G17-23@14", "G17-23@15", "G17-23@16", "G17-23@18", "G17-23@19", "G17-23@20", "G17-23@21", "G17-23@22", "G17-23@25", "G17-23@26", "G17-23@27", "G17-23@28", "G17-23@29", "G17-23@30", "G17-23@31", "G17-23@32", "G17-23@33", "G17-23@34", "G17-23@35", "G17-23@36", "G17-23@37", "G17-23@38", "G17-23@40", ],
    	μ = [83.547496382, 85.554919200, 84.371372032, 88.278450728, 86.836204874, 89.376950839, 90.429022941, 94.021428559, 95.523622714, 95.687170264, 96.998036182, 113.187685170, 104.912520354, 105.570506900, 107.330199793, 106.798937921, 108.273699133, 110.034618104, 111.897629295, 110.671530428, 113.641096669, 118.025382236, 117.232625403, 122.046952279, 121.220247861, 122.064473819, 129.478241015, 134.006017924, 140.320463432, 137.942644718, 137.799688024, 148.498265210, 153.065383985, 171.583436367, 240.439084393],
        σ = [11.411171686, 12.126455592, 9.992483505, 11.481767831, 17.496053579, 5.978353841, 11.333922837, 15.363610553, 7.826624396, 7.259117705, 11.970752156, 33.940013616, 12.469476431, 11.548601048, 9.077514494, 8.314082278, 7.691868598, 9.073637211, 12.536318638, 25.703305416, 7.909731040, 10.548197992, 13.887027461, 10.458721136, 8.834262382, 9.003719203, 11.532557368, 10.459549709, 15.430313483, 16.552867322, 16.357653833, 20.629564561, 19.509546553, 33.836964869, 84.687536326],
    )

    G17_23_interiors_dist = metropolis_min(N, HalfNormalDistribution, G17_23_interiors.μ, G17_23_interiors.σ; burnin)
    G17_23_interiors_terupt = CI(G17_23_interiors_dist)
    @info "G17-23 pumice zircon interiors: $G17_23_interiors_terupt"

## --- G17-4 pumice zircon rims
    # "Zircon rims (outermost face) from Los Chocoyos pumice medial fallout sample (Near Amatitlán caldera)"
    # Excluding three analyses with infinite uncertainties
    # σ is +1sigma uncertainty
    G17_4_rims = (;
        sample_id = ["G17-4_M6@01", "G17-4_M6@02", "G17-4_M6@03", "G17-4_M6@04", "G17-4_M6@05", "G17-4_M6@06", "G17-4_M6@07", "G17-4_M6@08", "G17-4_M6@09", "G17-4_M6@10", "G17-4@2", "G17-4@3", "G17-4@4", "G17-4@5", "G17-4@6", "G17-4@7", "G17-4@8", "G17-4@9", "G17-4@10", "G17-4@11", "G17-4@12", "G17-4@13", "G17-4@14", "G17-4@15", "G17-4@18", "G17-4@19", "G17-4@20", ],
    	μ = [83.161434597, 88.009534912, 91.922817648, 92.943896982, 93.529407421, 95.586317067, 98.481028154, 98.793016980, 101.168216895, 103.773826477, 102.882021688, 105.489322572, 107.097464443, 108.984362925, 110.212138525, 111.732340101, 113.187685170, 113.404373089, 114.928468223, 115.508217775, 129.514452151, 139.275204849, 145.828510607, 158.631647421],
        σ = [9.113126158, 8.062264334, 8.472564608, 6.461482178, 6.301998136, 7.428852335, 7.496089176, 9.917137263, 9.416585036, 7.100249637, 12.439042003, 18.189504018, 11.855608728, 13.471588058, 8.444616911, 11.348200596, 18.372321001, 9.666991176, 16.960581105, 11.284262081, 11.602825264, 50.535051585, 20.879572764, 22.951634385],
    )

    G17_4_rims_dist = metropolis_min(N, HalfNormalDistribution, G17_4_rims.μ, G17_4_rims.σ; burnin)
    G17_4_rims_terupt = CI(G17_4_rims_dist)
    @info "G17-4 pumice zircon rims: $G17_4_rims_terupt"

## --- G17-26 zircon rims
    # "Zircon rims (outermost face) from proximal Los Chocoyos ignimbrite (latitude 14.74897, longitude -90.97638)"
    # Excluding one analysis with infinite uncertainty
    # σ is +1sigma uncertainty
    G17_26_rims = (;
        sample_id = ["G17-26@1", "G17-26@02", "G17-26@04", "G17-26@05", "G17-26@06", "G17-26@07", "G17-26@08", "G17-26@09", "G17-26@10", "G17-26@11", "G17-26@12", "G17-26@13", "G17-26@14", "G17-26@15", "G17-26@16", "G17-26@17", "G17-26@18", "G17-26@19", "G17-26@20", "G17-26@21", "G17-26@23", "G17-26@24", "G17-26@30b", "G17-26@29", "G17-26@27b", ],
        μ = [75.205159608, 79.819749618, 82.315332896, 83.886231976, 85.866550694, 86.630543832, 88.155083211, 88.757648835, 89.597669677, 89.232901534, 89.879908912, 89.823934462, 90.897191316, 91.674514456, 92.054679458, 92.465291289, 93.529407421, 95.125523147, 95.899914144, 101.743480636, 107.687624558, 109.885866808, 118.847809566, 140.015867401],
        σ = [7.034406371, 10.038346187, 5.597792623, 5.473912167, 5.137022962, 6.016046995, 7.000546444, 6.737539974, 6.382723287, 5.730004843, 5.849064815, 5.874958270, 5.810776573, 6.017165605, 6.292885046, 8.989698377, 7.738576639, 6.058715853, 6.371165500, 6.391923516, 9.271207792, 8.250124039, 12.376381592, 18.509198032],
    )
    
    G17_26_rims_dist = metropolis_min(N, HalfNormalDistribution, G17_26_rims.μ, G17_26_rims.σ; burnin)
    G17_26_rims_terupt = CI(G17_26_rims_dist)
    @info "G17-26 zircon rims: $G17_26_rims_terupt"

## --- Plot results
    binedges = 60:0.1:110
    h = plot(xlabel="Age [ka]", 
        ylabel="Probability Density", 
        framestyle=:box,
    )

    bincounts = histcounts(G17_23_rims_dist, binedges)
    bindensity = bincounts ./ (sum(bincounts)*step(binedges)) # Normalize
    plot!(h, stepifyedges(binedges), stepify(bindensity), fill=true, alpha=0.65, label="G17-23 pumice zircon rims: $G17_23_rims_terupt")

    bincounts = histcounts(G17_23_interiors_dist, binedges)
    bindensity = bincounts ./ (sum(bincounts)*step(binedges)) # Normalize
    plot!(h, stepifyedges(binedges), stepify(bindensity), fill=true, alpha=0.65, label="G17-23 pumice zircon interiors: $G17_23_interiors_terupt")

    bincounts = histcounts(G17_4_rims_dist, binedges)
    bindensity = bincounts ./ (sum(bincounts)*step(binedges)) # Normalize
    plot!(h, stepifyedges(binedges), stepify(bindensity), fill=true, alpha=0.65, label="G17-4 pumice zircon rims: $G17_4_rims_terupt")

    bincounts = histcounts(G17_26_rims_dist, binedges)
    bindensity = bincounts ./ (sum(bincounts)*step(binedges)) # Normalize
    plot!(h, stepifyedges(binedges), stepify(bindensity), fill=true, alpha=0.65, label="G17-26 zircon rims: $G17_26_rims_terupt")

    # bincounts = histcounts(Cisneros_pumice_rims_dist, binedges)
    # bindensity = bincounts ./ (sum(bincounts)*step(binedges)) # Normalize
    # plot!(h, stepifyedges(binedges), stepify(bindensity), fill=true, alpha=0.65, label="All pumice zircon rims")

    savefig("CisnerosUTh_eruption_age_comparison.pdf")
    display(h)
