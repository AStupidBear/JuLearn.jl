export @Eval

macro Eval(expr...)
	for ex in expr
	eval(ex)
	end
end 
