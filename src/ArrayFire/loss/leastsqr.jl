export leastsq,∂leastsq
"least square"
function leastsq(obj,pre)
  cost=sum((obj-pre).^2)/size(pre)[end]
end
function ∂leastsq(obj,pre)
  cost=pre-obj
end
