export lossLayer

type lossLayer <:Layer
  bottom   ::Array{Layer}
  top      ::Array{Layer}
  topRange ::Vector

  rₒ      ::Array{Float32}
  rᵢ      ::Array{Float32} #prediction

  Cost     ::Function # Cost function
  ∂Cost    ::Function # derivative of activation function
  loss     ::Float64

  ∂rᵢ_L  ::Array{Float32}

  lock   ::Bool
end

lossLayer(nClass::Int)=
  lossLayer(Layer[],
            Layer[],
            Vector{Array}(),

			map(Float32,rand(nClass,batchsize)),
			map(Float32,rand(nClass,batchsize)),

            leastsq, # crossEntropy
            ∂leastsq,#∂crossEntropy
            0.1,

			map(Float32,rand(nClass,batchsize)),

			false)
