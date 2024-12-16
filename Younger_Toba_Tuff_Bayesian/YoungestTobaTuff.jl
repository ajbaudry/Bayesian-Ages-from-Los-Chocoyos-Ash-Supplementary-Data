using Plots, Chron

StoreyArAr = (;
    μ = [74.81,75.42,72.91,76.91,72.62,78.69,73.11,74.86,74.41,74.44,74.81,74.57,74.49,74.46,73.53,112.60,73.13,75.71,74.85,71.97,74.32,73.46,72.56,73.30,73.90,74.48,82.26,73.70,78.72,67.01,76.31,166.55,74.82,72.84,72.64,74.36,72.42,72.86,74.04,76.42,74.82,71.26,77.16,73.30,71.09],
    σ = [2.47,2.27,3.30,1.54,1.56,1.56,0.90,1.40,1.59,1.61,1.93,0.86,0.81,0.85,0.72,0.55,1.48,1.61,1.47,0.82,0.88,1.05,1.10,1.13,0.94,0.94,1.22,0.91,1.10,1.92,1.96,1.10,1.13,1.49,0.93,1.47,1.37,0.92,1.30,1.04,1.42,1.20,1.58,1.16,1.20],
)

MucekArAr = (;
    μ = [75.5,74.7,77.4,83.6,33.3,53.3,74.3,77.0,76.7,75.2,68.3,162.3,72.2,75.4,75.5,78.4,80.7,69.2,22.6,72.3,71.3,74.6,74.0,74.8,70.5,54.8,83.3,68.1,71.9,74.7,73.6,73.0,73.8,73.8,75.2,73.8,74.5,73.1,74.3,74.4,74.6,74.1,74.3,74.8,73.7,74.0,74.6,74.3,74.3,73.8,74.9,72.4,72.9,73.9,73.9,76.0,74.1,74.9,73.6,74.4,74.7,72.5,74.5,73.0,75.5,71.2,71.5,71.0,76.4,74.4,61.9,71.7,65.5,79.0,76.1,76.8,82.8,82.5,73.1,77.2,73.2,73.2,76.4,75.8,73.8,72.9,73.8,75.5,71.4,72.8,74.2,78.7,71.4,80.1,73.9,76.3,73.6,71.4,200.9,76.4,72.7,73.7,73.9,77.7,77.7,80.1,74.5,73.1,77.4,102.3,108.1,75.7,73.4,72.2,74.1,70.5,74.1,76.1,54.7,82.3,73.5,74.4,74.2,79.0,76.5,76.7,83.5,73.4,76.4,79.7,76.8,69.0,75.7,76.4,80.7,74.8,75.3,75.6,75.1,76.5,76.6,75.2,75.8,73.4,75.8,74.1,95.2,106.9,76.6,74.2,74.6,74.7,74.7,71.5,78.3,170.2,19.9,62.4,72.4,73.9,74.2,75.4,74.6,75.8,77.0,71.4,126.8,70.6,73.4,73.4,74.8,75.6,76.4,55.9,32.5,150.4,74.3,71.8,75.9,70.3,74.5,73.5,57.8,28.2],
    σ = [1.05,1.5,0.95,6.45,27.3,60.1,2,1.15,2.05,2.3,5.7,107.2,4.8,2.2,2.25,5.95,9.6,29.65,201.65,2.75,1.5,2.05,2,1.7,3.15,12.75,26.1,6.45,3.7,2.2,1,0.7,0.7,0.55,0.55,0.55,0.5,0.55,0.5,0.45,0.45,0.45,0.5,0.45,0.5,0.5,0.45,0.5,0.5,0.55,0.75,0.9,1,0.65,0.7,0.75,0.75,0.7,0.95,0.9,1.1,0.65,1.2,1.2,1.55,1.75,2.65,3.4,4.6,3.5,4.75,3.7,7.45,1.100944713,0.76776269,0.851246359,2.878661758,16.79925079,1.05056947,6.463496711,8.791566506,1.938925323,1.866287598,3.049568421,10.57050333,4.321928938,0.7085591,3.188248712,1.864156871,1.127447724,1.023454135,1.539941395,3.27505327,6.481136525,12.77542427,5.189619859,2.102891769,13.70810061,200.6058154,1.704460767,2.620507552,1.274359536,0.900421425,2.189703282,1.776795684,3.612377273,5.320381503,3.699729791,1.030954938,22.83411699,107.8211057,1.789697924,1.405478849,2.187010769,3.229659788,3.337734186,1.9479794,5.456483403,33.32060871,5.760844947,1.082011642,1.577205104,4.510653995,5.803320495,2.705080569,2.130399902,8.967988888,1.227392303,0.710570631,3.449363843,4.545338838,3.646123463,0.959125804,0.916705555,2.559287005,0.580589922,0.841927058,2.440304721,1.174533806,1.278674288,0.592220653,0.433370648,0.451998246,0.815674982,0.592083202,1.174766615,20.28514573,19.66201119,1.042176269,1.357620888,0.722728136,2.542977006,2.455695298,2.791481011,30.47917105,96.45573902,74.53627298,199.5052966,2.067630435,0.751092835,1.217386117,2.040387275,1.144679859,0.958097012,3.398704929,8.187559137,32.99374075,4.268357576,0.945763847,0.608730918,1.347461211,2.386405128,5.171257265,51.44963185,69.24250702,97.22981346,0.579056467,1.243407567,0.998886199,1.883300252,0.706171007,1.865666988,24.17622681,84.39771297],
)

