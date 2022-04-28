function  [CellCh1,CellCh2,CellCh3,CellCh1_Int,CellCh1_totalInt,CellCh2_Int,CellCh2_totalInt,CellCh3_Int,CellCh3_totalInt,CellArea,labelthisCell,small,Centroid_xy] = User3_GetCell(NameCh1,NameCh2,NameCh3,location_out,selectedArea,P1,P2,P3,STATSf,this_cell,this_set,DilateCellRef,pmWidth);

%Auto_SetParameters
rgbImage = cat(3, P1, P2, P3);% Creates an RGB image out of the three tif images
rgb_gray=rgb2gray(rgbImage);
rgb =ind2rgb(rgb_gray,colormap);

Cell_big=imdilate(selectedArea,strel('disk',DilateCellRef));
small=imerode(Cell_big,strel('disk',pmWidth));
CellArea=imdilate(small,strel('disk',pmWidth));

labelthisCell=bwlabel(CellArea);
max(labelthisCell(:));
STATSthisCell = regionprops(CellArea,'Area','PixelIdxList');

%               **********************************************************
%               The following part was only necessary when cells fused in
%               the proces of eroding the cells
%
area = zeros(1,length(STATSthisCell));
for i = 1:length(STATSthisCell)
    area(i) = STATSthisCell(i).Area;
end
[~,idmax] = max(area);
%     [ind_i, ind_j] = ind2sub(size(Cell_big),STATSpm1(idmax).PixelIdxList);
CellArea = false(size(CellArea));
CellArea(STATSthisCell(idmax).PixelIdxList) = true;
labelthisCell=bwlabel(CellArea);
STATSpm2 = regionprops(CellArea,'Area','PixelIdxList');
%
%               **********************************************************

CellCh1=double(CellArea).*double(P1)/255;
CellCh2=double(CellArea).*double(P2)/255;
CellCh3=double(CellArea).*double(P3)/255;

% Image profile 
Centroid_xy=STATSf.Centroid;
hold off
x1=[(Centroid_xy(1)-500) (Centroid_xy(1)+ 500)];
y1=[ Centroid_xy(2)  Centroid_xy(2)];
cx=improfile(rgb,x1,y1);
cxP1=improfile(P1,x1,y1);
cxP2=improfile(P2,x1,y1);
cxP3=improfile(P3,x1,y1);

x2=[Centroid_xy(1) Centroid_xy(1)];
%                 y2=[200 400];
y2=[(Centroid_xy(2)- 500) (Centroid_xy(2)+ 500)];
cy=improfile(rgb,x2,y2);
cyP1=improfile(P1,x2,y2);
cyP2=improfile(P2,x2,y2);
cyP3=improfile(P3,x2,y2);

figure (3);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);

subplot (2,2,1), imagesc(rgb);set(gca,'fontsize',10,'fontname','Arial'); title(strcat('x-Intensity Profile'));
hold on
plot(x1,y1,'r')
subplot (2,2,2),  plot(cxP1(:,1,1),'r');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh1,' x-Intensity'));xlabel ('x-axis');ylabel('Intensity');axis([0 1000 0 255]); %legend(strcat(NameCh1),'Location','northeast');
hold on
subplot (2,2,2),  plot(cxP2(:,1,1),'g');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh2,' x-Intensity'));xlabel ('x-axis');ylabel('Intensity');axis([0 1000 0 255]); %legend(strcat(NameCh1),'Location','northeast');
hold on
subplot (2,2,2),  plot(cxP3(:,1,1),'b');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh3,' x-Intensity'));xlabel ('x-axis');ylabel('Intensity');axis([0 1000 0 255]);legend({NameCh1, NameCh2, NameCh3},'Location','northeast');
hold off
subplot (2,2,3), imagesc(rgb);set(gca,'fontsize',10,'fontname','Arial');title(strcat('y-Intensity Profile'));
hold on
plot(x2,y2,'r')
subplot (2,2,4),  plot(cyP1(:,1,1),'r');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh1,' y-Intensity'));xlabel ('y-axis');ylabel('Intensity');axis([0 1000 0 255]); %legend((strcat(NameCh1)),'Location','northeast');
hold on
subplot (2,2,4),  plot(cyP2(:,1,1),'g');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh2,' y-Intensity'));xlabel ('y-axis');ylabel('Intensity');axis([0 1000 0 255]);%legend((strcat(NameCh2)),'Location','northeast');
hold on
subplot (2,2,4),  plot(cyP3(:,1,1),'b');set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh3,' y-Intensity'));xlabel ('y-axis');ylabel('Intensity');axis([0 1000 0 255]);legend({NameCh1 ,NameCh2 ,NameCh3},'Location','northeast');
hold on
saveas(gcf,strcat(location_out,'3_Intensity_Profile_Original_Image_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));
hold off

% Measurements 

CellCh1_Int = regionprops(labelthisCell,CellCh1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');

CellCh1_totalInt = sum(CellCh1_Int.PixelValues);

CellCh2_Int = regionprops(labelthisCell,CellCh2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');

CellCh2_totalInt = sum(CellCh2_Int.PixelValues);

CellCh3_Int = regionprops(labelthisCell,CellCh3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');

CellCh3_totalInt = sum(CellCh3_Int.PixelValues);

end

