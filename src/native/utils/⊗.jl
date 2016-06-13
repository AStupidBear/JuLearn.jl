export ⊗

"""
  C=A⊗B => C[:,:,k]=A[:,k]*B[:,k]'
  C=A⊗B => C[:,:,k]=A[:,:,k]*B[:,k]
  """
function ⊗(A::Array{Float64,2},B::Array{Float64,2})
  C=zeros(size(A,1),size(B,1),size(A,2))
  @simd for k=1:1:size(A,2)
   @inbounds C[:,:,k]=A[:,k]*B[:,k].'
  end
  return C
end


function ⊗(A::Array{Float64,3},B::Array{Float64,2})
  C=zeros(size(A,1),1,size(A,3))
  @simd for k=1:1:size(A,3)
   @inbounds C[:,:,k]=A[:,:,k]*B[:,k]
  end
  return C
end
