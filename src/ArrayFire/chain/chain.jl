export chain

function chain(layersNames,layersDims,netType=:regression)
  global order
  L=length(layersNames);T=1;

  orderGraph=rnnOrderGraph(L,T)
  order=topoSort(orderGraph)
  connectGraph=rnnConnectGraph(L,T)

  if netType==:classification
    net=initNet(layersNames,layersDims,:classification)
    connectNet(net,connectGraph,layersDims)
    net[end].Cost=crossEntropy;net[end].∂Cost=∂crossEntropy
  elseif netType==:regression
    net=initNet(layersNames,layersDims,:regression)
    connectNet(net,connectGraph,layersDims)
    net[end-1].A=linear;net[end-1].∂A=∂linear
  end
  return net
end
