function [Q, R] = Gram_Schmidt(A)
	[~, n]=size(A);
	Q = A;
	R = zeros(n);
	for i = 1 : n
    R(i, i) = norm(Q(1 : n, i));
	  Q(1 : n, i) = Q(1 : n, i) / R(i, i);
	  for j = i + 1 : n
      R(i, j) = Q(1 : n, i)' * Q(1 : n, j);
		  Q(1 : n, j) = Q(1 : n, j) - Q(1 : n, i) * R(i, j);
    end
  end
endfunction