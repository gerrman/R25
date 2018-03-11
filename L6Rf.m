%��� CNN ���� ������, ���� LSTM ������������ ����������, ��� ������������
%����������� ���� ��������� �������� �������� � ����
 clc;clear;close;
global out GAP nou TFn Tn n_r  sig_r n  Ls sig_rc resm decision az zzp zzm zozp zozm
run('ConfigLF');
MascYes=zeros(Nrows,1);
for i=1:length(PosVeivlet)
    MascYes(PosVeivlet(i)-Fract/2:PosVeivlet(i)+2.5*LenVeivlet(i))=2^i;
end
MascNo=~MascYes;
TL=Nrows;
    oldFolder = cd('..');
    userpath = cd; %��������� �������� �������
    cd(oldFolder);
[DataFileName,DataPathName] = uigetfile('*.txt','Hi, Select the *.txt Data file', [userpath sig_Loc DataFileName]);
% Create new variables in the base workspace from those fields.
newData1 = importdata([DataPathName DataFileName]); 
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end
n=reshape(data,InputCanals,Nrows);
Tn=n'; %������� ������ ������
%nD=std(n); %�������� ���� ��� ��� �� �������� ��������
%inD=10./std(n); %���������� �� ������ C�� ��� ������� ��� ��������
%for i=1:520
%    inDm(i,:)=inD;
%end
corrector=0;corrector1=0;corr1=0;corr11=0;corr2=0;corr21=0;
load(nets); load(lstmNet);load(lnetF); load(lnetS);
fprintf('Data Path = %s \n ', [DataPathName DataFileName])
%n=n.*inDm; %����������� ������� ������ � �����
tic
 Ta=abs(Tn);
 nD=std(Tn);
 %kStd=mean(nD);
 %kMean=mean(mean(Ta));
% n=uint8(Ta*255/5.2/mean(mean(Ta)));
% qu=1.85+1.8/mean(std(Tn))*mean(mean(Ta));
%  ka=mean(std(Tn));
 ka=std(Tn(Tn~=0));
agres=sum(sum(Ta>ka*4))/2000;
Nsig=Nsigma;
        if agres>3
            Nsig=Nsigma-corrector*(corr2*agres*agres-corr1*agres);
        end
%  n=Ta.*255/Nsig/4.;
%                                               begin
n=Ta.*255/Nsig*0.2;
for j=1:TL-Fract
     ka=std(Tn(Tn(j:j+Fract-1,:)~=0));
    nn(:,:,1,j)=uint8(n(j:j+Fract-1,:)/ka);
end
resm = classify(convnet,nn);
Nsig1=Nsigma1;
        if agres>3
            Nsig1=Nsigma1-corrector1*(corr21*agres*agres-corr11*agres);
        end
%  n=Ta.*255/Nsig1/4.;
n=Ta.*255/Nsig1*0.2;
for j=1:TL-Fract
    ka=mean(std(Tn(Tn(j:j+Fract-1,:)~=0)));
    nn(:,:,1,j)=uint8(n(j:j+Fract-1,:)/ka);
end
resm1= classify(convnet1,nn);
resm=resm=='1';
resm1=resm1=='1';
resm=resm | resm1;
% resm=resm1;
resm=[zeros(fix(Fract*3/4),1); resm; zeros(fix(Fract/4),1)];
resml=resm;
% paintCNN
GoodDes=resm.*MascYes;
BadDes=resm.*MascNo;
fprintf('Number of bad tics:  %g, Bad tics procents: %5.2g %% \n', sum(BadDes),sum(BadDes)*100/214)
NumDes=0;
for i=1:length(PosVeivlet)
            NumDes(i)=any(resm(PosVeivlet(i)-Fract/2:PosVeivlet(i)+2.5*LenVeivlet(i)));
