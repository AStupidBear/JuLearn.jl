export predictLayer

type predictLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::AFArray{Float32}
  Predict      ::Function # predict function
  ∂Predict     ::Function # derivative of activation function
  rₒ     ::AFArray{Float32}

  ∂rᵢ_L   ::AFArray{Float32}
  ∂rₒ_L   ::AFArray{Float32}

  lock   ::Bool
end



predictLayer(inDim::Int,outDim::Int)=
  predictLayer(Layer[],
               Layer[],
               Vector{AFArray}(),

               randn(AFArray{Float32},inDim,batchsize),
               softmax,  # id,
               ∂softmax, #∂id,
               randn(AFArray{Float32},outDim,batchsize),

               randn(AFArray{Float32},inDim,batchsize),
               randn(AFArray{Float32},outDim,batchsize),

               false)
