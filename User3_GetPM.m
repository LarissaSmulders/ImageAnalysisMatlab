function [PMPixNo,PMP1_Int,PMP1_totalInt,PMP2_Int,PMP2_totalInt,PMP3_Int,PMP3_totalInt] = User3_GetPM(NameCh1,NameCh2,NameCh3,location_out,CellArea,small,P1,P2,P3,this_cell,this_set,labelthisCell)
%% Define PM

PM=double(~small).*double(CellArea);

PMPixNo=sum(PM(PM>0));

PMP1=double(P1)/255.*double(PM);
PMP2=double(P2)/255.*double(PM);
PMP3=double(P3)/255.*double(PM);

PMP1_Int=regionprops(labelthisCell,PMP1,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
PMP1_totalInt = sum(PMP1_Int.PixelValues);

PMP2_Int=regionprops(labelthisCell,PMP2,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
PMP2_totalInt = sum(PMP2_Int.PixelValues);

PMP3_Int=regionprops(labelthisCell,PMP3,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues');
PMP3_totalInt = sum(PMP3_Int.PixelValues);

figure(4);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
subplot (221), imshow (PM);set(gca,'fontsize',10,'fontname','Arial');title ('PM Area');
subplot (222), imshow (PMP1);set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh1,' PM'));
subplot (223), imshow (PMP2);set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh2,' PM'));
subplot (224), imshow (PMP3);set(gca,'fontsize',10,'fontname','Arial');title(strcat(NameCh3,' PM'));
saveas(gcf,strcat(location_out,'4_PM_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));


% x3=[(Centroid_xy(1)-200) (Centroid_xy(1)+ 200)];
% y3=[ Centroid_xy(2)  Centroid_xy(2)];
% Cell_x=improfile(CellP,x3,y3);
% PM_x=improfile(PMP,x3,y3);
% 
% x4=[Centroid_xy(1) Centroid_xy(1)];
% y4=[(Centroid_xy(2)- 200) (Centroid_xy(2)+ 200)];
% Cell_y=improfile(CellP,x4,y4);
% PM_y=improfile(PMP,x4,y4);
% %Cyto_x=improfile(Protein_Cyto,x4,y4);
% 
% figure (4);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
% subplot (2,2,1), imagesc(Protein);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(POI,' x-Intensity'));
% hold on
% plot(x3,y3,'r')
% subplot (2,2,2),  plot(Cell_x(:,1,1),'g')
% hold on
% % subplot (2,2,2),  plot(Cyto_x(:,1,1),'b')
% % hold on
% subplot (2,2,2), plot(PM_x(:,1,1),'r');set(gca,'fontsize',10,'fontname','Arial');title(strcat(POI,' x-Intensity'));xlabel ('x-axis');ylabel('Intensity');axis([0 400 0 1]);legend({'Total Cell','PM'},'Location','northeast');
% hold off
% subplot (2,2,3), imagesc(Protein);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(POI,' y-Intensity'));
% hold on
% plot(x4,y4,'r')
% subplot (2,2,4),  plot(Cell_y(:,1,1),'g')
% hold on
% % subplot (2,2,4),  plot(Cyto_x(:,1,1),'b')
% % hold on
% subplot (2,2,4),  plot(PM_y(:,1,1),'r');set(gca,'fontsize',10,'fontname','Arial');title(strcat(POI,' y-Intensity'));xlabel ('y-axis');ylabel('Intensity');axis([0 400 0 1]);legend({'Total Cell','PM'},'Location','northeast');
% hold off
% saveas(gcf,strcat(location_out,'4_Intensity_Profile_Cell_PM_',num2str(this_set,'%02d'),num2str(this_cell,'%02d'),'.png'));
% hold off

end

