%-`mask_Cartesian.m`�������ɵѿ���ģ�塣 ����ѡ��ģ���С�Ͷ���������
clc;close all;clear all;
Num_fixed=20;   %������������
Num_Ran=80 ;     %���������������
M=256; N=256;   %����ģ���С(M+2,N+2)

Mf=round(M/2);
Nf=round(N/2);

NH1=1:(Mf-Num_fixed/2);
NH2=(Mf+Num_fixed/2+1):M;
z1=length(NH1);
ranlist1= randperm(z1);  % randperm �������һ�����к��� y = randperm(n) y�ǰ�1��n��Щ��������ҵõ���һ����������
z2=length(NH2);
ranlist2= randperm(z2); 

o=zeros(M,N);
o((NH1(end)+1):(NH2(1)-1),:)=1;

ranrow1=ranlist1(1:Num_Ran/2);
o(ranrow1,:)=1;
ranrow2=ranlist2(1:Num_Ran/2)+length(NH1)+Num_fixed;
o(ranrow2,:)=1;

Umask=o;

o1=zeros(M+2,N+2);
o1(2:end-1,2:end-1)=o;
whos o1

disp('������������������')
disp(sum(sum(o1))/((M+2)*(N+2)))
  
figure;imshow(o1)
title('ƽ���߲���ģ��')
%  ����
 save Umask_Cartesian_100