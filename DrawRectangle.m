function I_rgb = DrawRectangle(I, LeftUpPoint, RightBottomPoint,LineWidth)
% example  I_rgb = ShowEnlargedRectangle(I, [10,20], [50,60], 1)
%画矩形框框
% if size(I,3)==1
%     I_rgb(:,:,1) = I;
%     I_rgb(:,:,2) = I;
%     I_rgb(:,:,3) = I;
% else
%     I_rgb = I;
% end
I_rgb = I;
if ~exist('LineWidth','var')
    LineWidth = 1;
end
 
UpRow = LeftUpPoint(1);
LeftColumn = LeftUpPoint(2);
BottomRow = RightBottomPoint(1);
RightColumn = RightBottomPoint(2);
 
% 上面线
% I_rgb(UpRow:UpRow + LineWidth - 1,LeftColumn:RightColumn,1) = 0;
% I_rgb(UpRow:UpRow + LineWidth - 1,LeftColumn:RightColumn,2) = 0;
% I_rgb(UpRow:UpRow + LineWidth - 1,LeftColumn:RightColumn,3) = 0;
I_rgb(UpRow:UpRow + LineWidth - 1,LeftColumn:RightColumn) = 1;
% 下面线
% I_rgb(BottomRow:BottomRow + LineWidth - 1,LeftColumn:RightColumn,1) = 0;
% I_rgb(BottomRow:BottomRow + LineWidth - 1,LeftColumn:RightColumn,2) = 0;
% I_rgb(BottomRow:BottomRow + LineWidth - 1,LeftColumn:RightColumn,3) = 0;
I_rgb(BottomRow:BottomRow + LineWidth - 1,LeftColumn:RightColumn) = 1;

% 左面线
% I_rgb(UpRow:BottomRow,LeftColumn:LeftColumn + LineWidth - 1,1) = 0;
% I_rgb(UpRow:BottomRow,LeftColumn:LeftColumn + LineWidth - 1,2) = 0;
% I_rgb(UpRow:BottomRow,LeftColumn:LeftColumn + LineWidth - 1,3) = 0;
I_rgb(UpRow:BottomRow,LeftColumn:LeftColumn + LineWidth - 1) =1;
% 右面线
% I_rgb(UpRow:BottomRow,RightColumn:RightColumn + LineWidth - 1,1) = 0;
% I_rgb(UpRow:BottomRow,RightColumn:RightColumn + LineWidth - 1,2) = 0;
% I_rgb(UpRow:BottomRow,RightColumn:RightColumn + LineWidth - 1,3) = 0;
I_rgb(UpRow:BottomRow,RightColumn:RightColumn + LineWidth - 1) =1;
end