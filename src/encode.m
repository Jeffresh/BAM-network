function W = encode(X,Y) 
    n_patterns = size(X,1)
    W=zeros(size(X,2), size(Y,2));
    for i=1:n_patterns
        W=W+(X(i,:)'*Y(i,:));
    end
    
    W = W./n_patterns;
end