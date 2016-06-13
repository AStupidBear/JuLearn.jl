# workspace()
ENV["JuLearnBackend"]="ArrayFire"
cd("/home/astupidbear/.julia/v0.4/JuLearn/src/ArrayFire/examples/rnn/")
using JuLearn,ArrayFire,JLD
@Eval lr=1e-2 batchsize=50

include("predict.jl")
include("dataProvider.jl")

inputBase,outputBase=dataProvider();
T=10
net=rnn([:d,:h,:h,:l],[1 1;1 10;10 1;1 1],T,:regression);

# backprop
@time err=backprop(net,AFArray(inputBase),AFArray(outputBase),nIter=100)
using PyPlot;plot(err)

# prediction
input=inputBase[:,100+(0:T÷2-1),1]
target=outputBase[:,100+(0:T-1),1]'
prediction=predict(net,AFArray(input))
prediction=map(i->Array(prediction[i])[1],1:T)
plot([target prediction],label=["target" "prediction"]);
