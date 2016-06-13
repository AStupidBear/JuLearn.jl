export crossEntropy,∂crossEntropy

function crossEntropy(obj,pre)
  cost=-sum(obj.*log(pre))/size(pre)[end]
end
function ∂crossEntropy(obj,pre)
  ∂pre_L=-obj./pre
end

