# feedforward
export forward!

function forward!(v::voidLayer)
end
function forward!(d::dataLayer)
end
function forward!(h::hiddenLayer)
  rᵢ=h.bottom[1].rₒ
  for i=2:length(h.bottom)
  rᵢ=[rᵢ;h.bottom[i].rₒ]
  end
  h.rᵢ=rᵢ

  h.I=h.W*h.rᵢ+h.b
  h.rₒ=h.A(h.I)
end

function forward!(p::predictLayer)
  rᵢ=p.bottom[1].rₒ
  for i=2:length(p.bottom)
  rᵢ=[rᵢ;p.bottom[i].rₒ]
  end
  p.rᵢ=rᵢ

  p.rₒ=p.Predict(p.rᵢ)
end
function forward!(l::lossLayer)
  rᵢ=l.bottom[1].rₒ
  for i=2:length(l.bottom)
  rᵢ=[rᵢ;l.bottom[i].rₒ]
  end
  l.rᵢ=rᵢ

  rₒ=l.top[1].rᵢ
  for i=2:length(l.bottom)
  rₒ=[rₒ;l.top[i].rᵢ]
  end
  l.rₒ=rₒ
  l.loss=l.Cost(l.rₒ, l.rᵢ)

end


function forward!(net::Array{Layer})
  for idx in order
    forward!(net[idx])
  end
end
