function dataProvider()
    x=map(Float32,linspace(-5,5,100)')
    inputBase=x
    outputBase=1./(1+x.^2)
  return inputBase,outputBase
end
