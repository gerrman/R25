sig_Loc='\Data\'; %������������ ����� � �������������� ��������� ��������� ������ ����� Matlab
DataFileName = 'data.txt'; %�������� �����, ����������� ������� ���� ���+�������
RedResult='RedResult.txt'; %�������� ����� ��� ���������� ���������� � ����� Matlab
Separ='\t'; % ����������� � �����; ����� ',' ��� ������ ��� '\t' - ��������� � �.�.

InputCanals=3000; %���������� ������� � ����������� �����
Canals=3000; %���������� �������������� �������

Nrows=520;%���������� ����� � ����������� �����
Fract=8; %���������� ����� � ����
Step=1; %��� �������� ���� ��� ������ �������� �� �������
Sort=0; %������� ���������� ������� �� �������
Nsigma=3; %��������� ���� ��� ��������� � ������������ ���������


DemoRedResult=0; %�������� ���������� ����� ������ ����������
DemoPaint=1; %������������ ������������ ����������

SlowAmpCompensator=1; %�������� ���������� �������� ������ �������

decision=0.3; %������� ������� ���� �5, ����������� ��� �������� ������� ��� ����������� ���� ����������� ������
CanalDecision=0.92; %������� �������, ����������� ��� �������� ������� ��� ����� ����

nets='NetM6.mat'; 
LenVeivlet=[12 12 12 12 12 12 12 12 12];
PosVeivlet=[50 100 150 200 250 300 350 400 450];
