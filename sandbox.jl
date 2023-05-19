# Just some random tests etc 

m = InputDraw.distance_matrix(line,28,28)
# Show a sample
heatmap(rotl90(m))

f(x) = min(1,max(1.8-20x,0))
heatmap(rotl90(f.(m)))


heatmap(rotl90(x_test[:,:,1]))

# Rough description of desired behaviour
# 0       ->1
# 0.025   ->1
# 0.05    ->0
# >0.05   ->0


# A Random permutation generator 


function random_permutation!(E::AbstractVector{T}) where T
# Create data (1,r1), ..., (n,rn) where r1,...,rn are just random numbers
# Then sort those on the second element. The first elements will then be a random permutation of 1,...,n.

# Another possibility is having the array of elements that should be permuted randomly E = [e1,...,en], picking a random one out (by generating a random number between 1 and n), then replacing it with the last, i.e., nth element producing the array E = [e1,...,en,...,e(n-1)]. Then one can do the same for n-1 and so on until reaching 0. We implement this method now.

n = length(E)

for r = length(E):-1:2 # r is the number of remaining elements
    index = rand(1:r) # Potential optimization possibility here; unsure if rand(1:r) is the fastest way to generate a random number between 1 and r.
    E[r],E[index] = E[index],E[r] # switches E[r] and E[index]
end

return E

end

random_permutation(E::AbstractVector{T}) where T = random_permutation!(collect(E))
random_permutation(n::Int) = random_permutation!(collect(1:n))

a