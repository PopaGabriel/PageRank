        Pentru a putea folosi codurile, este nevoie de un fisier cu datele de intrare,
adresa fisierul trebuie salvata in variabila name, este nevoie de un factor d mai mic ca 1
pentru aplicarea metodelor iterative si algebrice, si de asemenea un factor de eroare
eps astfel incat sa cunoastem la ce eroare sa ne oprim.
	Am creeat matricea de adiacenta in ambele functii, iterative si algebric. In functia Iterative,
este folosita metoda iterativa fara matrice, vectoriala, se calculeaza de fiecare data un R nou si se 
verifica daca eroarea dintre acesta si R-ul de la pasul anterior este mai mica
decat eroarea dorita eps. Daca nu algoritmul se repeta.
	Pentru algoritmul algebric trebuie formata matricea M,
folosindu-ne de matricea de adiacenta si vectorul out, care reprezinta numarul de legaturi externe
pe care le are un nod. O sa rezulte o matrice care o sa aiba suma pe fiecare verticala egala cu 1. Matricea rezultata 
se foloseste pentru a calcula matricea din algoritm. Pe care o vom descompune cu 
gram-schmidt modificat, este schimbat putin notarea fata de laborator, pentru ca
matricea pentru care trebuie sa facem descompunerea QR, va fi tot timpul o matrice
patratica, si astfel n = m. Pentru a calcula inversa matricii, calculam inversa 
descompunerii ei QR care este echivalenta cu inversa lui R * Q'.
	Procesul de inversare este mult mai rapid decat daca am face fara QR, deoarece matricea R
este o matrice superior triunghiulara, iar calculul inversei acesteia este 
mult mai rapid. Dupa ce am calculat inversa matricii din, se calculeaza prima
iteratie din algoritmul algebric. Tot aplicam algoritmul pana cand diferenta dintre
vectorul calculat cu un pas anterior si cel calculat la pasul actual, devine mai mica
decat eroarea dorita. Pentru sortare am folosit metoda bubble sort invatata in anii 
trecuti, se tot parcurge vectorul pana cand este sortat. La final matricea cu 2 coloane
PR calculat cu metoda algebrica si sortat cu functia sort, este folosita in functia
construire pentru a creea matricea finala de PageRank. Funtia returneaza exact 
valorile cerute in fisierul out.
