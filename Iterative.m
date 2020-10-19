function PR = Iterative(name, d, eps)
  N = textread(name);
  %Se prealoca memorie pentru rapiditate
  Matrice_Adiacenta = zeros(N(1));
  PR = zeros(N(1), 2);
  kounter = 2;
  %Se formeaza matricea de adiacenta
  for i = 1 : N(1)
    index = N(kounter);
    kounter++;
    nr_conexiuni = N(kounter);
    kounter++;
    for j = 1 : nr_conexiuni
        pagina = N(kounter);
        kounter++;
        Matrice_Adiacenta(index, pagina) = 1;
      endfor
      Matrice_Adiacenta(i, i) = 0;
  end
  %Se completeaza prima coloana din matrice
  for i = 1 : N(1)
    PR(i, 1) = i;
  end
  %Suma de iesiri pentru fiecare nod linii
  out = sum(Matrice_Adiacenta, 2);
  %Prealocare pentru rapiditate
  R_nou = zeros(N(1), 1);
  R_nou(:,1) = 1 / N(1);
  R_vechi = R_nou;
  while 1
    %Se aplica algoritmul pentru metoda iterativa
    for i = 1 : N(1)
      sum = 0;
      for j = 1 : N(1)
        if Matrice_Adiacenta(j, i) == 1
            sum += R_vechi(j) / out(j);
         endif
        endfor
        R_nou(i) = (1 - d) / N(1) + sum * d;
      endfor
      %Daca eroarea la care am ajuns este cea dorita
      %Ne oprim
      if abs(R_nou(:) - R_vechi(:)) < eps
      %Se copiaza valorile calculate
      %In coloana a doua a matricii pe care o returnam  
        for i = 1 : N(1)
          PR(i, 2) = R_vechi(i);
        end
        break; 
      end
    %R trecut devine R curent
    %Iar procesul se reia
    R_vechi = R_nou;
    endwhile