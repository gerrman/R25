clc; clear; close; %рабочая версия. хорошо видно, что работа сети зависит от предыдущего сигнала
ConfigLSTM8  %!Должен быть в той же папке, что и выполняемая программа
w2=wav(1:2:length(wav))/2.5; lw2=length(w2); wmp2=wawMaxPoint/2;
w3=wav(1:3:length(wav)); lw3=length(w3); wmp3=wawMaxPoint/3;
    oldFolder = cd('..');
    userpath = cd; %присвоить основной каталог
    cd(oldFolder);
newData1 = importdata([userpath sig_Loc  noiseN]); 
nN=newData1.data*10/std(newData1.data);
nN=nN'; 
newData1 = importdata([userpath sig_Loc  noiseT4]); 
nt4=newData1.data/std(newData1.data); %загружен шум
nt4=nt4';
i=1; ll=0.0;
while i<testSigAmount
     nN(randi(10)+1:20)=[];
     for j=1:20    
         m=0.1*j;
     %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

     %plus
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)+w2(3:8)*m;
             x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=1; M(i)=m; RX{i}=-x; Mz(i)=1;
             i=i+1;x(3,:)=-x(1,:); X{i}=-x; y(i)=1; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)+w2(2:8)*m;
             x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=2;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=2; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)+w2(1:8);
             x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=3;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=3; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)+w2(1:8)*m;
             x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=4;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=4; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)+w2(1:8)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=5;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=5; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:10)=x(1,4:10)+w2(1:7)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=6;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=6; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:10)=x(1,5:10)+w2(1:6)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=7;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=7; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:10)=x(1,6:10)+w2(1:5)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=8;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=8; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:10)=x(1,7:10)+w2(1:4)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=9;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=9; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:10)=x(1,8:10)+w2(1:3)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=10;M(i)=m;RX{i}=-x;Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=10; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;
             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,9:10)=x(1,9:10)+w2(1:2)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=11; M(i)=m; RX{i}=-x; Mz(i)=1;
             i=i+1;X{i}=-x; y(i)=11; M(i)=m; RX{i}=x; Mz(i)=-1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

   %minus
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:6)=x(1,1:6)-w2(3:8)*m;
             x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=1; M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=1; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,1:7)=x(1,1:7)-w2(2:8)*m;
             x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=2;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=2; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,1:8)=x(1,1:8)-w2(1:8)*m;
             x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=3;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=3; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,2:9)=x(1,2:9)-w2(1:8)*m;
             x(2,:)=abs(x(2,:));x(3,:)=-x(1,:); X{i}=x;  y(i)=4;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=4; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,3:10)=x(1,3:10)-w2(1:8)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=5;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=5; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,4:10)=x(1,4:10)-w2(1:7)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=6;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=6; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);   x(1,5:10)=x(1,5:10)-w2(1:6)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=7;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=7; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,6:10)=x(1,6:10)-w2(1:5)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=8;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=8; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,7:10)=x(1,7:10)-w2(1:4)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=9;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=9; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:));x(3,:)=-x(1,:); X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;

             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,8:10)=x(1,8:10)-w2(1:3)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=10;M(i)=m;RX{i}=-x;Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=10; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             %zero
             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;             x(1,:)=nN(i*GAP:i*GAP+GAP); x(1,2:9)=x(1,2:9)+w2(1:8)*ll; x(2,:)=abs(x(1,:)); x(3,:)=-x(1,:);X{i}=x; y(i)=0; M(i)=0; RX{i}=-x; Mz(i)=0;%zero
             i=i+1;
             
             x(1,:)=nN(i*GAP:i*GAP+GAP);  x(1,9:10)=x(1,9:10)-w2(1:2)*m;
             x(2,:)=abs(x(2,:)); x(3,:)=-x(1,:); X{i}=x;  y(i)=11; M(i)=m; RX{i}=-x; Mz(i)=-1;
             i=i+1;X{i}=-x; y(i)=11; M(i)=m; RX{i}=x; Mz(i)=1; i=i+1;
             
     end
