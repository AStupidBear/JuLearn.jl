# back propagation
export backprop

function backprop(net::Vector{Layer},inputBase,outputBase;nIter=100)
  if ndims(inputBase)==2
    inputBase=reshape(inputBase,size(inputBase)...,1)
  end
  err=Float64[]
  dataLayerIndex=find(layer->typeof(layer)==JuLearn.dataLayer,net)
  lossLayerIndex=find(layer->typeof(layer)==JuLearn.lossLayer,net)
  nData=size(inputBase)[end-1]
  for iter=1:nIter
    idx=(iter-1)*batchsize+1
    range=map(x->mod1(x,nData),idx:idx+batchsize-1)
    for (i,index) in enumerate(dataLayerIndex)
      net[index].rₒ=inputBase[:,range,i]
      net[index].rᵢ=outputBase[:,range,i]
    end
    forward!(net)
    backward!(net)
    update!(net,iter)
    shareParams!(net)
    push!(err,sum(i->net[i].loss,lossLayerIndex))
    println("iteration=",iter)
  end
   err
end
