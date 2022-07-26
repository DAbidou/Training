function angles = rightTri(sides)
% This function takes lengths of two sides of a triangle as input and
% returns the three angles of the corresponding right triangle. The input
% sides are the two shorter edges of the triangle, not the hypotenuse.


A = atand(sides(1)/sides(2));
B = atand(sides(2)/sides(1));
hypotenuse = sides(1)/sind(A);
C = asind(hypotenuse*sind(A)/sides(1));

angles = [A B C];

end