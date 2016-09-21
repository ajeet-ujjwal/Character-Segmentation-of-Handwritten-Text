% Function for character segmentation
function []=Char_Segmentation(word,i,j,img)
B =cell2mat(word);
CC=bwconncomp(B);
BW2 = zeros(size(B)); %// Create dummy image for display purposes.
for k = 1:CC.NumObjects %// Loop through each object 
BW2 = zeros(size(B))
    PixId = CC.PixelIdxList{k}; %// Just simpler to understand

    if size(PixId,1) <= 5 %// If only one row, don't consider.        
        continue
    else
    BW2(PixId) = 255;
    BW3=crop(BW2);
    folder=strcat(img,'_folder\char\');
    file=sprintf('L%dW%dC%d.png',i,j,k);
    dir=strcat(folder,file);
    imwrite(BW3,dir,'png');
   end
end
end