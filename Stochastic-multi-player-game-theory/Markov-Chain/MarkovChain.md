# Markov Chain

  1. non-empty, countable set S of states
  2. transition function δ : S -> D(S)
  3. colouring function χ : S -> C into a set C of colours.
  
## Attributes

  * δ(t|s) : probability moves from state s to state t.
  * δ(t|s) = δ(s)(t), transition graph is a *directed graph* if we use polymatrix way to 
             solve this problem it might be work.
  * Pr of a basic cyclinder *s0 ... sk dot S-omega* = * ∏ j from 1 to k (δ(s j ∣ s j− 1 ))* if s = s0

## Reachability objective
  
  Let M be a **finite Markov Chain** , let F ⊆ S , Z equals the set of all s ∈ S  
  
