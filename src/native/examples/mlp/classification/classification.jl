using JuLearn,Plots
plotlyjs()
@Eval lr=1e-1 momentum=0. batchsize=100 λ=0. ▽max=0.1
include("dataProvider.jl")
include("predict.jl")

inputBase,outputBase=dataProvider()
net=chain([:d,:h,:h,:p,:l],[2 2;2 10;10 2;2 2;2 2],:classification)
@time err=backprop(net,inputBase,outputBase,nIter=1000)
display(plot(err).o)
