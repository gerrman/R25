MainCatalog='MATLAB'; %�����, � ������� ��������� ��� ����� ������
sig_Loc='\Data\data10\'; %������������ ����� � �������������� ��������� ��������� ������ ����� Matlab
lstmNet='netF0.mat';
lnetF='netF5.mat';
lnetS='netS4.mat';

noiseN='noise-norm10.txt'; %�������� �����, ����������� ���
noiseT4='noise-t4.txt'; 
%pnoise='noise-t2.txt'; 
%pnoise='noise-t3.txt';

SlowAmpCompensator=1; %�������� ���������� �������� ������ �������
GAP=10; %����� ��������� ������������������ ��� ���������

redname='\RedRezult'; %�������� ����� ��� ���������� ���������� � ����� Matlab
Separ=' '; %������ - ����������� � �����; ����� ',' ��� ';' ��� '\t' - ��������� � �.�.

teachSigAmount=3000;
testSigAmount=40000;
InputCanals=3000; %���������� ������� � ����������� �����
Canals=3000; %���������� �������������� �������
decision_N=1; %���������� ������������� ������� ���� �5 ��� �������� �������������� �������
decision_L=0.5; %������� ������� ���� �5, ����������� ��� �������� �������

wav=[0.052963773	3.308756736	12.25263832	23.95902383	39.84691746	49.58347052	43.82809848	28.62752511...
    9.170917639	-11.41069078	-14.2172107	-8.428599101	-3.185742285	5	4.539915865	0.216003248];
wavMax=max(wav);
wawMaxPoint=find(wav==wavMax);
categ=categorical({'0', '1', '-1', '2', '-2'});
noncat=[0 1 -1 2 -2];
