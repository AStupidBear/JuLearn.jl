export id,∂id

"identity function"
function id(rᵢ)
  rₒ=rᵢ
end
function ∂id(rᵢ,rₒ)
  ∂ij=Diagm(ones(rₒ))
end 