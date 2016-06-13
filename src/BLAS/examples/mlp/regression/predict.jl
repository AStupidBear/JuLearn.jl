function predict(net::Vector{Layer},input)
  net[1].rₒ=input
  for idx=1:length(net)-1
    forward!(net[idx])
  end
  return net[end-1].rₒ
end
