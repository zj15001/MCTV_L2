function [] = plot_res4(I_org, R_0, I_res, I_res2, I_res3, I_res4)
% Plot reconstruction results and error images.
% Paper:Magnetic Resonance Imaging reconstruction via non-convex total variation regularization
% SHEN Marui, LI Jincheng, ZHANG Ya, ZOU Jian*

    P_V=[[0.25 0.72 0.25 0.25];
    [0.50 0.72 0.25  0.25];
    [0 0.42 0.25 0.25];
    [0.25 0.42 0.25 0.25];
    [0.50 0.42 0.25 0.25];
    [0.75 0.42 0.25 0.25];
    [0 0.12 0.25 0.25];
    [0.25 0.12 0.25 0.25];
    [0.50 0.12 0.25 0.25];
    [0.75 0.12 0.25 0.25];];

B_V=[ [0.015 0.08 0.22 0.02];
    [0.265 0.08 0.22 0.02];
    [0.515 0.08 0.22 0.02];
    [0.765 0.08 0.22 0.02]];
   
  set(gcf,'unit','normalized','position',[0.4 0 0.6 1]);
  
   leftup=[77,194];                 %Shepp Logan
   rightbottom=[102,222];
  
%    leftup=[57,174];                 %大脑血管
%    rightbottom=[85,202];

%     leftup=[39,78];               % 大脑
%     rightbottom=[66,105];
    engagement=3;
    linewidth=2;
    gap=2;
%     leftup,rightbottom,engagement,linewidth,gap
    p_vec = P_V(1,:);
    subplot('Position', p_vec);
%     imshow(abs(I_org));
    I1 = ShowEnlargedRectangle(I_org,leftup,rightbottom,engagement,linewidth,gap);
    imshow(I1)
    xlb = xlabel('(a) 观测图像', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = P_V(2,:);
    subplot('Position', p_vec);
    imshow(abs(R_0));
    xlb = xlabel('(b) 采样模板', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = P_V(3,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res));
    I3 = ShowEnlargedRectangle(I_res,leftup,rightbottom,engagement,linewidth,gap);
    imshow(I3)
    xlb = xlabel('(c) L_1-TV重构结果', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = P_V(4,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res2));
    I4 = ShowEnlargedRectangle(I_res2,leftup,rightbottom,engagement,linewidth,gap);
    imshow(I4)
    xlb = xlabel('(d) L_1-MCTV重构结果', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);

    p_vec = P_V(5,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res3));
    I5 = ShowEnlargedRectangle(I_res3,leftup,rightbottom,engagement,linewidth,gap);
    imshow(I5)
    xlb = xlabel('(e) L_2-TV重构结果', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);
    

    p_vec = P_V(6,:);
    subplot('Position',p_vec);
%     imshow(abs(I_res4));
    I6 = ShowEnlargedRectangle(I_res4,leftup,rightbottom,engagement,linewidth,gap);
    imshow(I6)
    xlb = xlabel('(f) L_2-MCTV重构结果', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) - 30]);
   
    
    p_vec = P_V(7,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res - I_org));
    I7 = ShowEnlargedRectangle(abs(I_res - I_org),leftup,rightbottom,engagement,linewidth,gap);
	imshow(I7)
    xlb = xlabel('(g) L_1-TV重构差值图像', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 45]);
    caxis([0 0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position',B_V(1,:))

    p_vec = P_V(8,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res2 - I_org));
    I8 = ShowEnlargedRectangle(abs(I_res2 - I_org),leftup,rightbottom,engagement,linewidth,gap);
	imshow(I8)
    xlb = xlabel('(h) L_1-MCTV重构差值图像', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 45]);
    caxis([0 0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position', B_V(2,:))

    p_vec = P_V(9,:);
    subplot('Position', p_vec);
%     imshow(abs(I_res3 - I_org));
    I9 = ShowEnlargedRectangle(abs(I_res3 - I_org),leftup,rightbottom,engagement,linewidth,gap);
	imshow(I9)
    xlb = xlabel('(i) L_2-TV重构差值图像', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 45]);
    caxis([0 0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position', B_V(3,:))

    

    p_vec = P_V(10,:);
    subplot('Position',p_vec);
%     imshow(abs(I_res4 - I_org));
    I10 = ShowEnlargedRectangle(abs(I_res4 - I_org),leftup,rightbottom,engagement,linewidth,gap);
	imshow(I10)
    xlb = xlabel('(j) L_2-MCTV重构差值图像', 'FontSize', 9);
    pos = get(xlb, 'Position');
    set(xlb, 'Position', [pos(1) pos(2) + 45]);
    caxis([0 0.2])
    clb = colorbar('SouthOutside');
    set(clb, 'Position', B_V(4,:))
end