ENV["JuLearnBackend"]="native"
using JuLearn#,Plots
@Eval lr=0.01 δ=0. momentum=0. batchsize=50 ▽max=0.01 λ=0.0
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider()
net=chain([:d,:h,:h,:l],[1 1;1 1000;1000 1;1 1],:regression);
@time err=backprop(net,inputBase,outputBase,nIter=1000)

# plot(err)
# plot(inputBase',predict(net,inputBase)')
# plot!(inputBase',outputBase')
