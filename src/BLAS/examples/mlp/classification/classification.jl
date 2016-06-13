cd("/home/astupidbear/.julia/v0.4/JuLearn/examples/mlp/classification/")
using JuLearn,ArrayFire,Plots
@Eval lr=1e-1 momentum=0. batchsize=100 λ=0. ▽max=0.1
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider()
net=chain([:d,:h,:h,:p,:l],[2 2;2 10;10 2;2 2;2 2],:classification)
@time err=backprop(net,Array(inputBase),Array(outputBase),nIter=100)
p=plot(err);savefig(p,"error.png")
run(`xdg-open error.png`)
