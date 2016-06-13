# back propagation
export update!

# update
function update!(v::voidLayer,t::Int64)
end
function update!(d::dataLayer,t::Int64)
end
function update!(h::hiddenLayer,t::Int64)
  ∂W=reshape(mean(h.∂w_L.+λ*regularize(h.W),ndims(h.∂w_L)),size(h.∂W)...)
  ∂b=reshape(mean(h.∂b_L,ndims(h.∂b_L)),size(h.∂b)...)
  h.∂W=momentum*h.∂W+(1-momentum)*clamp!(∂W,-▽max,▽max)
  h.∂b=momentum*h.∂b+(1-momentum)*clamp!(∂b,-▽max,▽max)
  h.W+=-lr/(1+δ*t)*h.∂W;h.b+=-lr/(1+δ*t)*h.∂b;
end
function update!(p::predictLayer,t::Int64)
end
function update!(l::lossLayer,t::Int64)
end
function update!(net::Array{Layer},t::Int64)
  for idx=1:1:length(net)
    update!(net[idx],t::Int64)
  end
end
