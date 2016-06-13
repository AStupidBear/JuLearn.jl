# workspace()
using JuLearn
using MatlabPlot
@Eval lr=1e-2 batchsize=100
L=4;T=10

# prepare data
t=0:0.5:10000;x=cos(t);y=x[[2:end,1]]
# mplot([x[1:100] y[1:100]],".")
# x=x[:,[2:end,1]]
nData=1000;inputBase=zeros(1,nData,T);outputBase=zeros(1,nData,T);state=1
for data=1:nData,t=1:T
  inputBase[:,data,t]=x[state];outputBase[:,data,t]=y[state]; state+=1
end

# create JuLearn
orderGraph=rnnOrderGraph(L,T)
@Eval order=topologicalSort(Main.orderGraph)
connectGraph=rnnConnectGraph(L,T)

layersNames=repmat([:d,:h,:h,:l],T,1)
layersDims=repmat([1 1;1 10;10 1;1 1],T,1)
layersDims=correctLayerDims(orderGraph,layersDims)

net=initNet(layersNames,layersDims,:regression)
connectNet(net,connectGraph,layersDims)
for i=1:1:length(net)
  if i%L==0
    net[i-1].A=linear;net[i-1].∂A=∂linear
    net[i].Cost=leastsq;net[i].∂Cost=∂leastsq
    println(i)
  end
end

sharedParams=Array{Any}(L-2,2)
for l=2:L-1
  sharedParams[l-1,1]=collect(l+(1:T-1)*L)
  sharedParams[l-1,2]=[:W,:b]
end
@Eval shareParams=Main.shareParams

# backprop
err=backprop(net,inputBase,outputBase,nIter=3000)
figure();mplot(err)

# prediction
Ttrain=2
input=x[state+(0:T-1)]
target=y[state+(0:T-1)]
prediction=zeros(T)
for t=0:Ttrain net[1+t*L].rₒ[1,1]=x[state+t] end
forward!(net)
for t=0:Ttrain prediction[t+1]=net[t*L+L-1].rₒ[1,1] end

for t=Ttrain+1:T-1
net[1+t*L].rₒ[1,1]=prediction[t]
forward!(net)
prediction[t+1]=net[t*L+L-1].rₒ[1,1]
end
figure();mplot([input target prediction]);legend("input","target","prediction")
