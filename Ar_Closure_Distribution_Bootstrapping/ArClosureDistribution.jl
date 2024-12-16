## -- Load packages

    cd(@__DIR__)
    using Chron, Plots
    using LsqFit: curve_fit
    using KernelDensity: kde
    using DelimitedFiles

## --- Define sample properties  - - - - - - - - - - - - - - - - - - - - - - - -

    nSamples = 11 # How many samples we have
    smpl_ArAr = NewStratAgeData(nSamples)
    smpl_ArAr.Name = ("KBS", "Gele", "Chari", "Malbe", "Oxaya MZF16", "Molinos MZ707", "Cardones MZ10P", "Poconchile MZ317", "Mesa Falls 90116", "Mesa Falls 90118", "Bishop Tuff", ) # "Los Chocoyos",
    smpl_ArAr.Path = "Ar-Ar-Compilation/" # Where are the data files?,
    smpl_ArAr.inputSigmaLevel = 1 # i.e., are the data files 1-sigma or 2-sigma. Integer.
    smpl_ArAr.Age_Unit = "Ma" # Unit of measurement for ages and errors in the data files,

    plotname = ("KBS (Phillips et al. 2023)", "Gele (Phillips et al. 2023)", "Chari (Phillips et al. 2023)", "Malbe (Phillips et al. 2023)", "Oxaya (van Zalinge et al. 2022)", "Molinos (van Zalinge et al. 2022)", "Cardones (van Zalinge et al. 2022)", "Poconchile (van Zalinge et al. 2022)", "MFT airfall (Ellis et al. 2017)", "MFT ignimbrite (Ellis et al. 2017)", "Bishop Tuff (Andersen et al. 2017)", ); # "Los Chocoyos (this study)",

## --- Boostrap relative closure age distribution  - - - - - - - - - - - - - - -

    xmin = 0.03; # Slight additional truncation to ensure we aren't seeing excess analytical uncertainty
    dist = BootstrapCrystDistributionKDE(smpl_ArAr, cutoff=xmin)
    dist = dist./nanmean(dist) # Normalize
    trel = range(0,1,length=length(dist)) # X-axis
    h3 = plot(xlims=(0,1),
        xlabel="Relative Age [arbitrary units]",
        ylabel="Probability Density",
        fg_color_legend=:white,
        framestyle=:box,
        fontfamily=:Helvetica,
    )
    plot!(h3, trel, dist, label="Bootstrapped closure distribution",linewidth=2)

    # Exponential survivorship model suggests form  y = A*exp(-λ*t)
    # Normalization requires A == λ
    f(x,λ) = λ[1] .* exp.(-λ[1] .* x)
    λ = [5.0,] # initial guess
    fobj = curve_fit(f,trel,dist,λ) # Fit nonlinear model
    λ = fobj.param
    plot!(h3,trel,f(trel,λ), label="Exponential survivorship model",linewidth=2,color=:black)

    # Save to file
    ArClosureDistribution = f(trel,λ)
    writedlm("ArClosureDistribution.csv",f(trel,λ))

