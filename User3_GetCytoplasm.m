function[PixNoCellminP1,CellminP1_P1_Int,CellminP1_P1_totalInt,CellminP1_P2_Int,CellminP1_P2_totalInt,CellminP1_P3_Int,CellminP1_P3_totalInt,PixNoCellminP2,CellminP2_P1_Int,CellminP2_P1_totalInt,CellminP2_P2_Int,CellminP2_P2_totalInt, CellminP2_P3_Int,CellminP2_P3_totalInt,PixNoCellminP3,CellminP3_P1_Int,CellminP3_P1_totalInt,CellminP3_P2_Int,CellminP3_P2_totalInt, CellminP3_P3_Int,CellminP3_P3_totalInt] = User3_GetCytoplasm(CellArea,MarkerAreaP1,MarkerAreaP2,MarkerAreaP3,NameCh1,NameCh2,NameCh3,location_out,CellCh1,CellCh2,CellCh3,this_cell,labelthisCell,this_set);
%% Cell without Nucleus
% Marker of first Channel

CellminP1=double(CellArea).*double(~MarkerAreaP1);
PixNoCellminP1=sum(CellminP1(CellminP1>0));
CellminP1_P1=double(CellCh1).*double(CellminP1);
CellminP1_P2=double(CellCh2).*double(CellminP1);
CellminP1_P3=double(CellCh3).*double(CellminP1);

CellminP1_P1_Int=regionprops(labelthisCell,CellminP1_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP1_P1_totalInt = sum(CellminP1_P1_Int.PixelValues);

CellminP1_P2_Int=regionprops(labelthisCell,CellminP1_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP1_P2_totalInt = sum(CellminP1_P2_Int.PixelValues);

CellminP1_P3_Int=regionprops(labelthisCell,CellminP1_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP1_P3_totalInt = sum(CellminP1_P3_Int.PixelValues);

% Marker of second Channel

CellminP2=double(CellArea).*double(~MarkerAreaP2);
PixNoCellminP2=sum(CellminP2(CellminP2>0));
CellminP2_P1=double(CellCh1).*double(CellminP2);
CellminP2_P2=double(CellCh2).*double(CellminP2);
CellminP2_P3=double(CellCh3).*double(CellminP2);

CellminP2_P1_Int=regionprops(labelthisCell,CellminP2_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP2_P1_totalInt = sum(CellminP2_P1_Int.PixelValues);

CellminP2_P2_Int=regionprops(labelthisCell,CellminP2_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP2_P2_totalInt = sum(CellminP2_P2_Int.PixelValues);

CellminP2_P3_Int=regionprops(labelthisCell,CellminP2_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP2_P3_totalInt = sum(CellminP2_P3_Int.PixelValues);


% Marker of third Channel

CellminP3=double(CellArea).*double(~MarkerAreaP3);
PixNoCellminP3=sum(CellminP3(CellminP3>0));
CellminP3_P1=double(CellCh1).*double(CellminP3);
CellminP3_P2=double(CellCh2).*double(CellminP3);
CellminP3_P3=double(CellCh3).*double(CellminP3);

CellminP3_P1_Int=regionprops(labelthisCell,CellminP3_P1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP3_P1_totalInt = sum(CellminP3_P1_Int.PixelValues);

CellminP3_P2_Int=regionprops(labelthisCell,CellminP3_P2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP3_P2_totalInt = sum(CellminP3_P2_Int.PixelValues);

CellminP3_P3_Int=regionprops(labelthisCell,CellminP3_P3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
CellminP3_P3_totalInt = sum(CellminP3_P3_Int.PixelValues);



figure(6);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
subplot (331), imshow(CellminP1_P1);set(gca,'fontsize',8,'fontname','Arial');  title(strcat('Int. of ',NameCh1,' w/o ',NameCh1, ' area'));
subplot (332), imshow(CellminP1_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh2,' w/o ',NameCh1, ' area'));
subplot (333), imshow (CellminP1_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh3,' w/o ',NameCh1, ' area'));
subplot (334), imshow(CellminP2_P1);set(gca,'fontsize',8,'fontname','Arial');  title(strcat('Int. of ',NameCh1,' w/o ',NameCh2, ' area'));
subplot (335), imshow(CellminP2_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh2,' w/o ',NameCh2, ' area'));
subplot (336), imshow (CellminP2_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh3,' w/o ',NameCh2, ' area'));
subplot (337), imshow(CellminP3_P1);set(gca,'fontsize',8,'fontname','Arial');  title(strcat('Int. of ',NameCh1,' w/o ',NameCh3, ' area'));
subplot (338), imshow(CellminP3_P2);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh2,' w/o ',NameCh3, ' area'));
subplot (339), imshow (CellminP3_P3);set(gca,'fontsize',8,'fontname','Arial'); title(strcat('Int. of ',NameCh3,' w/o ',NameCh3, ' area'));
saveas(gcf,strcat(location_out,'6_Cytoplasm_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));

end

