using Distributions
YTT = Normal(73.9, 0.3)
LC = Normal(75, 2)

N = 10^9

n10 = 0
n100 = 0
for i in 1:N
    Δ = abs(rand(YTT) - rand(LC)) * 1e3
    if  Δ < 10
        n10 += 1
        n100 += 1
    elseif Δ < 100
        n100 += 1
    end
end
        
@info "Overlapping within 10 years $(n10/N*100) % of the time"
@info "Overlapping within 100 years $(n100/N*100) % of the time"
