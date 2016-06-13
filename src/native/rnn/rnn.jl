export rnn

function rnn(layersNames,layersDims,T,netType=:regression)
  L=length(layersNames)

  global order,sharedParams
  orderGraph=rnnOrderGraph(L,T)
  connectGraph=rnnConnectGraph(L,T)
  order=topoSort(orderGraph)

  layersNames=repmat(layersNames,T,1)
  layersDims=repmat(layersDims,T,1)
  layersDims=correctLayerDims(orderGraph,layersDims)

  net=initNet(layersNames,layersDims,:regression)
  connectNet(net,connectGraph,layersDims)

  for i=1:length(net)
    if i%L==0
      net[i-1].A=linear;net[i-1].∂A=∂linear
    end
  end

  sharedParams=Array{Any}(L-2,2)
  for l=2:L-1
    sharedParams[l-1,1]=collect(l+(1:T-1)*L)
    sharedParams[l-1,2]=[:W,:b]
  end

  return net
end
