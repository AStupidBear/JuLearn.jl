export linear,∂linear

function linear(rᵢ)
  rₒ=rᵢ
end
function ∂linear(rᵢ)
  rₒ=ones(Float32,size(rᵢ))
end
