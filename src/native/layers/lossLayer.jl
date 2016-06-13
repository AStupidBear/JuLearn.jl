export lossLayer

type lossLayer <:Layer
  bottom   ::Array{Layer}
  top      ::Array{Layer}
  topRange ::Vector

  rₒ      ::Array{Float64}
  rᵢ      ::Array{Float64} #prediction

  Cost     ::Function # Cost function
  ∂Cost    ::Function # derivative of activation function
  loss     ::Float64

  ∂rᵢ_L  ::Array{Float64}

  lock   ::Bool
end

lossLayer(nClass::Int)=
  lossLayer(Layer[],
            Layer[],
            Vector[],

			rand(nClass,batchsize),
			rand(nClass,batchsize),

            leastsq, # crossEntropy
            ∂leastsq,#∂crossEntropy
            0.1,

			rand(nClass,batchsize),

			false)
