export Diagm

"C[:,:,k]=diagm(A[:,k])"
function Diagm(A::Array{Float32,2})
  C=zeros(Float32,size(A,1),size(A,1),size(A,2))
  for k=1:1:size(A,2)
    @inbounds C[:,:,k]=diagm(A[:,k])
  end
  C
end