end
%                                           End CNN
fprintf('Number of good decisions:  %g \n', sum(NumDes))
fprintf(' Find decisions  ')
fprintf(' %g',find(NumDes==1))
fprintf('\n Lost decisions')
fprintf(' %g',find(NumDes==0))
fprintf('\n')
%discret canals analisus
decision_N=1; %���������� ������������� ������� ���� �5 ��� �������� �������������� �������
nkd=30; %������� �� ������� � ������
nkd=nkd*Canals/InputCanals;
sig_rc=CanalDecision; %������� ������� ��� ��������� �������
n_r=decision_N;
sig_r=decision;
inD=10./nD; %���������� �� ������ C�� ��� ������� ��� ��������
for i=1:520
    inDm(i,:)=inD;
end
Tn=Tn.*inDm; %����������� ������� ������ � �����
TFn=Tn;  %TFn=abs(Tn);
resm1=resm(1:519-GAP);
nou=[];
ou_=zeros(Nrows,Canals);
LsShift=Ls; %���������� �� ����� ������� �� ��������� ���� �� ������� �������� ����
Rset=find(resm1==1)-LsShift;
Rset=Rset(find(Rset>0));
        
        for ri=1:length(Rset)
            j=Rset(ri);
            for i=1:Canals
                qq(1,:)=Tn(j:(j+GAP-1),i)';
                qq(1,:)=qq(1,:)*0.8;
                qq(2,:)=abs(qq(1,:));
                qq(3,:)=-qq(1,:);
                q{i}=qq;
            end
            Ci=[];
            for k=1:numel(ListTF)     
                YPred(:,k) = classify(netf(k),q);
                Ci=[Ci YPred(:,k)==categ];
            end
            af=cell2mat(q');
            inputs=[Ci af(1:3:end,:)]';
            Phase=round(netF(inputs))';
            Sign=round(netS(inputs))';
            for k=1:Canals
                ou_(j+Phase(k),k)=ou_(j+Phase(k),k)+Sign(k)';
            end
                
end  %������ ���������� ���������� �� ������� ������ ��������

 out=ou_;
 resm1=resm;
 resm=[];
 for i=1:Canals
     resm(i,:)=resm1(:);
 end
 resm=resm';
paint17
hert=length(resm1)/toc;
fprintf('\n %g Herz    \n \n', hert)
run('rfile2v3R17'); 
clear colheaders textdata data i j p0 ou_ b TF in inD inDm nD 
clear newData1 tr tr1 vars Tot lann lanm ou1_ d des bD
qltic=sum(sum(abs(Tn'))>0); %�������� ���������� ����� � �������
qlcan=552; %�������� ���������� ������� � �������
qlcan=3000;
%qlcan=Canals;
NoEll=0; %������� ������������� ������� �������
qn=Tn(1:qltic,1:qlcan)'; %�������� �������
qnn=qn; %��� �������
if NoEll==1
    load NoEllips
    for i=1:qlcan
        qn(i,:)=qn(i,:).*NoEllips(1,:); %�������� �������, ������� ����� ��������� ��� ���
    end
end
qou=out(1:qltic,1:qlcan)'; %������� ������������� ���� �� �������� ��������
qoud=abs(qou)==2; %��� ��������� ��������
TabName=DataFileName(1:length(DataFileName)-4); %�������� ������� ������, ���� ����� ��������� ������
z=qn.*qoud; %�������� ������ � ������, ��� ���������� ��������
az=qn.*(~qoud);%��� � ������ �������
zzp=(z>0).*z; %������ ������������� ��������
zzm=(z<0).*z; %������ ������������� ��������
zzpn=sum(zzp); %���������� ������������� ��������� � ����
zzmn=sum(zzm); %���������� ������������� ��������� � ����

zozp=(qou==2).*z; %������ ������������� �������� (������������� �� ������� ����)
zozm=(qou==-2).*z; %������ ������������� �������� (������������� �� ������� ����)
zozpn=sum(zozp>0); %���������� ������������� ��������� � ����
zozmn=sum(zozm<0); %���������� ������������� ��������� � ����
%save TabName qn qou qoud z zzp zzm zzpn zzmn
a=['save ' TabName ' qn qou qoud z zzp zzm zzpn zzmn az'] 
for i=1:length(qoud(:,1))
    p=~qoud(i,:).*resml;
end









