function [MarkerAreaP1,MarkerAreaP2,MarkerAreaP3,MarkerPixNoP1,MarkerPixNoP2,MarkerPixNoP3,MarkerP1_P1_Int,MarkerP1_P1_totalInt,MarkerP1_P2_Int,MarkerP1_P2_totalInt,MarkerP1_P3_Int,MarkerP1_P3_totalInt,MarkerP2_P1_Int,MarkerP2_P1_totalInt,MarkerP2_P2_Int,MarkerP2_P2_totalInt,MarkerP2_P3_Int,MarkerP2_P3_totalInt,MarkerP3_P1_Int,MarkerP3_P1_totalInt,MarkerP3_P2_Int,MarkerP3_P2_totalInt,MarkerP3_P3_Int,MarkerP3_P3_totalInt] = User3_GetMarker(NameCh1,NameCh2,NameCh3,location_out,this_cell,this_set,CellCh1,CellCh2,CellCh3,labelthisCell,Threshold_Ch1,Threshold_Ch2,Threshold_Ch3);
%   Identify Organelles and marked regions
% Region of Marker in Channel 1
MarkerAreaP1=imbinarize(CellCh1,Threshold_Ch1);
MarkerPixNoP1=sum(MarkerAreaP1(MarkerAreaP1>0));

MarkerP1_P1=double(MarkerAreaP1).*double(CellCh1);
MarkerP1_P2=double(MarkerAreaP1).*double(CellCh2);
MarkerP1_P3=double(MarkerAreaP1).*double(CellCh3);


MarkerP1_P1_Int=regionprops(labelthisCell,MarkerP1_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP1_P1_totalInt = sum(MarkerP1_P1_Int.PixelValues);

MarkerP1_P2_Int=regionprops(labelthisCell,MarkerP1_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP1_P2_totalInt = sum(MarkerP1_P2_Int.PixelValues);

MarkerP1_P3_Int=regionprops(labelthisCell,MarkerP1_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP1_P3_totalInt = sum(MarkerP1_P3_Int.PixelValues);


% Region of Marker in Channel 2
MarkerAreaP2=imbinarize(CellCh2,Threshold_Ch2);
MarkerPixNoP2=sum(MarkerAreaP2(MarkerAreaP2>0));

MarkerP2_P1=double(MarkerAreaP2).*double(CellCh1);
MarkerP2_P2=double(MarkerAreaP2).*double(CellCh2);
MarkerP2_P3=double(MarkerAreaP2).*double(CellCh3);

MarkerP2_P1_Int=regionprops(labelthisCell,MarkerP2_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP2_P1_totalInt = sum(MarkerP2_P1_Int.PixelValues);

MarkerP2_P2_Int=regionprops(labelthisCell,MarkerP2_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP2_P2_totalInt = sum(MarkerP2_P2_Int.PixelValues);

MarkerP2_P3_Int=regionprops(labelthisCell,MarkerP2_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP2_P3_totalInt = sum(MarkerP2_P3_Int.PixelValues);


MarkerAreaP3=imbinarize(CellCh3,Threshold_Ch3);
MarkerPixNoP3=sum(MarkerAreaP3(MarkerAreaP3>0));

MarkerP3_P1=double(MarkerAreaP3).*double(CellCh1);
MarkerP3_P2=double(MarkerAreaP3).*double(CellCh2);
MarkerP3_P3=double(MarkerAreaP3).*double(CellCh3);

MarkerP3_P1_Int=regionprops(labelthisCell,MarkerP3_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP3_P1_totalInt = sum(MarkerP3_P1_Int.PixelValues);

MarkerP3_P2_Int=regionprops(labelthisCell,MarkerP3_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP3_P2_totalInt = sum(MarkerP3_P2_Int.PixelValues);

MarkerP3_P3_Int=regionprops(labelthisCell,MarkerP3_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
MarkerP3_P3_totalInt = sum(MarkerP3_P3_Int.PixelValues);

figure(5);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
subplot (331), imshow (MarkerP1_P1);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh1,' Marker', NameCh1,' area'));
subplot (332), imshow (MarkerP1_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh1,' Marker', NameCh2,' area'));
subplot (333), imshow (MarkerP1_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh1,' Marker', NameCh3,' area'));
subplot (334), imshow (MarkerP2_P1);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh2,' Marker', NameCh1,' area'));
subplot (335), imshow (MarkerP2_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh2,' Marker', NameCh2,' area'));
subplot (336), imshow (MarkerP2_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh2,' Marker', NameCh3,' area'));
subplot (337), imshow (MarkerP3_P1);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh3,' Marker', NameCh1,' area'));
subplot (338), imshow (MarkerP3_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh3,' Marker', NameCh2,' area'));
subplot (339), imshow (MarkerP3_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat(NameCh3,' Marker', NameCh3,' area'));
saveas(gcf,strcat(location_out,'5_Marker_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));



%% Nucleus
% N2=imbinarize(CellN,LowThresholdNucleus);
% 
% Nfill=imfill(N2,'holes');
% 
% Nsmooth=imopen(Nfill,strel('disk',1));
% labelthisNuc=bwlabel(Nsmooth);
% max(labelthisNuc(:));
% STATSthisNuc = regionprops(Nsmooth,'Area','PixelIdxList');
% 
% %               **********************************************************
% %               The following part was only necessary when cells fused in
% %               the proces of eroding the cells
% %
% area = zeros(1,length(STATSthisNuc));
% for i = 1:length(STATSthisNuc)
%     area(i) = STATSthisNuc(i).Area;
% end
% [~,idmax] = max(area);
% %     [ind_i, ind_j] = ind2sub(size(Cell_big),STATSpm1(idmax).PixelIdxList);
% Nsmooth = false(size(Nsmooth));
% Nsmooth(STATSthisNuc(idmax).PixelIdxList) = true;
% labelthisCell=bwlabel(Nsmooth);
% STATSn2 = regionprops(Nsmooth,'Area','PixelIdxList');
% 
% NucPixNo=sum(Nsmooth(Nsmooth>0));
% 
% NucleusN=double(Nsmooth).*double(CellN);
% NucleusP=double(Nsmooth).*double(CellP);
% NucleusM=double(Nsmooth).*double(CellM);
% 
% 
% NucN_Int=regionprops(labelthisCell,NucleusN,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
% NucN_totalInt = sum(NucN_Int.PixelValues);
% 
% NucP_Int=regionprops(labelthisCell,NucleusP,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
% NucP_totalInt = sum(NucP_Int.PixelValues);
% 
% NucM_Int=regionprops(labelthisCell,NucleusM,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
% NucM_totalInt = sum(NucM_Int.PixelValues);
% 
% 
% 
% figure(4);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
% subplot (221), imshow(Nsmooth);set(gca,'fontsize',10,'fontname','Arial');  title ('Nucleus Area');
% subplot (222), imshow(NucleusP);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh1,' Nucleus'));
% subplot (223), imshow (NucleusM);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh2,' Nucleus'));
% subplot (224), imshow (NucleusN);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh3,' Nucleus'));
% saveas(gcf,strcat(location_out,'4_Nucleus_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));

end

