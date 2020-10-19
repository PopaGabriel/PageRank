function PR = Sorteaza(PR, N)
  nesortat = 1;
  %Cat timp se gaseste un element care nu este
  %Bine sortat sa sorteze in continuare
  while nesortat == 1
     nesortat = 0;
     %Parcurge toata coloana
    for i = 1 : N(1) - 1
      %De fiecare deata cand se 
      %Gaseste un termen mai mic decat urmatorul
      %Se schimba pozitiile intre elemente
      if PR(i,2) < PR(i + 1, 2)
        aux(1, 1) = PR(i, 1);
        aux(1, 2) = PR(i, 2);
        PR(i,1) = PR(i+1,1);
        PR(i,2) = PR(i+1,2);
        PR(i + 1, 1) = aux(1, 1);
        PR(i +1, 2) = aux(1,2);
        %Continua sa refaca algoritmul
        %Pana cand este bine sortat
        nesortat = 1;
      end
    end
  end