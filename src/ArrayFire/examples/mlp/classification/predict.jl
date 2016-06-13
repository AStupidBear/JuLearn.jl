function predict(net::Vector{Layer},input)
  net[1].rₒ=input
  for idx=1:length(net)-1
    forward!(net[idx])
  end
  ~,index=findmax(net[end-1].rₒ,1) #regression=>net[end-1].rₒ
  return map(x->mod1(x,size(net[end-1].rₒ,1)),index)
end
