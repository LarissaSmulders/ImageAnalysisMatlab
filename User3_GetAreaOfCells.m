function [selectedArea2,STATSf] = User3_GetAreaOfCells(ThresholdRef,this_cell,labeledCells,RefChannel)

selectedCell=(labeledCells == this_cell);

Area_label=bwlabel(selectedCell);
max(max(Area_label));
STATSr = regionprops(selectedCell,'Area','PixelIdxList','Centroid');
AllOfAreas=[STATSr.Area];
finalArea=(AllOfAreas > 10) & (AllOfAreas < 1000000);
IndexOfCells=find(finalArea);
selectedArea2=ismember(Area_label, IndexOfCells);
STATSf = regionprops(selectedArea2,'Area','PixelIdxList','Centroid');
STATSf;
STATSf.Centroid

end
