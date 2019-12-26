function [minIntrVec,stat,actpctg] = genSampling(pdf,iter,tol)

%[mask,stat,N] = genSampling(pdf,iter,tol)
%
% a monte-carlo algorithm to generate a sampling pattern with 
% minimum peak interference. The number of samples will be
% sum(pdf) +- tol
%
%	pdf - probability density function to choose samples from
%	iter - number of tries
%	tol  - the deviation from the desired number of samples in samples
%
% returns:
%	mask - sampling pattern
%	stat - vector of min interferences measured each try
%	actpctg    - actual undersampling factor
%
%	(c) Michael Lustig 2007

h = waitbar(0);% waitbar运行进度显示条  此程序下面介绍

pdf(find(pdf>1)) = 1;
K = sum(pdf(:));

minIntr = 1e99;
minIntrVec = zeros(size(pdf));

for n=1:iter
	tmp = zeros(size(pdf));
	while abs(sum(tmp(:)) - K) > tol
		tmp = rand(size(pdf))<pdf;
	end
	
	TMP = ifft2(tmp./pdf);
	if max(abs(TMP(2:end))) < minIntr
		minIntr = max(abs(TMP(2:end)));
		minIntrVec = tmp;
	end
	stat(n) = max(abs(TMP(2:end)));
	waitbar(n/iter,h);
end

actpctg = sum(minIntrVec(:))/prod(size(minIntrVec));

close(h);

%{
%% waitbar函数   marry学习
h=waitbar(x,'updated message'); 窗口显示进度条 h为waitbar生成的句柄 x在0-1之间， 0
进度开始位置，最后用close(h)关闭进度条显示

waitbar(x,h,'updated message'); % x为显示的进度，必须在0到1之间；h为所建立的waitbar的句柄，updated message为实时显示的信息，此语句经常地用于for循环中 
举例： 
 steps=100;  hwait=waitbar(0,'请等待>>>>>>>>'); 
for k=1:steps 
    if steps-k<=5 
        waitbar(k/steps,hwait,'即将完成'); %因为k/steps在逐步增大，所有进度条在往右走，另外，如果这个hwait不加上的话，会显示n多个进度条窗口，让你关闭不过来啊，加上之后就只显示一个了
        pause(0.05); %延时一下啊 否则太快看不出来变化，一般有个0.01就能看出变化，但还是比较快的 
    else  str=['正在运行中',num2str(k),'%']; %用于显示如下图中“正在运行中46%”等比例数据
        waitbar(k/steps,hwait,str);  pause(0.05); %pause(n)函数是程序停止n秒后继续，n可以使分数或小数。函数的分辨率根据平台而定，大多数平台都能满足0.01秒的精度。
    end
end
close(hwait); % 注意必须添加close函数，也就是说运行完成后让此进度条消失
%}
