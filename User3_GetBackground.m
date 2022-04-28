function [pixelBG_P1,minBG_P1,maxBG_P1,meanBG_P1,sumBG_P1,pixelBG_P2,minBG_P2,maxBG_P2,meanBG_P2,sumBG_P2,pixelBG_P3,minBG_P3,maxBG_P3,meanBG_P3,sumBG_P3] = User3_GetBackground(location_out,P1,P2,P3,NameCh1,NameCh2,NameCh3,ThresholdBG,SelectedCells,this_cell,this_set,noOfCells)
%% Background protein of intressed image

Cell_P1=imbinarize(P1,ThresholdBG);
Cell_P1_open=imdilate(Cell_P1,strel('disk',1));
% Cell_P1_fill=imfill(Cell_P1_open,'holes');

Cell_P2=imbinarize(P2,ThresholdBG);
Cell_P2_open=imdilate(Cell_P2,strel('disk',1));
% Cell_P2_fill=imfill(Cell_P2_open,'holes');

Cell_P3=imbinarize(P3,ThresholdBG);
Cell_P3_open=imdilate(Cell_P3,strel('disk',1));
% Cell_P3_fill=imfill(Cell_P3_open,'holes');

Cell_P1andP2=Cell_P2_open | Cell_P1_open;

Cell_P1P2P3=Cell_P1andP2 | Cell_P3_open;


BG_P1 = double(P1)/255.*double(~Cell_P1P2P3);
BG_P2 = double(P2)/255.*double(~Cell_P1P2P3);
BG_P3 = double(P3)/255.*double(~Cell_P1P2P3);


vectorP1=reshape(BG_P1,1,[]);
pixelBG_P1 = length(vectorP1);
minBG_P1   = min(vectorP1);
maxBG_P1   = max(vectorP1);
meanBG_P1  = mean(vectorP1);
sumBG_P1   = sum(vectorP1);

bg_areaP1 = zeros(noOfCells,1);
bg_areaP1(:)= pixelBG_P1;
bg_intP1  = zeros(noOfCells,1);
bg_intP1 (:) = meanBG_P1;
bg_minP1  = zeros(noOfCells,1);
bg_minP1 (:) = minBG_P1;
bg_maxP1  = zeros(noOfCells,1);
bg_maxP1 (:) = maxBG_P1;
bg_sumP1  = zeros(noOfCells,1);
bg_sumP1 (:)= sumBG_P1;

vectorP2=reshape(BG_P2,1,[]);
pixelBG_P2 = length(vectorP2);
minBG_P2   = min(vectorP2);
maxBG_P2   = max(vectorP2);
meanBG_P2  = mean(vectorP2);
sumBG_P2   = sum(vectorP2);

bg_areaP2 = zeros(noOfCells,1);
bg_areaP2(:)= pixelBG_P2;
bg_intP2  = zeros(noOfCells,1);
bg_intP2 (:) = meanBG_P2;
bg_minP2  = zeros(noOfCells,1);
bg_minP2 (:) = minBG_P2;
bg_maxP2  = zeros(noOfCells,1);
bg_maxP2 (:) = maxBG_P2;
bg_sumP2  = zeros(noOfCells,1);
bg_sumP2 (:)= sumBG_P2;

vectorP3=reshape(BG_P3,1,[]);
pixelBG_P3 = length(vectorP3);
minBG_P3   = min(vectorP3);
maxBG_P3   = max(vectorP3);
meanBG_P3  = mean(vectorP3);
sumBG_P3   = sum(vectorP3);

bg_areaP3 = zeros(noOfCells,1);
bg_areaP3(:)= pixelBG_P3;
bg_intP3  = zeros(noOfCells,1);
bg_intP3 (:) = meanBG_P3;
bg_minP3  = zeros(noOfCells,1);
bg_minP3 (:) = minBG_P3;
bg_maxP3  = zeros(noOfCells,1);
bg_maxP3 (:) = maxBG_P3;
bg_sumP3  = zeros(noOfCells,1);
bg_sumP3 (:)= sumBG_P3;

figure(7);set(gcf,'color','w','units', 'normalized', 'outerposition',[0.5 0 0.5 1]);
subplot (221), imshow (Cell_P1P2P3);set(gca,'fontsize',10,'fontname','Arial');  title ('Area');
subplot (222), imshow (BG_P1);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh1,' Background'));
subplot (223), imshow (BG_P2);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh2,' Background'));
subplot (224), imshow (BG_P3);set(gca,'fontsize',10,'fontname','Arial'); title(strcat(NameCh3,' Background'));
saveas(gcf,strcat(location_out,'7_Background_',num2str(this_set,'%02d'),'.png'));

end