MucekUTh = (;
    μ = [74.5,74.8,79.7,81.5,83.1,89.5,89.6,92.4,94.0,95.8,99.0,114.5,134.8,143.4,151.5,322.5,79.7,85.8,87.6,91.3,93.1,93.6,95.8,98.9,99.6,105.4,108.4,114.9,116.6,122.1,126.9,170.4,174.2,193.3],
    σ = [23.44,21.95,16.71,18.72,28.87,37.80,17.63,31.10,16.98,24.02,21.60,22.30,33.18,28.18,17.99,17.89,34.98,19.35,17.77,20.67,21.40,35.56,27.07,20.42,31.70,42.42,46.81,31.38,43.13,29.62,47.57,23.91,32.36,17.68],
)

TierneyUTh = (;
    μ = [170,121,65,117,94,88,67,75,115,151,71,124,68,96,86,89,133,113,72,72,140,77,71,83,86,142,108,82,127,170,187,126,173,118,190,96,129,71,79,128,218,256,190,155,147,124,135,198,226,120,80,105,101,103,188,89,178,211,93,107,77,98,98,99,115,182,60,99,102,149,94,132,215,137,215],
    σ = [30,36,7,13,8,9,8,16,17,40,7,17,6,14,19,8,38,9,7,12,26,10,10,11,11,32,10,10,10,44,34,21,52,15,52,28,17,12,16,32,41,87,27,61,24,11,13,35,55,12,6,18,10,9,26,12,66,64,10,32,16,15,14,12,19,49,23,14,15,32,14,12,48,44,47],
)

## --- Set up eruption age estimates

N = 10^7
burnin = 10^4
binedges = 40:0.1:90

stepify(x::AbstractVector) = vec(vcat(x', x'))
stepifyedges(x::AbstractVector) = vec(vcat(x[1:end-1]', x[2:end]'))

## --- Collect eruption age estimates

