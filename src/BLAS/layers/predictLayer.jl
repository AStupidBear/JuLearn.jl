export predictLayer

type predictLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::Array{Float32}
  Predict      ::Function # predict function
  ∂Predict     ::Function # derivative of activation function
  rₒ     ::Array{Float32}

  ∂rᵢ_L   ::Array{Float32}
  ∂rₒ_L   ::Array{Float32}

  lock   ::Bool
end



predictLayer(inDim::Int,outDim::Int)=
  predictLayer(Layer[],
               Layer[],
               Vector{Array}(),

               map(Float32,rand(inDim,batchsize)),
               softmax,  # id,
               ∂softmax, #∂id,
               map(Float32,rand(outDim,batchsize)),

               map(Float32,rand(inDim,batchsize)),
               map(Float32,rand(outDim,batchsize)),

               false)
