module JuLearn

using JLD

function include_path(path,folder)
	files=readdir(joinpath(path,folder))
	map(file->include(joinpath(path,folder,file)),files)
end

export Layer

abstract Layer

if ENV["JuLearnBackend"]=="native"
	path=Pkg.dir("JuLearn","src","native")
elseif ENV["JuLearnBackend"]=="BLAS"
	path=Pkg.dir("JuLearn","src","BLAS")
elseif ENV["JuLearnBackend"]=="ArrayFire"
	using ArrayFire
	path=Pkg.dir("JuLearn","src","ArrayFire")
end

include_path(path,"layers")
include_path(path,"essentials")

include_path(path,"utils")
include_path(path,"activation")
include_path(path,"chain")
include_path(path,"loss")
include_path(path,"rnn")

end # module
