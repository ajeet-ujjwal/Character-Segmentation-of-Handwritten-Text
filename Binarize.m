% Convert RGB image to binarized image
function [ Binarized_Image ] = Binarize( Initial_Image )
if size(Initial_Image,3)==3 % RGB image %% Convert to gray scale
    Initial_Image=rgb2gray(Initial_Image);
end
threshold = graythresh(Initial_Image); %% Convert to binary image
Initial_Image=~im2bw(Initial_Image,threshold);
Initial_Image = bwareaopen(Initial_Image,600);% remove area where pixel lenght<600
Binarized_Image=Initial_Image

end
