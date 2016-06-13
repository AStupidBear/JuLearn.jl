# backward
export backward!

function backward!(l::lossLayer)
  if l.lock==false
    l.∂rᵢ_L=l.∂Cost(l.rₒ,l.rᵢ)
  end
end

function backward!(p::predictLayer)
  if p.lock==false
    p.∂rₒ_L=p.top[1].∂rᵢ_L[p.topRange[1],:]
    for i=2:length(p.top)
      p.∂rₒ_L+=p.top[i].∂rᵢ_L[p.topRange[i],:]
    end
    p.∂rᵢ_L=reshape(p.∂Predict(p.rᵢ,p.rₒ) ⊗ p.∂rₒ_L,size(p.∂rᵢ_L)...)
  end
end
function backward!(h::hiddenLayer)
  if h.lock==false
    h.∂rₒ_L=h.top[1].∂rᵢ_L[h.topRange[1],:]
    for i=2:length(h.top)
      h.∂rₒ_L+=h.top[i].∂rᵢ_L[h.topRange[i],:]
    end
    h.∂i_L=h.∂rₒ_L.*h.∂A(h.I)
    h.∂rᵢ_L=h.W'*h.∂i_L
    h.∂w_L=reshape(h.∂i_L⊗h.rᵢ,size(h.∂w_L)...)
    h.∂b_L=h.∂i_L
  end
end
function backward!(d::dataLayer)
end
function backward!(v::voidLayer)
end
function backward!(net::Array{Layer})
  for idx=order[end:-1:1]
    backward!(net[idx])
  end
end
