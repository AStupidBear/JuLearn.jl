export rnnOrderGraph

function rnnOrderGraph(L,T)
  orderGraph=zeros(Int64,L*T,L*T)
  for i=1:L*T
    if i%L==1
      orderGraph[i,i+1]=1
    elseif i%L!=0
      orderGraph[i,i+1]=1
      if i+L<L*T
        orderGraph[i,i+L]=1
      end
    end
  end
  return orderGraph
end 