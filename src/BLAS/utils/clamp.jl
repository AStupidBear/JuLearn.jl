import Base.clamp
export clamp
function clamp(x::Array, lo, hi)
  max(min(x,hi),lo)
end
