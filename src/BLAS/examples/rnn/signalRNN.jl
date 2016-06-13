# workspace()
cd("/home/astupidbear/.julia/v0.4/JuLearn/examples/rnn/")
using JuLearn,Plots,ArrayFire,JLD
@Eval lr=1e-2 batchsize=100

include("predict.jl")
include("dataProvider.jl")

inputBase,outputBase=dataProvider();
T=10
net=rnn([:d,:h,:h,:l],[1 1;1 10;10 1;1 1],T,:regression);

# backprop
err=backprop(net,Array(inputBase),Array(outputBase),nIter=30)
p=plot(err);savefig(p,"error")

# prediction
input=inputBase[:,100+(0:T÷2-1),1]
target=outputBase[:,100+(0:T-1),1]'
prediction=predict(net,Array(input))
prediction=map(i->Array(prediction[i])[1],1:T)
p=plot([target prediction],label=["target" "prediction"]);
savefig(p,"prediction.png");run(`xdg-open prediction.png`)
