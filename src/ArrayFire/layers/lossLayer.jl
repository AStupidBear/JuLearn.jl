export lossLayer

type lossLayer <:Layer
  bottom   ::Array{Layer}
  top      ::Array{Layer}
  topRange ::Vector

  rₒ      ::AFArray{Float32}
  rᵢ      ::AFArray{Float32} #prediction

  Cost     ::Function # Cost function
  ∂Cost    ::Function # derivative of activation function
  loss     ::Float64

  ∂rᵢ_L  ::AFArray{Float32}

  lock   ::Bool
end

lossLayer(nClass::Int)=
  lossLayer(Layer[],
            Layer[],
            Vector{AFArray}(),

			rand(AFArray{Float32},nClass,batchsize),
			rand(AFArray{Float32},nClass,batchsize),

            leastsq, # crossEntropy
            ∂leastsq,#∂crossEntropy
            0.1,

			rand(AFArray{Float32},nClass,batchsize),

			false)
