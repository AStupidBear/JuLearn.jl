export topoSort

function topoSort(g)
  graph=copy(g)
  # Initialization
  indegree = sum(graph,1); # Incoming link counter
  indegree0 = indegree; # Initial incoming link counter

  # Topological sort
  G = [1:size(graph,1);]   # Set of nodes to sort
  L = [];     # Empty list for the sorted elem.
  S = [];     # Empty Set for nodes with no incoming edges
  level = ones(size(G));  # Level of the node in L
  dag = graph;    # Directed Acyclic Graph

  while !isempty(G) # G is non-empty
      # Search for free nodes
      for n = G
          if indegree[n]==0 # Incoming link counter of n = 0
              S = [S;n];
          end
      end

      if !isempty(S) # S is non-empty, perform ordinary top-sort
        n = S[1];  # Remove a node n from S and G
        S = S[S.!=n];
        G = G[G.!=n];
        L = [L;n]; # Insert n into L
        for m = find(graph[n,:]) # Foreach node m with an edge e from n to m
            graph[n,m] = 0; # Remove e
            level[m] = max(level[m], level[n]+1);
            indegree[m] = indegree[m] -1; # Decrement incoming link counter from m
        end
      end
    end
    return L
end
