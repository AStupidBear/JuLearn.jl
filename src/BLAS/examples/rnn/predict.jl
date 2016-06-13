function predict(net::Vector{Layer},input)
  T=sum(layer->typeof(layer)==JuLearn.dataLayer,net)
  L=div(length(net),T)
  prediction=Vector{Array}(T)
  Ttrain=size(input,2)
  for t=0:Ttrain-1 net[1+t*L].rₒ[:,1]=input[:,1+t] end
  forward!(net)
  for t=0:Ttrain-1 prediction[t+1]=net[t*L+L-1].rₒ[:,1] end

  for t=Ttrain:T-1
  net[1+t*L].rₒ[:,1]=prediction[t]
  forward!(net)
  prediction[t+1]=net[t*L+L-1].rₒ[:,1]
  end

  return prediction
end
