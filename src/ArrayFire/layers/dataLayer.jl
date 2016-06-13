export dataLayer

type dataLayer<:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rₒ     ::AFArray{Float32}  #data
  rᵢ     ::AFArray{Float32} #objective

  lock   ::Bool
end
dataLayer(inDim::Int,outDim::Int)=
  dataLayer(Layer[],Layer[],Vector{AFArray}(),rand(AFArray{Float32},outDim,batchsize),rand(AFArray{Float32},inDim,batchsize),false)
