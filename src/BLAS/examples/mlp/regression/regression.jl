cd("/home/astupidbear/.julia/v0.4/JuLearn/src/BLAS/examples/mlp/regression")
ENV["JuLearnBackend"]="BLAS"
using JuLearn#,Plots
@Eval lr=0.01 δ=0. momentum=0. batchsize=10 ▽max=0.01 λ=0.0
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider();
net=chain([:d,:h,:h,:l],[1 1;1 1000;1000 1;1 1],:regression);
@time err=backprop(net,Array(inputBase),Array(outputBase),nIter=1000)

# plot(err)
# plot(inputBase',Array(predict(net,Array(inputBase)))')
# plot!(inputBase',outputBase')
