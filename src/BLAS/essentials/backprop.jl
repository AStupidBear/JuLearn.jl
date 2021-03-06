# back propagation
export backprop

function backprop(net::Vector{Layer},inputBase::Array{Float32,3},outputBase::Array{Float32,3};nIter=100)
  err=Float64[]
  dataLayerIndex=find(layer->typeof(layer)==JuLearn.dataLayer,net)
  lossLayerIndex=find(layer->typeof(layer)==JuLearn.lossLayer,net)
  nData=size(inputBase)[end-1]
  for iter=1:nIter
    idx=(iter-1)*batchsize+1
    range=map(x->mod1(x,nData),idx:idx+batchsize-1)
    range=Array(range)
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

function backprop(net::Vector{Layer},inputBase::Array{Float32,2},outputBase::Array{Float32,2};nIter=100)
  err=Float64[]
  dataLayerIndex=find(layer->typeof(layer)==JuLearn.dataLayer,net)
  lossLayerIndex=find(layer->typeof(layer)==JuLearn.lossLayer,net)
  nData=size(inputBase)[end]
  for iter=1:nIter
    idx=(iter-1)*batchsize+1
    range=map(x->mod1(x,nData),idx:idx+batchsize-1)
    range=Array(range)
    net[dataLayerIndex[1]].rₒ=inputBase[:,range]
    net[dataLayerIndex[1]].rᵢ=outputBase[:,range]

    forward!(net)
    backward!(net)
    update!(net,iter)
    shareParams!(net)
    push!(err,sum(i->net[i].loss,lossLayerIndex))
    println("iteration=",iter)
  end
   err
end
