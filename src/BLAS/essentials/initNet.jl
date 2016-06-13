export initNet

function initNet(layersNames,layersDims,netType=:classification)
  net=Layer[]
  if netType==:classification
    for (i,layerName) in enumerate(layersNames)
      if layerName==:d
        net=[net;dataLayer(layersDims[i,:]...)]
      elseif layerName==:h
        net=[net;hiddenLayer(layersDims[i,:]...)]
      elseif layerName==:p
        net=[net;predictLayer(layersDims[i,:]...)]
      elseif layerName==:l
        net=[net;lossLayer(layersDims[i,1])]
        net[i].Cost=crossEntropy;net[i].∂Cost=∂crossEntropy
      end
    end
  elseif netType==:regression
    for (i,layerName) in enumerate(layersNames)
      if layerName==:d
        net=[net;dataLayer(layersDims[i,:]...)]
      elseif layerName==:h
        net=[net;hiddenLayer(layersDims[i,:]...)]
      elseif layerName==:p
        net=[net;predictLayer(layersDims[i,:]...)]
      elseif layerName==:l
        net=[net;lossLayer(layersDims[i,1])]
      end
    end
  end
  return net
end
