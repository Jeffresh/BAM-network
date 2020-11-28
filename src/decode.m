function Y = decode(X,Y,W)
    Y=feval('tanh',X*W);
    X=feval('tanh',Y*W');   
    Y2=[];
    while ~isequal(Y,Y2)
        Y=Y2;
        Y2=feval('tanh',X*W);
        X=feval('tanh',Y2*W');
    end
end