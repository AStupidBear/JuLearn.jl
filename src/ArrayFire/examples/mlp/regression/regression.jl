cd("/home/astupidbear/.julia/v0.4/JuLearn/src/ArrayFire/examples/mlp/regression")
ENV["JuLearnBackend"]="ArrayFire"
using JuLearn,ArrayFire#,Plots
@Eval lr=0.1 δ=0. momentum=0. batchsize=50 ▽max=0.1 λ=0.0
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider();
net=chain([:d,:h,:h,:l],[1 1;1 1000;1000 1;1 1],:regression);
@time err=backprop(net,AFArray(inputBase),AFArray(outputBase),nIter=300)

using PyPlot;
figure();plot(err)
figure();plot(inputBase',Array(predict(net,AFArray(inputBase)))')
hold("on");plot(inputBase',outputBase')
