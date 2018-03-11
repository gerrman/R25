clc; clear; close; %три входа в нейросеть
ConfigLSTM  %!Должен быть в той же папке, что и выполняемая программа
w2=wav(1:2:length(wav))/3; lw2=length(w2); wmp2=wawMaxPoint/2;
w3=wav(1:3:length(wav)); lw3=length(w3); wmp3=wawMaxPoint/3;
    oldFolder = cd('..');
    userpath = cd; %присвоить основной каталог
    cd(oldFolder);
newData1 = importdata([userpath sig_Loc  noiseN]); 
nN=newData1.data*7/std(newData1.data);
nN=nN';
newData1 = importdata([userpath sig_Loc  noiseT4]); 
nt4=newData1.data/std(newData1.data); %загружен шум
nt4=nt4';
i=1;
 while i<teachSigAmount
     m=0.8+rand*.9;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)+w2(3:8)*m;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:); X{i}=x; y(i)=4; OUT(i,1)=2;OUT(i,2)=1;
         i=i+1; 
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)+w2(2:8)*m;OUT(i,1)=3;OUT(i,2)=1;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=4;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)+w2(1:8);OUT(i,1)=4;OUT(i,2)=1;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=+3;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)+w2(1:8)*m;OUT(i,1)=5;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:);X{i}=x;  y(i)=+3;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)+w2(1:8)*m;OUT(i,1)=6;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+3;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:11)=x(1,4:11)+w2(1:8)*m;OUT(i,1)=7;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:11)=x(1,5:11)+w2(1:7)*m;OUT(i,1)=8;OUT(i,2)=1;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:);  X{i}=x;  y(i)=+2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:11)=x(1,6:11)+w2(1:6)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+2;OUT(i,1)=9;OUT(i,2)=1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:11)=x(1,7:11)+w2(1:5)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=10;OUT(i,2)=1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:11)=x(1,8:11)+w2(1:4)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=11;OUT(i,2)=1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,9:11)=x(1,9:11)+w2(1:3)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=11;OUT(i,2)=1;
         i=i+1;
         %minus
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)-w2(3:8)*m;
         x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=4; OUT(i,1)=2;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)-w2(2:8)*m;
         x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=4;OUT(i,1)=3;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)-w2(1:8)*m;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=-3;OUT(i,1)=4;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)-w2(1:8)*m;OUT(i,1)=5;OUT(i,2)=-1;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=-3;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)-w2(1:8)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-3;OUT(i,1)=6;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:11)=x(1,4:11)-w2(1:8)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-2;OUT(i,1)=7;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:11)=x(1,5:11)-w2(1:7)*m;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=-2;OUT(i,1)=8;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:11)=x(1,6:11)-w2(1:6)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-2;OUT(i,1)=9;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:11)=x(1,7:11)-w2(1:5)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-1;OUT(i,1)=10;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:11)=x(1,8:11)+w2(1:4)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-1;OUT(i,1)=11;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,9:11)=x(1,9:11)+w2(1:3)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-1;OUT(i,1)=11;OUT(i,2)=-1;
         i=i+1;
 end
         Y=categorical(y');
         X=X';
         inputSize = length(x(:,1));
outputSize = 22;
outputMode = 'last';
% outputMode = 'sequence';
numClasses = numel(unique(Y));

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(outputSize,'OutputMode',outputMode)
    fullyConnectedLayer(11)
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]
maxEpochs = 2600;
miniBatchSize = 200;
% shuffle = 'never';
shuffle ='every-epoch';

options = trainingOptions('sgdm', ...
    'MaxEpochs',maxEpochs, ...
    'Plots','training-progress',...
    'MiniBatchSize',miniBatchSize, ...
    'Shuffle', shuffle);
net = trainNetwork(X,Y,layers,options);
YPred = classify(net,X, ...
    'MiniBatchSize',miniBatchSize);
acc = sum(YPred == Y)./numel(Y)
GAP=GAP+1;
         
        