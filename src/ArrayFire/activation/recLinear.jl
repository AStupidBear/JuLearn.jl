export recLinear,∂recLinear

function recLinear(rᵢ)
  rₒ=max(rᵢ,0.)
end
function ∂recLinear(rᵢ)
  rₒ=1-2*sign(rᵢ)
end
