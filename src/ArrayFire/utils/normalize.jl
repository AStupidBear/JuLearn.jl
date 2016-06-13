export normalize

function normalize(data,method)
  if method==:gauss
    μ=mean(data,2)
    σ=std(data,2)
  elseif method==:center
    ⇧=maximum(data,2);⇩=minimum(data,2)
    μ=(⇧+⇩)/2;σ=(⇧-⇩)/2
  elseif method==:positive
    ⇧=maximum(data,2);⇩=minimum(data,2)
    μ=⇩;σ=⇧-⇩
  end
  return (data.-μ)./σ
end
