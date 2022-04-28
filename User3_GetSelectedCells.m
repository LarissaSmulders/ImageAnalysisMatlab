function [SelectedCells,labeledCells,noOfCells] = User3_GetSelectedCells(RefProtTheshold,NoOfCells,RefName, location_out,RP,mapRP,this_set,ThresholdRef,min_cell_size,max_cell_size)
         
% Identify the area of cells

Pgray=double(RP)/255;

% a = ImageControlApp;
% b = funcDisplayIm(a,P);

%app.ImageDisplayControl

%NoOfCells=2;

Cells = false(size(RP));

for AllCells =1:NoOfCells
    figure (1);
    imshow(Pgray);
    h=drawfreehand()
    h.FaceAlpha = 0.5;
    h.FaceSelectable = true;
    h.Position
    saveas(gcf,strcat(location_out,'1_CellSelected_',num2str(this_set,'%02d'),num2str(AllCells,'%02d'),'.png'));
    
    InsideP = false(size(RP));
    ImgCoordI = zeros(size(RP));
    ImgCoordJ = zeros(size(RP));
    
    
    
    polypos = fliplr(h.Position);   % flip the polynomial coordinates (imshow shows a transposed image)
    % polypos = h.Position;
    for j = 1:size(RP,2)
        for i = 1:size(RP,1)
            ImgCoordI(i,j) = i;
            ImgCoordJ(i,j) = j;
        end
    end
    
    maxpoly(1) = max(polypos(:,1));
    maxpoly(2) = max(polypos(:,2));
    minpoly(1) = min(polypos(:,1));
    minpoly(2) = min(polypos(:,2));
    % polyin= polyshape([minpoly(1),maxpoly(1),minpoly(1),maxpoly(1)],[minpoly(2),minpoly(2),maxpoly(2),maxpoly(2)])
    %
    % % polyin=polyshape([max(polypos(:,1)),max(polypos(:,1),min(polypos(:,1)),min(polypos(:,1))],[max(polypos(:,2)),min(polypos(:,2),max(polypos(:,2)),min(polypos(:,2))]);
    % [xlim,ylim] = boundingbox(polyin)
    %
    % plot(polyin)
    % hold on
    % tic
    % for j = 1:size(P,2)
    %     for i = 1:size(P,1)
    %         if i >= minpoly(1) && i <= maxpoly(1) && ...
    %            j >= minpoly(2) && j <= maxpoly(2)
    %             InsideP(i,j) =  inpolygon(i,j,polypos(:,1),polypos(:,1));
    %         end
    %     end
    % end
    % toc
    tic
    for i = 1:length(RP(:))
        InsideP(i) =  inpolygon(ImgCoordI(i),ImgCoordJ(i),polypos(:,1),polypos(:,2));
    end
    toc
    %
    % % for i = 1:length(P(:))
    % % % %     InsideP(i) =  inpolygon(ImgCoordI(i),ImgCoordJ(i),h.Position(:,1),h.Position(:,2));
    % % %     InsideP(i) =  inpolygon(ImgCoordI(i),ImgCoordJ(i),polypos(:,1),polypos(:,2));
    % %     InsideP(i) =  inpolygon(ImgCoordI(i),ImgCoordJ(i),xlim,ylim);
    
    % % end
   
        
%     figure (2)
    PoneCell=RP;
    % PoneCell(~InsideP)=0;
    PoneCell(~InsideP)=0;
%     imshow(PoneCell)
    
    %% Identify the area of cells
    
    P1=imbinarize(PoneCell,ThresholdRef);
    % figure (10)
    % imshow(P1)
    P2 = double(P1).*double(RP)/255;
    % figure (11)
    % imshow(P2)
    P3= imbinarize(P2,RefProtTheshold);
    % figure (12)
    % imshow(P3)
    
    %
    % CellB=imclose(Area, strel ('disk',6));
    Cells1=imfill(P3,'holes');%Fills in holes of the low threshold image. hole = set of background pixels that cannot be reached by filling in the background from the edge of the image.
    
    % figure (13)
    % imshow (Cells1)
    Cells2=imclose(Cells1,strel('disk',3)); % removing single pixels and smothens cell outline
    
    Cell=imfill(Cells2,'holes');
    
    %             figure
    %             subplot (221), imshow (P1)
    %             subplot (222), imshow (Cells1)
    %             subplot (223), imshow (Cells2)
    %             subplot (224), imshow (Cells)
    % imshow (Cells)
    %             Cells=imerode(Cell3,strel('disk',6));
    %Cells = (double(PoneCell))
    Cells(Cell>0)=true;
    figure(8)
    imshow (Cells)
    hold on
   
end

% figure(3)
% imshow (Cells)

    Cell_labela=bwlabel(Cells);
    
    
    max(max(Cell_labela));
    STATSb = regionprops(Cells,'Area','PixelIdxList');
    AllOfCells=[STATSb.Area];
    AreaOfCells=(AllOfCells > min_cell_size) & (AllOfCells < max_cell_size);
    IndexOfCells=find(AreaOfCells);
    SelectedCells1=ismember(Cell_labela, IndexOfCells);
    SelectedCells=bwlabel(SelectedCells1);
    labeledCells = bwlabel(SelectedCells);
    Cells_intensity=regionprops(labeledCells,SelectedCells,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues', 'Centroid');
    noOfCells = length(Cells_intensity);
    

figure(2);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0.25 0.5 0.6]);
subplot (121), imshow(RP,mapRP);set(gca,'fontsize',10,'fontname','Arial'); title (RefName);
subplot (122), vislabels(SelectedCells);set(gca,'fontsize',10,'fontname','Arial');  title ('No of Cells');
saveas(gcf,strcat(location_out,'2_Cells_',num2str(this_set,'%02d'),'.png'));


% % P1=imbinarize(RP,ThresholdRef);
% % P2 = double(P1).*double(RP)/255;
% % P3= imbinarize(P2,'adaptive');
% % %
% % % CellB=imclose(Area, strel ('disk',6));
% % Cells1=imfill(P3,'holes');%Fills in holes of the low threshold image. hole = set of background pixels that cannot be reached by filling in the background from the edge of the image.
% % 
% % % figure (3)
% % % imshow (Cell)
% % Cells2=imopen(Cells1,strel('disk',1)); % removing single pixels and smothens cell outline
% % 
% % Cells=imfill(Cells2,'holes');
% % 
% % %             figure
% % %             subplot (221), imshow (P1)
% % %             subplot (222), imshow (Cells1)
% % %             subplot (223), imshow (Cells2)
% % %             subplot (224), imshow (Cells)
% % % imshow (Cells)
% % %             Cells=imerode(Cell3,strel('disk',6));
% % Cell_labela=bwlabel(Cells);
% % max(max(Cell_labela));
% % STATSb = regionprops(Cells,'Area','PixelIdxList');
% % AllOfCells=[STATSb.Area];
% % AreaOfCells=(AllOfCells > min_cell_size) & (AllOfCells < max_cell_size);
% % IndexOfCells=find(AreaOfCells);
% % SelectedCells1=ismember(Cell_labela, IndexOfCells);
% % SelectedCells=bwlabel(SelectedCells1);
% % labeledCells = bwlabel(SelectedCells);
% % Cells_intensity=regionprops(labeledCells,SelectedCells,'Area','MaxIntensity','MinIntensity','MeanIntensity','PixelValues', 'Centroid');
% % noOfCells = length(Cells_intensity);
% % 
% % 
% % figure(1);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0.25 0.5 0.6]);
% % subplot (121), imshow(RP,mapRP);set(gca,'fontsize',10,'fontname','Arial'); title (RefName);
% % subplot (122), vislabels(SelectedCells1);set(gca,'fontsize',10,'fontname','Arial');  title ('No of Cells');
% % saveas(gcf,strcat(location_out,'1_Cells_',num2str(this_set,'%02d'),'.png'));


end

