# SparseJacobi-KMeansAlgorithm-HouseholderPrediction

##### Calcan Elena-Claudia <br/>
##### 311CA

<br/>

1. Sparse Jacobi - part-1
-------------------------------------------------------------------------------

1. function [A, b] = generate probabilities system(rows) 

Functia returneaza sistemul de ecuatii reprezentat de matricea A si de vectorul
b.
La inceputul functiei am construit am construit o matrice inferior 
triunghiulara pe care am numit-o M, ea reprezentand diagrama labirintului.
Cu 2 for-uri am parcurs labirintul. Intr-o variabila p retinem numarul de 
probabilitati. In timp ce parcurgem labirntul am verificat niste conditii de 
parcurgere si am construit matricea A.

Fiecare linie a lui A reprezinta intersectia diagramei in care ne aflam. 
Numarul de probabilitati este stocat pe diagonala principala a matricei A. 
Valorile de -1 de pe o linie A repreinta vecinii intersectiei pe care ne aflam.
Valorile de 0 reprezinta faptul ca nu sunt vecini si nu poti ajunge din
intersectia curenta sau ca ai iesit din labirint si nu ai ajuns la final.
In matricea M te poti duce:
	-sus, dar nu poti iesi din labirint.
	-jos, si poti iesi din labirint deoarece ai ajuns la final
	-stanga, dar nu poti depasi diagonala principala
	-dreapta, si poti iesi din labirint
	-si pe diagonal, doar pe diagonalele paralel cu diagonala principala
Vectorul b primeste valoarea 1 doar pe pozitiile ce reprezinta intersectiile 
de la finalul labirintului.

2. function [values, colind, rowptr] = matrix_to_csr(A)

Functia intoarce forma CSR a matricei A. Forma CSR este reprezentat de 3 vectori:
	values - retine valorile nenule din A
	colind - retine indicii coloanelor in care se afla valorile nenule
	rowptr - retine pozitia indiciilor din vectorul values a elementelor
			 ce au aparut la inceput de linie in matricea A si pe ultima 
			 pozitie se gaseste nz + 1

La inceput am salvat in variabila n dimensiunea matricei A. Cu 2 for-uri am
parcurs matricea A si am verificat daca elementele din matrice sunt nenule. 
Daca da, values retine acel element, colind retine indicele coloanei pe care
se afla elementul si mai verificam daca elemntul respectiv este primul element
nenul din matrice. Daca da, rowptr retine pozitia din vectorul values a
elementului respectiv.
Dupa ce termin de construit vectorii values si colind retinem in nz lungimea 
lui values, iar pe ultima pozitie a vectorului rowptr stocam nz + 1.

3. function [G J, c J] = Jacobi factorization(A, b)

Functia intoarce matricea de iteratie G_J si vectorul de iteratie c_j pentru
metoda Jacobi. Pentru asta am folosit relatiile:
	N = diagonala lui A
	P = N - A
	Gj = ( N^(-1) ) * P
	cj = ( N ^ (-1)) * P

4. function [x] = Jacobi sparse(G values, G colind, G rowptr, c, tol)

Functia intoarce x aflat cu ajutorul metodei Jacobi. La inceput am declarat o
variabila prev_x ce retine rezulatul de la pasul anterior si l-am initializat
cu 0. Am iterat cu un while 1 si am calculat x-ul de la pasul curent cu functia
ajutatoare csr_multiplication() si pe urma l-am adunat cu vectorul de iteratie.
Am verificat daca eroare este mai mica decat toleranta. Daca da, iesim din 
while si l-am aflat pe x. Daca nu, vechiul x devine x si repetam pasii 
anteriori pana cand eroare devine mai mica decat toleranta.



2. K-Means - part-2
------------------------------------------------------------------------------

1. function [centroids] = clustering pc(points, NC)

Functia primeste o matrice points de dimensiune N x D, N = numarul de puncte,
D = coordonatele si numarul de clustere NC. Functia intoarce un vector de 
puncte centroids ce reprezinta cetrele de masa ale clusterelor.

La inceput am construit matricea de clustere de dimensiune NC X (N / NC), ea
retine punctele de coordonate si matricea de centroizi de dimensiune NC x D,
ea retine centrele de greutate ale punctelor de coordonate.

Am presupus ca 200 sa fie numarul maxim de iteratii. Am initializat cele NC
liste goale si cu reprezentantul sau. Pentru fiecare punct caut
cel mai apropiat centroid. Am presupus la inceput ca distanta minima sa fie 
egala cu realmax. Calculam distanta dintre centroizi folosind distanta
euclidiana. Am verificat daca distanta aflata este mai mica decat distanta
minima presupusa, clasificand astfel punctele dupa distantele minime. 
Recalculam pozitiile centroizilor ca fiind centrele de masa atribuite fiecarui
grup in parte. Repetam acest algoritm pana cand am atins numarul maxim de
iteratii sau cand am facut convergeta, adica pozitiile centroizilor nu se 
modifica.

2. function [cost] = compute cost pc(points, centroids)

