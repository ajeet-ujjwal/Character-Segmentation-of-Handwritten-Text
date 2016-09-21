% WORD SEGMENTATION
function [word]=Word_Segmentation(Line)  

  bwword=im2bw(cell2mat(Line));%convert the image im into binary(black and white)
  aword=bwword;
  bword=sum(aword,1);
  %%Measure lengths of all "0" regions.
  measurementsword = regionprops(bword == 0, 'Area', 'PixelIdxList');
  % Get indexes of those regions that are >=85 in length.
  fiveLongRegionsword = find([measurementsword.Area] >=95);
  theIndexesword = vertcat(measurementsword(fiveLongRegionsword).PixelIdxList);
  cword=aword;
  cword(:,theIndexesword)=1;
  dword=~cword;
        
   %AREA OF INTERESRT FOR WORD SEGMENTATION IMAGE
  [xword,yword]=size(cword);
   mat1word=sum(cword,1);%sum the elements of rowise and save into column matrix mat1
   mat2word=xword-mat1word;%subtract each element of the sum matrix(mat1) from the width length(no. of columns)
   mat3word=mat2word~=0;
   mat4word=diff(mat3word);
   index1word=find(mat4word);
   [qword,wword]=size(index1word);%size of index2 matrix is q*w
   kapword=1;
   lamword=1;
       
     word= cell(1,int64(wword/2));  % cell array of words
         while kapword<((wword/2)+1);%number of loops=number of lines
     kword=1;
     mat5word=([]);
       for jword=(index1word(lamword)+1):1:index1word(lamword+1)
         mat5word(:,kword)=bwword(:,jword); 
           kword=kword+1;
       end
     lamword=lamword+2;   
     word{kapword}=mat5word;  %store the word segmented matrix in cell array
     kapword=kapword+1;
      
      % figure, imshow(mat5word);
       %imsave();

         end
end
        