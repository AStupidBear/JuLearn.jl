export connectNet

function connectNet(net,connectGraph,layersDims)
  topRangePointer=ones(Int64,size(connectGraph,1))
  for i=1:size(connectGraph,1)
    for j=1:size(connectGraph,2)
      if connectGraph[i,j]==1
        net[i].top=[net[i].top;net[j]]
        net[j].bottom=[net[j].bottom;net[i]]

        newTopRange=AFArray([topRangePointer[j]:topRangePointer[j]+size(net[i].rₒ,1)-1;])
        push!(net[i].topRange,newTopRange)
        topRangePointer[j]+=size(net[i].rₒ,1)
      end
    end
  end
end
