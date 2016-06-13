export shareParams!
function shareParams!(net::Array{Layer})
  for i=1:size(sharedParams,1)
    layerIndices=sharedParams[i,1]
    vars=[sharedParams[i,2];]
    for var in vars
       meanValue=1/length(layerIndices)*reduce(.+,map(layerIndex->net[layerIndex].(var),layerIndices))
       map(layerIndex->net[layerIndex].(var)=meanValue,layerIndices)
    end
  end
end