Functia primeste ca parametrii matricea points de dimensiune N x D, points, si
vectorul points. Functia returneaza costul clusterului, adica suma
distantelor de la fiecare punct din points la centroidul clusterului caruia ii
apartine.

Parcurg vectorul points. Presupun distanta minima ca fiind realmax. Parcurgem 
centroizii si calculam distanta. Distanta aflata o comparam cu distanta minima.
Daca distanta aflata este mai mica decat distanta minima, acea distnta va
deveni noua distanta minima. Dupa ce termin de parcurs centroizii, calzulez
costul, costul fiind suma distantelor minime.



3. Householder prediction - part-3
-------------------------------------------------------------------------------

1. function [sol] = rgbHistogram(path to image, count bins)

Functia primeste ca parametri calea catre o imagine path_to_image si un numar 
de valori pentru axa orizontala a histogramei, count_bins. Functia intoarce un
vector ce reprezinta histograma RGB a pozei de la calea primita ca parametru.

Am citit imaginea si am extras din ea cele trei matrici ce reprezinta RGB.
Am initializat liste pentru fiecare culoare, liste in ce retin elementele
din intervalul in care se incadreaza. Cu un for am parcurs intervalele si
am calculat cate intervale se incadreaza in intervalul corect.
La final vectorul sol l-am aflat prin concatenarea celor 3 liste de culori.

2. function [sol] = hsvHistogram(path to image, count bins)

Analog rgbHistogram.

3. function [Q, R] = Householder(A

Functia primeste ca parametru o matrice A nepatrtica si returneaza matricea
ortogonala Q si matricea superior triunghiulara R.

Functia reprezinta o implementare a metodei de factorizare Householder.

4. function [x] = SST(A, b)

Functia primeste ca parametru o matrice A nepatrtica superior triunghiulara si
un vector coloana b. Functia returneaza un vector coloana x care este solutia
ecuatiei Ax = b.

Functia calculeaza un sistem superior triunghiular Ax = b.

5. function [X, y] = preprocess(path to dataset, histogram, count bins)

Functia primeste ca parametrii calea catre un set de imagini path_to_dataset,
tipul histogramei si un numar de valori pentru axa orizontala a histogramei
count_bins. Functia returneaza matricea de caracteristici X si vectorul coloana
de etichete y.

Am creat calea catre directorul care contine pozele cu pisici si catre
directorul care contine poze fara pisici. Am extras imginile din cele 2
directoare cu functia ajutatoare getImgNames().

Verificam tipul histogramei. Daca este de tip RGB sau HSV, cele 2 cazuri au
acelasi algoritm de lucru. Parcurgem pozele cu pisici. Cream calea catre
imagine. Adaug in matricea X rezulatul intors de functia rgbHistogram()/
hsvHistogram (depinde ce tip am). Adaug in vectorul y eticheta 1, reprezentand
poza cu pisica. Parcurgem pozele fara pisici. Cream calea catre imagine. Adaug
in X rezulatul intors de functie. Adaug in y eticheta -1, reprezentand poza
fara pisica.

6. function [w] = learn(X, y)

Functia primeste o matrice de caracteristici X si un vector coloana de
etichete y. Functia returneaza vectorul de parametri ai modelului w.

L-am creat pe X tilda. L-am descompus pe X in Q si R folosind metoda
Householder. L-am aflat pe w rezolvand un sistem superior triunghiular, apeland
functia SST().

7. function [percentage] = evaluate(path to testset, w, histogram, count bins)

Functia primeste calea catre un set de imagini de testare path_to_testset, 
vectorul de parametri ai modelului w, tipul hisogramei si un numar de valori
pentru axa orizontala a histogramei count_bins. Functia returneaza un procentaj
al numarului de imagini clasificate corect.

Am creat calea catre directorul ce contine poze cu pisici si catre directorul
ce contine poze fara pisici. Extragem pozele din cele 2 directoare cu functia
ajutatoare getImgNames(). Am declarat o variabila correct ce retine numarul
de poze clasificate corect.

Verificam tipul histogramei. Daca este de tip RGB sau HSV, in cele 2 cazuri se
aplica acelasi algoritm de lucru. 
Parcurgem pozele cu pisici. Cream calea 
catre imagine. Aflam histograma, il transpun pe x  si adaug coloana de 1.
Il calculez pe y dupa formula y = w' * x. Verificam tipul imaginii. Daca y este
mai mare sau egal decat 0 atunci poza este cu pisica si y ia valoarea 1, altfel
y ia valoarea -1 deoarece nu este poza cu pisica. Aflandu-ne in directorul in 
care se afla poze cu pisici ca sa clasificam corect poza, y trebuie sa aiba 
valoarea 1. 
Parcurgem pozele fara pisici. Aflam hitograma, il transpunem pe x si adaugam
coloana de 1. Il calculez pe y dupa formula. Verificam tipul imaginii.
Aflandu-ne in directorul cu poze fara pisici ca sa clasificam corect imaginea, 
y trebuie sa aiba valoarea -1.

Procentajul l-am calculat ca fiind catul dintre numarul de imagini clasificate 
corect si numarul total de poze, totul impartit la 100.
