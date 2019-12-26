function [xs,ys] = shrink_tv2_1(lamda, x,y)
        
      s=sqrt(x.*conj(x)+y.*conj(y));
      ss=s-lamda;
      ss=ss.*(ss>0);
      
      s=s+(s<lamda);
      ss=ss./s;
      
      xs=ss.*x;
      ys=ss.*y;
      
end