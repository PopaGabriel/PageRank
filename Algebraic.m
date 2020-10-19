function PR = Algebraic(name, d, eps)
  N = textread(name);
  %Prealocare pentru rapiditate
  Matrice_Adiacenta = zeros(N(1));
  M_algoritm = zeros(N(1));
  PR = zeros(N(1), 2);
  I = eye(N(1));
  L = ones(N(1), 1);
  kounter = 2;
  %Se formeaza matricea de adicenta
  for i = 1 : N(1)
    index = N(kounter);
    kounter = kounter + 1;
    nr_conexiuni = N(kounter);
    kounter = kounter + 1;
    for j = 1 : nr_conexiuni
        pagina = N(kounter);
        kounter++;
        Matrice_Adiacenta(index, pagina) = 1;
    end
      %Diagonala este 0
      Matrice_Adiacenta(i, i) = 0;
  end
  %Se scriu valorile in prima coloana a matricii
  for i = 1 : N(1)
    PR(i,1) = i;
  end
  %Numarul de linkuri ina afara pe care le are un nod
  out = sum(Matrice_Adiacenta, 2);
  %Se formeaza Matricea M din algoritm 
  for i = 1 : N(1)
    for j = 1 : N(1)
      %Se verifica daca nodul j are conexiune 
      %La nodul i
      if Matrice_Adiacenta(j, i) == 1
          %Se formeaza matricea
          M_algoritm(i, j) = 1 / out(j);
      end
    end
  end
  %Se creeaza matricea A din algoritm
  A = I - d * M_algoritm;
  %Se aplica algoritmul modificat Gram_Schmidt
  [Q, R] = Gram_Schmidt(A);
  %Se inverseaza matricea A
  %Inversand Q*R
  X = inv(R) * Q';
  %Se calculeaza primul R din algoritmul
  R_nou = X * L * ((1 - d)/ N(1));
  R_vechi = R_nou;
  %Se aplica algoritmul de calcul algebric
  while 1
    R_nou = d * M_algoritm * R_vechi + L *((1 - d) / N(1));
    %Daca eroarea la care am ajuns este cea dorita
    %Ne oprim
    if sum(abs(R_nou(:) - R_vechi(:))) < eps
      %Copiem valorile calculate
      %in coloana a doua
      %a matricii pe care o returnam
      for i = 1 : N(1)
        PR(i, 2) = R_nou(i);
      end
      break;
    end
    %Se copiaza valoarea 
    %R-ului calculat la pasul anterior
    %Cu cea calculata la pasul actual
    R_vechi = R_nou;
    end