# The idea here is to have one single module export these, such that other modules can import and extend these. 

module Nablas 

export ∇, ∇_θ 

∇(x::Number) = zero(x)
∇_θ(x::Number) = zero(x)

end