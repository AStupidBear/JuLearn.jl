export ⊗

"""C=A⊗B => C[:,:,k]=A[:,k]*B[:,k]'
  C=A⊗B => C[:,:,k]=A[:,:,k]*B[:,k]"""

function ⊗(A::AFArray{Float32,2},B::AFArray{Float32,2})
  C=zeros(AFArray{Float32},size(A,1),size(B,1),size(A,2))
  for k=1:1:size(A,2)
   @inbounds C[:,:,k]=A[:,k]*B[:,k].'
  end
  return C
end


function ⊗(A::AFArray{Float32,3},B::AFArray{Float32,2})
  C=zeros(AFArray{Float32},size(A,1),1,size(A,3))
  for k=1:1:size(A,3)
   @inbounds C[:,:,k]=A[:,:,k]*B[:,k]
  end
  return C
end
