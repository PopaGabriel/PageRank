function [ R1, R2 ] = Gradul_de_Apartenenta(name, d, eps)
   nesortat = 1;
   %concatenare nume fisier iesire
   fout = strcat(name,".out");
   fout = fopen(fout,"w");
   aux = zeros(1,2);
   %Citesc toate elementele din fisier intrare
   N = textread(name);
   %Prealocare pentru rapiditate
   PR1 = zeros(N(1),3);
   %Scriem numarul de noduri
   fprintf(fout,"%d\n\n", N(1));
   %Salvam ultimele 2 valori
   kounter = size(N,1);
   Val1 =N(kounter-1);
   Val2 = N(kounter);
   % Se rezolva sistemul astfel incat 
   % f sa fie continua
   a = 1/(Val2-Val1);
   b = -a*Val1;
   %Prealocare pentru rapiditate
   R1 = zeros(N(1),2);
   R2 = R1;
   %Apelam prima metoda, cea iterativa
   PR = Iterative(name, d, eps);
   %Returnam valorile din vectorul provenit
   %Din metoda iterativa
   for i = 1 : N(1)
     fprintf(fout,"%f \n", PR(i, 2));
   end
   
   R1 = PR;
   fprintf(fout,"\n");
   %Apelam a doua metoda 
   %adica metoda algebrica
   PR = Algebraic(name, d, eps);
   %returnm valorile din metoda iterativa
   for i = 1 : N(1)
     fprintf(fout,"%f \n", PR(i, 2));
   end
   
   fprintf(fout,"\n");
   R2 = PR;
   
   %Se sorteaza vectorul din metoda iterativa
   PR = Sorteaza(PR, N);
   %Se construieste matricea finala dupa sortare
   PR1 = Construieste_PR1(PR1, PR, N(1), Val2, Val1, a, b);
    %Returnam valorile din matricea finala
    for i = 1 : N(1)
      fprintf(fout,"%f %f %f \n",PR1(i, 1), PR1(i, 2), PR1(i, 3));
    end
    
    fprintf(fout,"\n");
   fclose(fout);
end