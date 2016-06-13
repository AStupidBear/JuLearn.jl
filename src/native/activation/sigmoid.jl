export sigmoid,∂sigmoid

function sigmoid(rᵢ)
  rₒ=1./(1+exp(-rᵢ))
end
function ∂sigmoid(rᵢ)
  y=sigmoid(rᵢ)
  rₒ=y.*(1-y)
end 