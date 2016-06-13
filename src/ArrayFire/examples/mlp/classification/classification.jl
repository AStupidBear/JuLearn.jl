cd("/home/astupidbear/.julia/v0.4/JuLearn/src/ArrayFire/examples/mlp/classification/")
ENV["JuLearnBackend"]="ArrayFire"
using JuLearn,ArrayFire#,Plots
@Eval lr=1e-2 momentum=0. batchsize=50 λ=0. ▽max=0.2
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider();
net=chain([:d,:h,:h,:p,:l],[2 2;2 10;10 2;2 2;2 2],:classification);
@time err=backprop(net,AFArray(inputBase),AFArray(outputBase),nIter=1000)

using PyPlot;plot(err)
