
# Compare the Bayesian eruption ages for different subsets of the Cisneros et al. dataset
## --- Set number of steps and burnin
using Plots, Chron

N = 2*10^7
burnin = 10^4

stepify(x::AbstractVector) = vec(vcat(x', x'))
stepifyedges(x::AbstractVector) = vec(vcat(x[1:end-1]', x[2:end]'))

## --- G17-23 pumice zircon rims
# "Zircon rims (outermost face) from Los Chocoyos ignimbrite pumice (latitude 14.74897, longitude -90.97638)"
# σ is +1sigma uncertainty
G17_23_rims = (;
    sample_id = ["G17-23@2", "G17-23@3", "G17-23@4", "G17-23@5", "G17-23@6", "G17-23@7", "G17-23@8", "G17-23@10", "G17-23@11", "G17-23@12", "G17-23@14", "G17-23@15", "G17-23@16", "G17-23@17", "G17-23@18", "G17-23@19", "G17-23@20", "G17-23@21", "G17-23@22", "G17-23@23", "G17-23@24", "G17-23@25", "G17-23@26", "G17-23@28", "G17-23@29", "G17-23@30", "G17-23@31", "G17-23@32", "G17-23@33", "G17-23@34", "G17-23@35", "G17-23@36", "G17-23@37", "G17-23@39", "G17-23@40", "G17-23@41", "G17-23@42", "G17-23@43", "G17-23@44", "G17-23@45", "G17-23@46", "G17-23@47", "G17-23@48", "G17-23@49", "G17-23@50", "G17-23@51", "G17-23@52", "G17-23@53", "G17-23@55", "G17-23@56", "G17-23@57", "G17-23@58", "G17-23@59", "G17-23@60",],
    μ = [94.2, 104, 122, 94.4, 83.6, 190, 116, 109, 94.9, 109, 115, 142, 94.3, 97, 99.6, 103, 107, 107, 118, 98.7, 88.5, 91.5, 92.5, 115, 117, 88.5, 84.9, 103, 91.1, 110, 139, 88.4, 88.8, 121, 98.3, 108, 197, 108, 91.8, 101, 95.7, 88.8, 118, 105, 111, 129, 149, 93.5, 89.6, 79.7, 106, 118, 124, 102, ],
    σ = [6.3, 13, 17, 11.4, 10.8, 28, 29, 9, 12.1, 9, 15, 23, 7.6, 8.1, 14.1, 9, 8, 9, 10, 16.9, 13.8, 14.2, 30.5, 15, 11, 18.4, 13.2, 16, 17.9, 17, 22, 17.5, 12.8, 12, 17.9, 18, 62, 18, 6.6, 13, 9.6, 12.3, 19, 24, 20, 33, 28, 11.1, 45.7, 13.5, 23, 26, 29, 17, ],
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
    μ = [105, 108, 234, 94.1, 119, 81.6, 91.5, 105, 119, 106, 93.3, 81.8, 102, 136, 103, 108, 127, 113, 110, 147, 99.4, 156, 109, 94.2, 80.7, 85.1, 136, 150, 86, 136, 114, 120, 87.7, 84.9, 131, ],
    σ = [9, 9, 104, 7.5, 11, 12.6, 16.2, 9, 9, 8, 8.1, 10.3, 13, 16, 12, 13, 12, 11, 8, 22, 37.7, 36, 28, 12.5, 12, 18.7, 18, 21, 6.4, 17, 15, 9, 11.9, 12, 11, ],
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
    μ = [91.9, 160, 140, 99.7, 96.7, 91, 97, 102, 111, 113, 112, 144, 105, 108, 94.2, 102, 82.1, 114, 113, 127, 90.8, 109, 104, 87.1, ],
    σ = [7, 28, 67, 10.4, 8, 6.9, 11.6, 8, 13, 11, 20, 23, 12, 14, 7.7, 13, 9.5, 12, 18, 12, 8.8, 9, 20, 8.3, ],
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
    μ = [87.3, 88.9, 74.3, 80.9, 90, 85.8, 88.4, 92.3, 109, 88.8, 78.6, 94.5, 100, 84.8, 139, 88.3, 117, 83, 107, 87.6, 91.1, 90.4, 90.9, 93.8, ],
    σ = [7.2, 6, 7.2, 5.7, 6, 6.2, 5.9, 8, 9, 6, 10.5, 6.6, 7, 5.3, 20, 6.5, 13, 5.6, 10, 6.9, 9.3, 6.2, 6.5, 6.2, ],
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
