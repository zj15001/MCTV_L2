%-`mask_radial.m`用于生成径向采样模板。 可以选择模板的大小和轨迹线的数量。
%  该程序生成傅里叶变换域的射线采样模式用作随机测量
%  编程人：沙威 香港大学
%  编程时间：2011年5月21日
%  电子邮件: wsha@eee.hku.hk
%  转载时请保留上面的注释

clc;close all;clear all;

N=256;   %  模板大小
M=30;    %  径向线条数   原备注：随机角度数
T=linspace(0,pi,M);     %  测量角度
Umask=zeros(N,N); %  掩模矩阵（0，1分布）

%  角度循环
for i=1:M;  
    kk=tan(T(i));    %  斜率
    c1=sqrt(kk^2+1); %  常数用于计算点到直线距离
    %  像素循环
    for m=-N/2+0.5:N/2-0.5;
        for n=-N/2+0.5:N/2-0.5
            mm=m+N/2+0.5;
            nn=n+N/2+0.5;
            d=abs(kk*m-n)/c1;          %  距离公式
            if (d<1/2)
                Umask(mm,nn)=1;  %  掩模设置1
            end
        end
    end
end

%  测量占图像尺寸比例
disp('测量比例，即采样率')
disp(sum(sum(Umask))/(N*N))
%  测量模式
imshow(255*uint8(Umask))
%  保存
 save mask_radial_20