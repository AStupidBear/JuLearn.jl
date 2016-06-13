export hiddenLayer

type hiddenLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::Array{Float64} #input rate
  W      ::Array{Float64}
  ∂W     ::Array{Float64}
  b      ::Array{Float64}
  ∂b     ::Array{Float64}
  I      ::Array{Float64}
  A      ::Function # activation function
  ∂A     ::Function # derivative of activation function
  rₒ     ::Array{Float64} # output rate

  ∂rᵢ_L  ::Array{Float64}
  ∂w_L   ::Array{Float64}
  ∂b_L   ::Array{Float64}
  ∂i_L   ::Array{Float64}
  ∂rₒ_L  ::Array{Float64}

  lock   ::Bool
end
hiddenLayer(inDim::Int,outDim::Int)=
  hiddenLayer(Layer[],
              Layer[],
              Vector[],

              rand(inDim,batchsize),
              0.1*randn(outDim,inDim),
              zeros(outDim,inDim),
              0.1*randn(outDim),
              zeros(outDim),
              randn(outDim,batchsize),
              recLinear,#sigmoid
              ∂recLinear,#∂sigmoid
              rand(outDim,batchsize),

              randn(inDim,batchsize),
              randn(outDim,inDim,batchsize),
              randn(outDim,batchsize),
              randn(outDim,batchsize),
              randn(outDim,batchsize),

              false)
