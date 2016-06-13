export sequence2data

function sequence2data(input,output,T)
  dimInput,nInput=size(input)
  dimOutput,nOutput=size(output)
  @assert nInput==nOutput "#input must be equal to #output"
  inputBase=zeros(dimInput,nInput-T+1,T);
  outputBase=zeros(dimOutput,nOutput-T+1,T)
  for t=0:T-1
     inputBase[:,:,t+1] =input[:,t+1:t+nInput-T+1]
    outputBase[:,:,t+1]=output[:,t+1:t+nOutput-T+1]
  end
  inputBase,outputBase
end
