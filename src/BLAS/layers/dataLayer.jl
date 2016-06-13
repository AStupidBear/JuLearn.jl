export dataLayer

type dataLayer<:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rₒ     ::Array{Float32}  #data
  rᵢ     ::Array{Float32} #objective

  lock   ::Bool
end
dataLayer(inDim::Int,outDim::Int)=
  dataLayer(Layer[],Layer[],Vector{Array}(),
  map(Float32,rand(outDim,batchsize)),
  map(Float32,rand(inDim,batchsize)),
  false)
