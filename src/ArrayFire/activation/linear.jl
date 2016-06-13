export linear,∂linear

function linear(rᵢ)
  rₒ=rᵢ
end
function ∂linear(rᵢ)
  rₒ=constant(Float32(1),size(rᵢ))
end
