export hiddenLayer

type hiddenLayer <:Layer
  bottom ::Array{Layer}
  top    ::Array{Layer}
  topRange ::Vector

  rᵢ     ::AFArray{Float32} #input rate
  W      ::AFArray{Float32}
  ∂W     ::AFArray{Float32}
  b      ::AFArray{Float32}
  ∂b     ::AFArray{Float32}
  I      ::AFArray{Float32}
  A      ::Function # activation function
  ∂A     ::Function # derivative of activation function
  rₒ     ::AFArray{Float32} # output rate

  ∂rᵢ_L  ::AFArray{Float32}
  ∂w_L   ::AFArray{Float32}
  ∂b_L   ::AFArray{Float32}
  ∂i_L   ::AFArray{Float32}
  ∂rₒ_L  ::AFArray{Float32}

  lock   ::Bool
end
hiddenLayer(inDim::Int,outDim::Int)=
  hiddenLayer(Layer[],
              Layer[],
              Vector{AFArray}(),

              rand(AFArray{Float32},inDim,batchsize),
              0.01*randn(AFArray{Float32},outDim,inDim),
              zeros(AFArray{Float32},outDim,inDim),
              zeros(AFArray{Float32},outDim,1),
              zeros(AFArray{Float32},outDim,1),
              randn(AFArray{Float32},outDim,batchsize),
              recLinear,#sigmoid
              ∂recLinear,#∂sigmoid
              rand(AFArray{Float32},outDim,batchsize),

              randn(AFArray{Float32},inDim,batchsize),
              randn(AFArray{Float32},outDim,inDim,batchsize),
              randn(AFArray{Float32},outDim,batchsize),
              randn(AFArray{Float32},outDim,batchsize),
              randn(AFArray{Float32},outDim,batchsize),

              false)
