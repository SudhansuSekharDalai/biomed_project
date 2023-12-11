%% Loading the Data
X_abn = load("ptbdb_abnormal.csv"); % 10506 X 188 % The abnormal ECG dataset
X_norm = load("ptbdb_normal.csv"); % 4046 X 188 % The normal ECG dataset
%% Test and Validation dataset
N = 200 % 2N is the size of test and validation dataset
% Feature extraction for the set of abnormal data
FMA = zeros(1, 30); %initializing the Feature Matrix for abnormal ECG
for i = 1:N
    % Wavelet transform daubechies wavelet. (db10)
    [C,L] = wavedec(X_abn(i,:),5,'db10');
    % Detail coefficients upto level 5
    [D1, D2, D3, D4, D5] = detcoef(C, L, [1 2 3 4 5]);
    % Approximation coefficients upto level 5
    A1 = appcoef(C, L, 'db10', 1);
    A2 = appcoef(C, L, 'db10', 2);
    A3 = appcoef(C, L, 'db10', 3);
    A4 = appcoef(C, L, 'db10', 4);
    A5 = appcoef(C, L, 'db10', 5);
    % Skewness,Kurtosis and standard deviations
    skd = [skewness(D1) skewness(D2) skewness(D3) skewness(D4) skewness(D5)];
    ska = [skewness(A1) skewness(A2) skewness(A3) skewness(A4) skewness(A5)];
    kd = [kurtosis(D1) kurtosis(D2) kurtosis(D3) kurtosis(D4) kurtosis(D5)];
    ka = [kurtosis(A1) kurtosis(A2) kurtosis(A3) kurtosis(A4) kurtosis(A5)];
    sdd = [std(D1) std(D2) std(D3) std(D4) std(D5)] ;
    sda = [std(A1) std(A2) std(D3) std(D4) std(D5)];
 FMA = [FMA; skd, ska kd ka sdd sda];
end
% Feature extraction for the set of normal data
FMN = zeros(1, 30);
for i = 1:N
    [C,L] = wavedec(X_norm(i,:),5,'db10');
    % Detail coefficients upto level 5
    [D1, D2, D3, D4, D5] = detcoef(C, L, [1 2 3 4 5]);
    % Approximation coefficients upto level 5
    A1 = appcoef(C, L, 'db10', 1);
    A2 = appcoef(C, L, 'db10', 2);
    A3 = appcoef(C, L, 'db10', 3);
    A4 = appcoef(C, L, 'db10', 4);
    A5 = appcoef(C, L, 'db10', 5);
    % Skewness,Kurtosis and standard deviations
    skd = [skewness(D1) skewness(D2) skewness(D3) skewness(D4) skewness(D5)];
    ska = [skewness(A1) skewness(A2) skewness(A3) skewness(A4) skewness(A5)];
    kd = [kurtosis(D1) kurtosis(D2) kurtosis(D3) kurtosis(D4) kurtosis(D5)];
    ka = [kurtosis(A1) kurtosis(A2) kurtosis(A3) kurtosis(A4) kurtosis(A5)];
    sdd = [std(D1) std(D2) std(D3) std(D4) std(D5)] ;
    sda = [std(A1) std(A2) std(D3) std(D4) std(D5)];
    FMN = [FMN; skd ska kd ka sdd sda];
end
% Final for training and validation
FM = [FMA(2:N+1, 1:30 ); FMN(2:N+1 , 1:30 )]; % feature matrix
GM = [zeros(N,1); ones(N,1)]; %group matrix
%% test set
T = 50 % 2T is the size of test dataset
%For the set of abnormal data
FMAT = zeros(1, 30); %initialising testing feature matrix for abnormal ECG
for i = 500:500+T
    [C,L] = wavedec(X_abn(i,:),5,'db10'); %floor(log2(188))
    % Detail coefficients upto level 5
    [D1, D2, D3, D4, D5] = detcoef(C, L, [1 2 3 4 5]);
    % Approximation coefficients upto level 5
    A1 = appcoef(C, L, 'db10', 1);
    A2 = appcoef(C, L, 'db10', 2);
    A3 = appcoef(C, L, 'db10', 3);
    A4 = appcoef(C, L, 'db10', 4);
    A5 = appcoef(C, L, 'db10', 5);
    % Skewness,Kurtosis and standard deviations
    skd = [skewness(D1) skewness(D2) skewness(D3) skewness(D4) skewness(D5)];
    ska = [skewness(A1) skewness(A2) skewness(A3) skewness(A4) skewness(A5)];
    kd = [kurtosis(D1) kurtosis(D2) kurtosis(D3) kurtosis(D4) kurtosis(D5)];
    ka = [kurtosis(A1) kurtosis(A2) kurtosis(A3) kurtosis(A4) kurtosis(A5)];
    sdd = [std(D1) std(D2) std(D3) std(D4) std(D5)] ;
    sda = [std(A1) std(A2) std(D3) std(D4) std(D5)];
    FMAT = [FMAT; skd ska kd ka sdd sda];
end
% for the set of normal data
FMNT = zeros(1, 30); %initialising testing feature matrix for normal ECG
for i = 500:500+T
    [C,L] = wavedec(X_norm(i,:),5,'db10'); %floor(log2(188))
    % Detail coefficients upto level 5
    [D1, D2, D3, D4, D5] = detcoef(C, L, [1 2 3 4 5]);
    % Approximation coefficients upto level 5
    A1 = appcoef(C, L, 'db10', 1);
    A2 = appcoef(C, L, 'db10', 2);
    A3 = appcoef(C, L, 'db10', 3);
    A4 = appcoef(C, L, 'db10', 4);
    A5 = appcoef(C, L, 'db10', 5);
    % Skewness,Kurtosis and standard deviations
    skd = [skewness(D1) skewness(D2) skewness(D3) skewness(D4) skewness(D5)];
    ska = [skewness(A1) skewness(A2) skewness(A3) skewness(A4) skewness(A5)];
    kd = [kurtosis(D1) kurtosis(D2) kurtosis(D3) kurtosis(D4) kurtosis(D5)];
    ka = [kurtosis(A1) kurtosis(A2) kurtosis(A3) kurtosis(A4) kurtosis(A5)];
    sdd = [std(D1) std(D2) std(D3) std(D4) std(D5)] ;
    sda = [std(A1) std(A2) std(D3) std(D4) std(D5)];
    FMNT = [FMNT; skd ska kd ka sdd sda];
end
% final for training
FMT = [FMAT(2:T+1, 1:30 ); FMNT(2:T+1 , 1:30 )]; % feature matrix for testing
GMT = [zeros(T,1); ones(T,1)]; % group matrix for testing