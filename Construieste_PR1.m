function PR1 = Construieste_PR1(PR1, PR, nr, Val2, Val1, a, b)
  for i = 1 : nr
    %Se adauga prima coloana si a doua coloana
    PR1(i, 1) = i;
    PR1(i, 2) = PR(i, 1);
    %Se construieste si a treia coloana
    if PR(i, 2) > Val2
      PR1(i, 3) = 1;
     elseif PR(i, 2) < Val1
      PR1(i, 3) = 0;
      else
      PR1(i, 3) = a * PR(i, 2) + b;
     end
  end
end