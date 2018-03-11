clc; clear; close; %три входа в нейросеть
ConfigLSTM  %!ƒолжен быть в той же папке, что и выполн€ема€ программа
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
faseDataPath = fullfile(pwd,'fase','*.mat'); %загрузить сети дл€ определени€ фазы
ListTest=dir(faseDataPath);
CountTests=length(ListTest);

for i=1:CountTests
    a=load(ListTest(i).name);
    ListTF{i}=ListTest(i).name;
    netf(i)=a.net;
end
%сети загружены
i=1;
 while i<teachSigAmount %ввод обучающей последовательности
     m=0.7+rand*.8;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)+w2(3:8)*m;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:); X{i}=x; y(i)=-1; OUT(i,1)=2;OUT(i,2)=1;
         i=i+1; 
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)+w2(2:8)*m;OUT(i,1)=3;OUT(i,2)=1;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)+w2(1:8);OUT(i,1)=4;OUT(i,2)=1;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=+2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)+w2(1:8)*m;OUT(i,1)=5;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:);X{i}=x;  y(i)=+2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)+w2(1:8)*m;OUT(i,1)=6;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:11)=x(1,4:11)+w2(1:8)*m;OUT(i,1)=7;OUT(i,2)=1;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:11)=x(1,5:11)+w2(1:7)*m;OUT(i,1)=8;OUT(i,2)=1;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:);  X{i}=x;  y(i)=+1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:11)=x(1,6:11)+w2(1:6)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=9;OUT(i,2)=1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:11)=x(1,7:11)+w2(1:5)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=10;OUT(i,2)=1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:11)=x(1,8:11)+w2(1:4)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=11;OUT(i,2)=1;
         i=i+1;
         %minus
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)-w2(3:8)*m;
         x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=-1; OUT(i,1)=2;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)-w2(2:8)*m;
         x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=-1;OUT(i,1)=3;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)-w2(1:8)*m;
         x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=-2;OUT(i,1)=4;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)-w2(1:8)*m;OUT(i,1)=5;OUT(i,2)=-1;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=-2;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)-w2(1:8)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=-2;OUT(i,1)=6;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:11)=x(1,4:11)-w2(1:8)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=7;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:11)=x(1,5:11)-w2(1:7)*m;
         x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=8;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:11)=x(1,6:11)-w2(1:6)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=9;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:11)=x(1,7:11)-w2(1:5)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=10;OUT(i,2)=-1;
         i=i+1;
         x(1,:)=nN(i*GAP:i*GAP+GAP); x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; i=i+1;OUT(i,1)=0;OUT(i,2)=0; %zero
         x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:11)=x(1,8:11)+w2(1:4)*m;
         x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=+1;OUT(i,1)=11;OUT(i,2)=-1;
         i=i+1;
 end
 Ci=[];
 Y=categorical(y');
         X=X';
    for i=1:CountTests     
        YPred(:,i) = classify(netf(i),X);
        Ci=[Ci YPred(:,i)==categ];
    end
a=cell2mat(X);
b=a(1:3:end,:);
    inputs=[Ci b]';
    hiddenLayerSize=[50 35 15 8 5];
    targets=OUT(:,1)';
    inputSize = length(inputs(:,1)); %данные дл€ обучени€ готовы
  mtst=1000;
    for k=1 : 60
        Untitled2
        tst=valPerformance*30+testPerformance*70;
        fprintf('t%i \b', k)
        if tst<mtst 
            mtst=tst;
            fprintf('\n First Net %i \t', k)
            fprintf(' precise= %5.2f \n', mtst)
            
            %save the best net
            netR=net;
            trR=tr;
            VT=valTargets;
            TT=testTargets;
            outputsR=outputs;
            if mtst<0.5
                break
            end
        end
    end
    
    %load the best net
    netF=netR;
    errorsF = gsubtract(targets,outputs);
    performanceF = perform(net,targets,outputs);
    af=netF(inputs);
    bb=OUT(:,1)';
    ccf=af-bb;
    fprintf('\n Phase position TIKs STD mistake= %g5 \n',std(ccf))
    
%поиск знака
    hiddenLayerSize=[45 22 13 7 5];
    targets=OUT(:,2)';
    inputSize = length(inputs(:,1)); %данные дл€ обучени€ готовы
  mtst=100;
    for k=1 : 60
        Untitled2
        tst=valPerformance*30+testPerformance*70;
        fprintf('t%i \b', k)
        if tst<mtst 
            mtst=tst;
            fprintf('\n First Net %i \t', k)
            fprintf(' precise= %5.2f \n', mtst)
            
            %save the best net
            netR=net;
            trR=tr;
            VT=valTargets;
            TT=testTargets;
            outputsR=outputs;
            if mtst<0.5
                break
            end
        end
    end
    
%     load the best net
    netS=netR;
    errorsS = gsubtract(targets,outputs);
    performanceS = perform(net,targets,outputs);
    as=netS(inputs);
    ccs=as-targets;
    fprintf('\n Signum: STD mistake= %g3   correct ansver probability=%g3 %%  \n',std(ccs),(sum(round(as)==targets)/length(targets)*100))
         
        