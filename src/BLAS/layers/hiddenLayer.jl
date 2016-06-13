export hiddenLayer

type hiddenLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::Array{Float32} #input rate
  W      ::Array{Float32}
  ∂W     ::Array{Float32}
  b      ::Array{Float32}
  ∂b     ::Array{Float32}
  I      ::Array{Float32}
  A      ::Function # activation function
  ∂A     ::Function # derivative of activation function
  rₒ     ::Array{Float32} # output rate

  ∂rᵢ_L  ::Array{Float32}
  ∂w_L   ::Array{Float32}
  ∂b_L   ::Array{Float32}
  ∂i_L   ::Array{Float32}
  ∂rₒ_L  ::Array{Float32}

  lock   ::Bool
end
hiddenLayer(inDim::Int,outDim::Int)=
  hiddenLayer(Layer[],
              Layer[],
              Vector{Array}(),

              map(Float32,rand(inDim,batchsize)),
              0.1*map(Float32,randn(outDim,inDim)),
              zeros(Float32,outDim,inDim),
              0.1*map(Float32,randn(outDim,1)),
              zeros(Float32,outDim,1),
              map(Float32,randn(outDim,batchsize)),
              recLinear,#sigmoid
              ∂recLinear,#∂sigmoid
              map(Float32,rand(outDim,batchsize)),

              map(Float32,randn(inDim,batchsize)),
              map(Float32,randn(outDim,inDim,batchsize)),
              map(Float32,randn(outDim,batchsize)),
              map(Float32,randn(outDim,batchsize)),
              map(Float32,randn(outDim,batchsize)),

              false)
