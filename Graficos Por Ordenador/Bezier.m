function point = Bezier(P,t)
%   Algorithm of Casteljau
%   Input arguments are a table of Points (P) and
%   t a value between 1 and 0

if t < 0 || t > 1
    error("t must be between 0 and 1, %s",t)
end

Q = P;
n = height(P) + 1;
for i = 2:n
    for k = 1:n-i
        Q(k,:) = (1-t) * Q(k,:) + t*Q(k + 1,:);
    end
end

point = Q(1,:);
end