## --- Plot individual samples for comparison

    h1 = plot(framestyle=:box,
        xlabel="Relative Age [arbitrary units]",
        ylabel="N",
        xlims=(-0.1, 1.05),
        fg_color_legend=:white,
        fontfamily=:Helvetica,
    )

    h2 = plot(framestyle=:box,
        xlabel="Relative Age [arbitrary units]",
        ylabel="Cumulative Probability",
        xlims=(0, 1),
        ylims=(0, 1),
        fg_color_legend=:white,
        fontfamily=:Helvetica,
    )

    n = 2
    cmap = resize_colormap(viridis,nSamples+n)[1:end-n]

    # Cycle through samples from last to first
    for i = nSamples:-1:1
        # Read data from file
        data = readdlm("$(smpl_ArAr.Path)$(smpl_ArAr.Name[i]).csv",',')
        ages = data[:,1]
        uncert = data[:,2]./smpl_ArAr.inputSigmaLevel

        sI = sortperm(ages, rev=true)
        permute!(ages, sI)
        permute!(uncert, sI)

        # Maximum extent of expected analytical tail (beyond eruption/deposition)
        maxTailLength = nanmean(uncert) * norm_quantile(1-1/(length(ages) + 1))
        included = (ages .- minimum(ages)) .>= maxTailLength
        print("$(smpl_ArAr.Name[i]): $(trunc(sum(included)/length(included)*100, digits=1)) % included ($(sum(included))/$(length(included)))\n")

        l, u = extrema(ages[included])
        x = (ages .- l)/(u-l)
        y = 1:length(ages)

        plot!(h1, x, y,
            xerror=2*uncert/(u-l),
            color=cmap[i],
            mscolor=cmap[i],
            label="",
            seriestype=:scatter,
            alpha=0.15,
        )
        plot!(h1, x[included], y[included],
            xerror=2*uncert[included]/(u-l),
            color=cmap[i],
            mscolor=cmap[i],
            label=plotname[i],
            seriestype=:scatter,
            alpha=0.85,
        )

        x = (ages[included] .- l)/(u-l)
        y = range(0,1,length=count(included))
        plot!(h2, x, y,
            color=cmap[i],
            mscolor=cmap[i],
            label=plotname[i],
            linewidth=1.5,
            alpha=0.85,
        )

        kd = kde(x,npoints=2^10,bandwidth=nanmean(uncert[included])/(u-l))
        # kd = kde(x,npoints=2^10)

        t = kd.x .> xmin
        dist = kd.density[t]
        dist = dist./nanmean(dist)

        # Plot bootstrapped distribution
        plot!(h3,range(0,1,length=length(dist)),dist,
            label=plotname[i],
            linecolor=cmap[i],
            linealpha=0.35,
            linewidth=0.75,
        )
    end

    # # Our new sample (not included in means)
    # let
    #     # Read data from file
    #     data = readdlm("$(smpl_ArAr.Path)Los Chocoyos.csv",',')
    #
    #     ages = data[:,1]
    #     uncert = data[:,2]./smpl_ArAr.inputSigmaLevel
    #
    #     sI = sortperm(ages, rev=true)
    #     permute!(ages, sI)
    #     permute!(uncert, sI)
    #
    #     # Maximum extent of expected analytical tail (beyond eruption/deposition)
    #     maxTailLength = nanmean(uncert) * norm_quantile(1-1/(length(ages) + 1))
    #     included = (ages .- minimum(ages)) .>= maxTailLength
    #     included = trues(length(ages))
    #     print("Los Chocoyos: $(trunc(sum(included)/length(included)*100, digits=1)) % included\n")
    #
    #     l, u = extrema(ages[included])
    #     x = (ages .- l)/(u-l)
    #     y = 1:length(ages)
    #
    #     # plot!(h1, x, y,
    #     #     xerror=2*uncert/(u-l),
    #     #     color=:black,
    #     #     label="",
    #     #     seriestype=:scatter,
    #     #     alpha=0.1,
    #     # )
    #     # plot!(h1, x[included], y[included],
    #     #     xerror=2*uncert[included]/(u-l),
    #     #     color=:black,
    #     #     label="Los Chocoyos (this study)",
    #     #     seriestype=:scatter,
    #     #     alpha=0.5,
    #     # )
    #
    #     x = (ages[included] .- l)/(u-l)
    #     y = range(0,1,length=count(included))
    #     plot!(h2, x, y,
    #         color=:black,
    #         label="Los Chocoyos (this study)",
    #         linewidth=1.5,
    #         linestyle=:dot,
    #     )
    #
    #     kd = kde(x,npoints=2^10,bandwidth=nanmean(uncert[included])/(u-l))
    #     # kd = kde(x,npoints=2^10)
    #     t = kd.x .> xmin
    #     dist = kd.density[t]
    #     dist = dist./nanmean(dist)
    #
    #     # # Plot bootstrapped distribution
    #     # plot!(h3,range(0,1,length=length(dist)),dist,
    #     #     color=:black,
    #     #     label="Los Chocoyos (this study)",
    #     #     # linealpha=0.65,
    #     #     linewidth=0.75,
    #     #     linestyle=:dot,
    #     # )
    # end

    vline!(h1, [0, 1], color=:black, style=:dot, label="")
    savefig(h1,"RankOrderComparison.pdf")
    display(h1)

    savefig(h2,"CDFComparison.pdf")
    display(h2)

    ylims!(h3, 0,10)
    savefig(h3,"BootstrappedClosureDistribution.pdf")
    display(h3)


## --- Plot all together

    hc = plot(h3, h2, h1, layout=(3,1), size=(600,1200))
    savefig(hc, "CombinedClosureDistribution.pdf")
    display(hc)

## --- End of File
