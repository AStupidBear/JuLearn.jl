# workspace()
using JuLearn,Plots,JLD
plotlyjs()
@Eval lr=1e-2 batchsize=100

include("predict.jl")
include("dataProvider.jl")

inputBase,outputBase=dataProvider()
T=10
net=rnn([:d,:h,:h,:l],[1 1;1 10;10 1;1 1],T,:regression)

# backprop
err=backprop(net,inputBase,outputBase,nIter=30000)
p=plot(err);display(p.o)

# prediction
input=inputBase[:,100+(0:T÷2-1),1]
target=outputBase[:,100+(0:T-1),1]'
prediction=predict(net,input)
prediction=map(i->prediction[i][1],1:T)
p=plot([target prediction],label=["target" "prediction"])
display(p.o)
