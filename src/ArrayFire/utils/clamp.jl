import Base.clamp
export clamp
function clamp(x::AFArray, lo, hi)
  max(min(x,hi),lo)
end
