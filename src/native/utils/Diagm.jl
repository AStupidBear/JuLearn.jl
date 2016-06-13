export Diagm

"C[:,:,k]=diagm(A[:,k])"
function Diagm(A::Array{Float64,2})
  C=zeros(size(A,1),size(A,1),size(A,2))
  @simd for k=1:1:size(A,2)
    @inbounds C[:,:,k]=diagm(vec(A[:,k]))
  end
  C
end
