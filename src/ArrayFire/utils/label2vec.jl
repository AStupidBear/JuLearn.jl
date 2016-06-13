export label2vec,vec2label

"label=2,class=3 => label2vec(outputBase,class) = [0,1,0]"
function label2vec(label,class)
  v=zeros(class,length(label))
  for idx=1:length(label)
    v[round(Int,label[idx]),idx]=1
  end
  return v
end

"vec2label([1. 0 1;0 1 0])"
function vec2label(vector)
~,index=findmax(vector,1)
sub=ind2sub(size(vector),vec(index))[1]
end
