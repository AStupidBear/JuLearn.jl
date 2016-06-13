export rnnConnectGraph

function rnnConnectGraph(L,T)
  connectGraph=zeros(Int64,L*T,L*T)
  for i=1:L*T
    if i%L==1
      connectGraph[i,i+1]=1
    elseif i%L!=0
      connectGraph[i,i+1]=1
      if i+L<L*T
        connectGraph[i,i+L]=1
      end
    else connectGraph[i,i-L+1]=1
    end
  end
  connectGraph
end 