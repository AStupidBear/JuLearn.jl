export predictLayer

type predictLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::Array{Float64}
  Predict      ::Function # predict function
  ∂Predict     ::Function # derivative of activation function
  rₒ     ::Array{Float64}

  ∂rᵢ_L   ::Array{Float64}
  ∂rₒ_L   ::Array{Float64}

  lock   ::Bool
end



predictLayer(inDim::Int,outDim::Int)=
  predictLayer(Layer[],
               Layer[],
               Vector[],

               rand(inDim,batchsize),
               softmax,  # id,
               ∂softmax, #∂id,
               rand(outDim,batchsize),

               rand(inDim,batchsize),
               rand(outDim,batchsize),

               false)
