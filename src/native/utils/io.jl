export save_net,load_net

function save_net(filename,net)
  data=[]
  for layer in net
    if in(:W,fieldnames(layer))
      push!(data,Dict(:W=>layer.W,:b=>layer.b))
    else
      push!(data,Dict())
    end
  end
  save(filename,"data",data)
end

function load_net(filename,net)
  data=load(filename,"data")
  for i=1:length(data)
    if in(:W,fieldnames(net[i]))
      net[i].W=data[i][:W];net[i].b=data[i][:b]
    end
  end
end
