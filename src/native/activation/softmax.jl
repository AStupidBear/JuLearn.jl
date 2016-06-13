export softmax,∂softmax

function softmax(rᵢ) #for prediction
  Z=sum(exp(rᵢ),1)
  rₒ=exp(rᵢ)./Z
end
function ∂softmax(rᵢ,rₒ)
  ∂ij=Diagm(rₒ) - rₒ⊗rₒ  # ∂rₒᵢ/∂rᵢⱼ
end 