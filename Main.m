% Main function which calls all other functions
function []= Main(img)
Initial_Image = imread(img);
main_folder=strcat(img,'_folder');
mkdir(main_folder);
char_folder=strcat(main_folder,'\char');
mkdir(char_folder);
word_folder=strcat(main_folder,'\word');
mkdir(word_folder);
line_folder=strcat(main_folder,'\line');
mkdir(line_folder);

Binarized_Image = Binarize(Initial_Image);
binary_image=strcat(img,'_folder\bin.png');
imwrite(Binarized_Image,binary_image,'png');


Line_Matrix = Line_Segmentation(Binarized_Image);

 folder_line=strcat(img,'_folder\line\');
for i=1:length(Line_Matrix)
    line=Line_Matrix{i};
   file=sprintf('L%d.png',i);
    dir=strcat(folder_line,file);
    imwrite(line,dir,'png');
end

Word_Matrix = cell(1, length(Line_Matrix));

for i=1:length(Line_Matrix)
   XYZZ =Word_Segmentation(Line_Matrix(1,i));
   Word_Matrix{i} = XYZZ;
end

folder_word=strcat(img,'_folder\word\');
 for i=1:length(Word_Matrix)
    line= Word_Matrix{i};
   for j=1:length(line)
       file=sprintf('L%dW%d.png',i,j);
    dir=strcat(folder_word,file);
    imwrite(cell2mat(Word_Matrix{i}(1,j)),dir,'png');
       Char_Segmentation(Word_Matrix{i}(1,j),i,j,img);
   end
   
end

end
