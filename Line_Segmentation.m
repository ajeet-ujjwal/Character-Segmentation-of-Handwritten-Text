%LINE SEGMENTATION
function [ Line_Matrix ] = Line_Segmentalion( Binarized_Image )

Column_Count = sum(Binarized_Image,2);

Is_White = Column_Count ~= 0;

Difference = diff(Is_White);

Points_Of_Change = find(Difference);

Number_Of_Lines = length(Points_Of_Change);

Line_Matrix = cell(1, int64(Number_Of_Lines/2));

Row_Iterator = 1;
count=0;
while(Row_Iterator < Number_Of_Lines)
    Current_Row = 1;
    Current_Line = ([]);
       for j=(Points_Of_Change(Row_Iterator)+1):1:Points_Of_Change(Row_Iterator+1)
         Current_Line(Current_Row,:)=Binarized_Image(j,:); %store the line segmented matrix
           Current_Row = Current_Row + 1;
       end
       Line_Matrix{int64(Row_Iterator/2)} = Current_Line;  
       Row_Iterator = Row_Iterator+2;
       count = count+1;
end

end

