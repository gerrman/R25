function paint(cc)
global out resm Tn decision
ltic=length(Tn(:,1))-length(resm(:,1));
lcan=length(Tn(1,:));
if exist('cc')==0
    cc=length(out(1,:));
end
rgb=[];
raz=~resm;
bo=out<decision; %��� ����� ������� ���� �� �����������
b1=out>=decision; %������������ ����� �������
r=bo*0.9+raz;
g=bo+raz;
b=1-(((b1.*out)-decision)/(1-decision));
b(b>1)=1;
rgb(:,:,1)=r';
rgb(:,:,2)=g';
rgb(:,:,3)=b';
rgb=[rgb ones(lcan,ltic,3)]; %������������ ����������� ������� 
qb=rgb(1:cc,:,:);
rgbn=[];
mampl=3*mean(std(Tn));
rgbn(:,:,3)=abs(Tn')/mampl;
rgbn(:,:,2)=abs(Tn')/mampl;
rgbn(:,:,1)=1;
rgbn(rgbn>1)=1;
rgbn(:,:,3)=1-rgbn(:,:,3);
rgbn(:,:,2)=1-rgbn(:,:,2);
qbn=rgbn(1:cc,:,:); %����������� ��������� �������
q=[qbn; qb];
image(q)
