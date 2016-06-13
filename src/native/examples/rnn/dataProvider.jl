function dataProvider()
    L=4;T=10
    t=0:0.5:10000;x=cos(t);y=x[[2:end;1]]
    nData=1000;inputBase=zeros(1,nData,T);outputBase=zeros(1,nData,T);state=1
    for data=1:nData,t=1:T
      inputBase[:,data,t]=x[state];outputBase[:,data,t]=y[state]; state+=1
    end
  return inputBase,outputBase
end
