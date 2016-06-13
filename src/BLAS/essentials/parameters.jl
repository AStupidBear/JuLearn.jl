export batchsize,lr,δ,momentum,λ,▽max,order
const batchsize=50
const lr=1e-2 #learning rate
const δ=0.  #decrease constant lr=lr/(1+δ*t)
const momentum=0.
const λ=0. #regularization coefficient
const ▽max=0.1 #largest gradient
global order
global sharedParams=[]
