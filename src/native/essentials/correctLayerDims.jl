export correctLayerDims

function correctLayerDims(orderGraph::Array,layersDims)
  for j=1:size(orderGraph,1)
    if sum(orderGraph[:,j])!=0
      layersDims[j,1]=0
    end
    for i=1:size(orderGraph,1)
      layersDims[j,1]+=layersDims[i,2]*orderGraph[i,j]
    end
  end
  layersDims
end
