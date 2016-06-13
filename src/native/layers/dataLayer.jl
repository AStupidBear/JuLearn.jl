export dataLayer

type dataLayer<:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rₒ     ::Array{Float64}  #data
  rᵢ     ::Array{Float64} #objective

  lock   ::Bool
end
dataLayer(inDim::Int,outDim::Int)=
  dataLayer(Layer[],Layer[],Vector[],rand(outDim,batchsize),rand(inDim,batchsize),false)
