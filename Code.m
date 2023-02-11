clear all;

X = dir("Clean_ECG\*.mat");          %all files with .mat extension moved into this directory
Y = dir("Pathological_ECG\*.mat");
Z = dir("Clean_ECG_Test\*.mat");
W = dir("Pathological_ECG_Test\*.mat");

%Clean ECG

for i = 1:140
    
   CleanECG(i)=load(append(X(i).folder,'\',X(i).name));
   
end

for i = 1:140

   [c, l] = wavedec (CleanECG(i).val, 5 , 'db10'); %daubecheies lvl 5 order 10, c is coeff and l is level

   A1 = appcoef(c, l, 'db10',1); % Finding approx coefficients
   A2 = appcoef(c, l, 'db10',2); 
   A3 = appcoef(c, l, 'db10',3); 
   A4 = appcoef(c, l, 'db10',4); 
   A5 = appcoef(c, l, 'db10',5); 

   [D1, D2, D3, D4, D5] = detcoef(c, l, [1 2 3 4 5]); %Finding detail coefficients

   ske(i,1) = skewness(D1);  %skewness kurtosis and standard deviation
   kur(i,1) = kurtosis(D1);
   sd(i,1)  = std(D1);
   ske(i,2) = skewness(D2);
   kur(i,2) = kurtosis(D2);
   sd(i,2)  = std(D2);
   ske(i,3) = skewness(D3);
   kur(i,3) = kurtosis(D3);
   sd(i,3)  = std(D3);
   ske(i,4) = skewness(D4);
   kur(i,4) = kurtosis(D4);
   sd(i,4)  = std(D4);
   ske(i,5) = skewness(D5);
   kur(i,5) = kurtosis(D5);
   sd(i,5)  = std(D5);

   aske(i,1) = skewness(A1);
   akur(i,1) = kurtosis(A1);
   asd(i,1)  = std(A1);
   aske(i,2) = skewness(A2);
   akur(i,2) = kurtosis(A2);
   asd(i,2)  = std(A2);
   aske(i,3) = skewness(A3);
   akur(i,3) = kurtosis(A3);
   asd(i,3)  = std(A3);
   aske(i,4) = skewness(A4);
   akur(i,4) = kurtosis(A4);
   asd(i,4)  = std(A4);
   aske(i,5) = skewness(A5);
   akur(i,5) = kurtosis(A5);
   asd(i,5)  = std(A5);
   
   for j = 1:5
       aa(i,j)    = ske(i,j);       %creation of aa variable
       aa(i,j+5)  = kur(i,j);       %skewness, kurtosis and sd of detail coefficients in first 15 columns
       aa(i,j+10) = sd(i,j);        %next 15 columns contain same parameter for aprrox coefficients
       aa(i,j+15) = aske(i,j);
       aa(i,j+20) = akur(i,j);
       aa(i,j+25) = asd(i,j);
   end
   
end

for i = 1:140
    aa(i,31)=1;
end

%Pathological ECG

for i = 1:600
    
   PathologicalECG(i)=load(append(Y(i).folder,'\',Y(i).name));
   
end

for i = 1:600

   [c, l] = wavedec (PathologicalECG(i).val, 5 , 'db10'); %daubecheies lvl 5 order 10, c is coeff and l is level

   A1 = appcoef(c, l, 'db10',1); % Finding approx coefficients
   A2 = appcoef(c, l, 'db10',2); 
   A3 = appcoef(c, l, 'db10',3); 
   A4 = appcoef(c, l, 'db10',4); 
   A5 = appcoef(c, l, 'db10',5); 

   [D1, D2, D3, D4, D5] = detcoef(c, l, [1 2 3 4 5]); %Finding detail coefficients

   ske(i,1) = skewness(D1);  %skewness kurtosis and standard deviation
   kur(i,1) = kurtosis(D1);
   sd(i,1)  = std(D1);
   ske(i,2) = skewness(D2);
   kur(i,2) = kurtosis(D2);
   sd(i,2)  = std(D2);
   ske(i,3) = skewness(D3);
   kur(i,3) = kurtosis(D3);
   sd(i,3)  = std(D3);
   ske(i,4) = skewness(D4);
   kur(i,4) = kurtosis(D4);
   sd(i,4)  = std(D4);
   ske(i,5) = skewness(D5);
   kur(i,5) = kurtosis(D5);
   sd(i,5)  = std(D5);

   aske(i,1) = skewness(A1);
   akur(i,1) = kurtosis(A1);
   asd(i,1)  = std(A1);
   aske(i,2) = skewness(A2);
   akur(i,2) = kurtosis(A2);
   asd(i,2)  = std(A2);
   aske(i,3) = skewness(A3);
   akur(i,3) = kurtosis(A3);
   asd(i,3)  = std(A3);
   aske(i,4) = skewness(A4);
   akur(i,4) = kurtosis(A4);
   asd(i,4)  = std(A4);
   aske(i,5) = skewness(A5);
   akur(i,5) = kurtosis(A5);
   asd(i,5)  = std(A5);
end

for i = 141:740
    for j = 1:5
        aa(i,j)    = ske(i-140,j);       %aa variable continuation
        aa(i,j+5)  = kur(i-140,j);       %skewness, kurtosis and sd of detail coefficients in first 15 columns
        aa(i,j+10) = sd(i-140,j);        %next 15 columns contain same parameter for aprrox coefficients
        aa(i,j+15) = aske(i-140,j);
        aa(i,j+20) = akur(i-140,j);
        aa(i,j+25) = asd(i-140,j);
    end
end
for i = 141:740
    aa(i,31)=0;
end

%Test ECG
%Test Clean ECG

for i = 1:80
    
   CleanECGTest(i)=load(append(Z(i).folder,'\',Z(i).name));
   
end

for i = 1:80

   [c, l] = wavedec (CleanECGTest(i).val, 5 , 'db10'); %daubecheies lvl 5 order 10, c is coeff and l is level

   A1 = appcoef(c, l, 'db10',1); % Finding approx coefficients
   A2 = appcoef(c, l, 'db10',2); 
   A3 = appcoef(c, l, 'db10',3); 
   A4 = appcoef(c, l, 'db10',4); 
   A5 = appcoef(c, l, 'db10',5); 

   [D1, D2, D3, D4, D5] = detcoef(c, l, [1 2 3 4 5]); %Finding detail coefficients

   ske(i,1) = skewness(D1);  %skewness kurtosis and standard deviation
   kur(i,1) = kurtosis(D1);
   sd(i,1)  = std(D1);
   ske(i,2) = skewness(D2);
   kur(i,2) = kurtosis(D2);
   sd(i,2)  = std(D2);
   ske(i,3) = skewness(D3);
   kur(i,3) = kurtosis(D3);
   sd(i,3)  = std(D3);
   ske(i,4) = skewness(D4);
   kur(i,4) = kurtosis(D4);
   sd(i,4)  = std(D4);
   ske(i,5) = skewness(D5);
   kur(i,5) = kurtosis(D5);
   sd(i,5)  = std(D5);

   aske(i,1) = skewness(A1);
   akur(i,1) = kurtosis(A1);
   asd(i,1)  = std(A1);
   aske(i,2) = skewness(A2);
   akur(i,2) = kurtosis(A2);
   asd(i,2)  = std(A2);
   aske(i,3) = skewness(A3);
   akur(i,3) = kurtosis(A3);
   asd(i,3)  = std(A3);
   aske(i,4) = skewness(A4);
   akur(i,4) = kurtosis(A4);
   asd(i,4)  = std(A4);
   aske(i,5) = skewness(A5);
   akur(i,5) = kurtosis(A5);
   asd(i,5)  = std(A5);
   
   for j = 1:5
       ab(i,j)    = ske(i,j);       %creation of ab variable (test variable)
       ab(i,j+5)  = kur(i,j);       %skewness, kurtosis and sd of detail coefficients in first 15 columns
       ab(i,j+10) = sd(i,j);        %next 15 columns contain same parameter for aprrox coefficients
       ab(i,j+15) = aske(i,j);
       ab(i,j+20) = akur(i,j);
       ab(i,j+25) = asd(i,j);
   end
   
end

for i = 1:80
    ab(i,31)=1;
end

%Test Pathological ECG


for i = 1:80
    
   PathologicalECGTest(i)=load(append(W(i).folder,'\',W(i).name));
   
end

for i = 1:80

   [c, l] = wavedec (PathologicalECGTest(i).val, 5 , 'db10'); %daubecheies lvl 5 order 10, c is coeff and l is level

   A1 = appcoef(c, l, 'db10',1); % Finding approx coefficients
   A2 = appcoef(c, l, 'db10',2); 
   A3 = appcoef(c, l, 'db10',3); 
   A4 = appcoef(c, l, 'db10',4); 
   A5 = appcoef(c, l, 'db10',5); 

   [D1, D2, D3, D4, D5] = detcoef(c, l, [1 2 3 4 5]); %Finding detail coefficients

   ske(i,1) = skewness(D1);  %skewness kurtosis and standard deviation
   kur(i,1) = kurtosis(D1);
   sd(i,1)  = std(D1);
   ske(i,2) = skewness(D2);
   kur(i,2) = kurtosis(D2);
   sd(i,2)  = std(D2);
   ske(i,3) = skewness(D3);
   kur(i,3) = kurtosis(D3);
   sd(i,3)  = std(D3);
   ske(i,4) = skewness(D4);
   kur(i,4) = kurtosis(D4);
   sd(i,4)  = std(D4);
   ske(i,5) = skewness(D5);
   kur(i,5) = kurtosis(D5);
   sd(i,5)  = std(D5);

   aske(i,1) = skewness(A1);
   akur(i,1) = kurtosis(A1);
   asd(i,1)  = std(A1);
   aske(i,2) = skewness(A2);
   akur(i,2) = kurtosis(A2);
   asd(i,2)  = std(A2);
   aske(i,3) = skewness(A3);
   akur(i,3) = kurtosis(A3);
   asd(i,3)  = std(A3);
   aske(i,4) = skewness(A4);
   akur(i,4) = kurtosis(A4);
   asd(i,4)  = std(A4);
   aske(i,5) = skewness(A5);
   akur(i,5) = kurtosis(A5);
   asd(i,5)  = std(A5);
   
end
for i = 81:160
   for j = 1:5
       ab(i,j)    = ske(i-80,j);       %continuation of ab variable
       ab(i,j+5)  = kur(i-80,j);       %skewness, kurtosis and sd of detail coefficients in first 15 columns
       ab(i,j+10) = sd(i-80,j);        %next 15 columns contain same parameter for aprrox coefficients
       ab(i,j+15) = aske(i-80,j);
       ab(i,j+20) = akur(i-80,j);
       ab(i,j+25) = asd(i-80,j);
   end
end

for i = 81:160
    ab(i,31)=0;
end