# Storey Ar-Ar
StoreyArArdist = metropolis_min(N, ExponentialDistribution, StoreyArAr.μ, StoreyArAr.σ; burnin)
teruptStoreyArAr = CI(StoreyArArdist)
## --- Plot results
StoreyArArbincounts = histcounts(StoreyArArdist, binedges)
StoreyArArbindensity = StoreyArArbincounts ./ (sum(StoreyArArbincounts)*step(binedges)) # Normalize
hArAr = plot(stepifyedges(binedges), stepify(StoreyArArbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Storey Ar-Ar: $teruptStoreyArAr ka (95%)", framestyle=:box, color=:darkblue, alpha=0.65, legend=:topleft)

# Mucek Ar-Ar
MucekArArdist = metropolis_min(N, ExponentialDistribution, MucekArAr.μ, MucekArAr.σ; burnin)
teruptMucekArAr = CI(MucekArArdist)
## --- Plot results
MucekArArbincounts = histcounts(MucekArArdist, binedges)
MucekArArbindensity = MucekArArbincounts ./ (sum(MucekArArbincounts)*step(binedges)) # Normalize
hMucekArAr = plot(stepifyedges(binedges), stepify(MucekArArbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Storey Ar-Ar: $teruptMucekArAr ka (95%)", framestyle=:box, color=:darkblue, alpha=0.65, legend=:topleft)
ylims!(0, 0.65)
savefig(hArAr, "MucekArAr.pdf")
display(hArAr)

## --- Combine Ar-Ar

ArArdist = (StoreyArArdist + MucekArArdist) / 2
ArArdist = add_systematic_uncert_ArAr(ArArdist./1000)*1000
teruptArAr = CI(ArArdist)
ArArbincounts = histcounts(ArArdist, binedges)
ArArbindensity = ArArbincounts ./ (sum(ArArbincounts)*step(binedges)) # Normalize
hArArcombined = plot(stepifyedges(binedges), stepify(ArArbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Combined ArAr: $teruptArAr ka (95%)", framestyle=:box, color=:darkred, alpha=0.85, legend=:topleft)
savefig(hArArcombined, "ArArcombined.pdf")
display(hArArcombined)

## --- Baudry U-Th
MucekUThdist = metropolis_min(N, HalfNormalDistribution, MucekUTh.μ, MucekUTh.σ; burnin)
teruptMucekUTh = CI(MucekUThdist)
## --- Plot results
MucekUThbincounts = histcounts(MucekUThdist, binedges)
MucekUThbindensity = MucekUThbincounts ./ (sum(MucekUThbincounts)*step(binedges)) # Normalize
hUTh = plot(stepifyedges(binedges), stepify(MucekUThbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Mucek U-Th: $teruptMucekUTh ka (95%)", framestyle=:box, color=:purple, alpha=0.65, legend=:topright)


## --- Cisneros U-Th
TierneyUThdist = metropolis_min(N, HalfNormalDistribution, TierneyUTh.μ, TierneyUTh.σ; burnin)
teruptTierneyUTh = CI(TierneyUThdist)
## --- Plot results
TierneyUThbincounts = histcounts(TierneyUThdist, binedges)
TierneyUThbindensity = TierneyUThbincounts ./ (sum(TierneyUThbincounts)*step(binedges)) # Normalize
hTierneyUTh = plot!(hUTh, stepifyedges(binedges), stepify(TierneyUThbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Tierney U-Th: $teruptTierneyUTh ka (95%)", framestyle=:box, color=:darkred, alpha=0.65)
ylims!(0,0.12)
savefig(hUTh, "UTh.pdf")
display(hUTh)

## --- Combine U-Th

UThdist = (MucekUThdist + TierneyUThdist) / 2
UThdist = add_systematic_uncert_UTh(UThdist./1000)*1000
teruptUTh = CI(UThdist)
UThbincounts = histcounts(UThdist, binedges)
UThbindensity = UThbincounts ./ (sum(UThbincounts)*step(binedges)) # Normalize
hUThcombined = plot(stepifyedges(binedges), stepify(UThbindensity), fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Combined U-Th: $teruptUTh ka (95%)", framestyle=:box, color=:darkred, alpha=0.85, legend=:topleft)
savefig(hUThcombined, "UThcombined.pdf")
display(hUThcombined)

## ---

h = plot(hArAr, hUTh, layout=(2,1), size=(600,750), leftmargin=(3,:mm))
savefig(h, "combined.pdf")
display(h)

## ---

μUTh, σUth, mswd = wmean([teruptMucekUTh.mean, teruptTierneyUTh.mean], [teruptMucekUTh.sigma, teruptTierneyUTh.sigma], corrected=true)
println("Combined U-Th: $μUTh ± $(2σUth)")

μArAr, σArAr, mswd = wmean([teruptMucekArAr.mean, teruptStoreyArAr.mean], [teruptMucekArAr.sigma, teruptStoreyArAr.sigma], corrected=true)
println("Combined Ar-Ar: $μArAr ± $(2σArAr)")

μ, σ, mswd = wmean([μArAr, μUTh], [σArAr, σUth], corrected=true)
println("Combined overall: $μ ± $(2σ)")

## ---

combindeddist = distwmean(ArArdist, UThdist)
terupt = CI(combindeddist)
hcombined = histogram(combindeddist, normalized=true, fill=true, xlabel="Age [ka]", ylabel="Probability Density", label="Combined: $terupt", framestyle=:box, color=:darkblue, alpha=0.65)
savefig(hcombined, "combined_distribution.pdf")
display(hcombined)
println("Combined, no mswd correction: $terupt (95% CI)")


