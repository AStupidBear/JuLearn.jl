function dataProvider()
    srand(100000)
    N=1000
    x=[1+rand(1,N) -1-rand(1,N)]
    y=[2*randn(1,N) 2*randn(1,N)]
    inputBase=[x;y]
    outputBase=label2vec([ones(1,N) 2*ones(1,N)],2)
    idx=randcycle(2*N)
    inputBase=inputBase[:,idx]
    outputBase=outputBase[:,idx]
  return map(Float32,inputBase),map(Float32,outputBase)
end