end
         X=X';y=y';M=M';load('3l8net24.mat');   %загрузить нейросеть  
YPred = classify(net,X); %RYPred=classify(net,RX);
% for i=1:length(X)
%     YPred(i)=classify(net,X{1});
% end 
% YPred=YPred';
%реакция на шум
noise=find(y==0);
noisey=YPred(noise);%noiseym=RYPred(noise);
des=sum(noisey==categ8);
MistNoiseToSig=sum(des(2:8))/length(noise);
CorrectNoise=des(1)/length(noise);
%Узнавание сигнала в зависимости от места вершинки (от 1 до 10) for S/N=...
% list=find(M>0.69 & M<0.99);
mi=unique(M);
mis=mi(2); %выбрано отношение сигнал/шум
list1=find(M==mis);
yy=y(list1);
YPre=YPred(list1);
Mzz=Mz(list1);
for i=1:11
    xrez=find(yy==i);
    YP=YPre(xrez);%YR=RYPred(xrez);
    Mzzi=Mzz(xrez);
    len(i)=length(xrez);
    win(i,:)=sum(YP==categ8);
    Prob1(i)=sum(win(i,2:3))/len(i);
    Prob2(i)=sum(win(i,4:5))/len(i);
    Prob3(i)=sum(win(i,6:7))/len(i);
    Prob4(i)=win(i,8)/len(i);
    ProbMist(i)=win(i,1)/len(i);
end
PW=((win(:,4)+win(:,5))./len(:))';
PM=(win(:,1)./len(:))';
winp=sum(win(10:11,2))/(len(10)+len(11))
winm=sum(win(10:11,3))/(len(10)+len(10))
fprintf('Вероятность принять шум за сигнал %5.3g, Вероятность верно определить шум %5.3g \n',MistNoiseToSig,CorrectNoise)
fprintf('Отношение Сигнал/Шум=%g \n',mis)
figure
% subplot(1,2,1)
plot(Prob1,'-r','LineWidth',1)
% subplot(2,1,1)
hold on
% subplot(2,1,2)
plot(ProbMist,'-m')
plot(Prob2,'-g','LineWidth',2)
plot(Prob3,'-b','LineWidth',2)
plot(Prob4,'-y','LineWidth',2)
plot([1 11],[MistNoiseToSig MistNoiseToSig],':b')
plot([1 11],[CorrectNoise CorrectNoise],':k')
grid on
title('10-11(красн),8-9(зел),6-7(син),3-5(желт)')
xlabel('положение вершинки на анализируемом отрезке (тик)')
ylabel('Вероятность')
axis([1 11 0 1])
fprintf('Доля угаданных вершинок, Доля ошибочно указанных нулей при наличии сигнала \n')
[PW' PM']
mean([PW' PM'])
lisa=find(y==10 | y==11 | y==9 | y==8 | y==7 | y==6);
% lisa=find(y>-1);
MM=M(lisa);
YPre1=YPred(lisa);
for i=1:length(mi)
    xrei=find(MM==mi(i));
    YP1=YPre1(xrei);%YPM1=RYPred(xrei);
    leni(i)=length(xrei);
    wini(i,:)=sum(YP1==categ8);
    ProbWini(i)=sum(wini(i,2:7))/leni(i);
    ProbMisti(i)=wini(i,1)/leni(i);
end
figure
%subplot(1,2,2)
plot(mi,ProbWini,'-r','LineWidth',2)
hold on
plot(mi,ProbMisti,'-b')
grid on
title('Сигнал распознан(красная), Ошибка "НЕТ"(синяя)')
xlabel('Отношение сигнал/шум')
ylabel('Вероятность')
fprintf('S/N  %верных решений  %ошибок')
axis([min(mi) max(mi) 0 1])
[mi ProbWini' ProbMisti']






    
    








         
        