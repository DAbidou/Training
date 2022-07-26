% In the shared variables section, define four triangle geometries and
% define a precondition that the rightTri function returns a right
% triangle.

% test triangles
tri = [7 9];
triIso = [4 4];
tri306090 = [2 2*sqrt(3)];
triSkewed = [1 1500];

% Define an absolute tolerance
tol = 1e-10; 
 
% preconditions
angles = rightTri(tri);
assert(angles(3) == 90,'Fundamental problem: rightTri not producing right triangle')

%% Test 1: sum of angles

% Test 1 tests the summation of the triangle angles. If the summation is
% not equal to 180 degrees, assert throws an error.

angles = rightTri(tri);
assert(sum(angles) == 180)
 
angles = rightTri(triIso);
assert(sum(angles) == 180)
 
angles = rightTri(tri306090);
assert(sum(angles) == 180)
 
angles = rightTri(triSkewed);
assert(sum(angles) == 180)

%% Test 2: isosceles triangles

% Test 2 tests that if two sides are equal, the corresponding angles are
% equal. If the non-right angles are not both equal to 45 degrees, the
% assert function throws an error.

angles = rightTri(triIso);
assert(angles(1) == 45)
assert(angles(1) == angles(2))
 
%% Test 3: 30-60-90 triangle

% Test 3 tests that if the triangle sides are 1 and sqrt(3), the angles are
% 30, 60, and 90 degrees. If this condition is not true, assert throws an
% error.

angles = rightTri(tri306090);
assert(abs(angles(1)-30) <= tol)
assert(abs(angles(2)-60) <= tol)
assert(abs(angles(3)-90) <= tol)

%% Test 4: Small angle approximation

% Test 4 tests the small-angle approximation. The small-angle approximation
% states that for small angles the sine of the angle in radians is
% approximately equal to the angle. If it is not true, assert throws an
% error.

angles = rightTri(triSkewed);
smallAngle = (pi/180)*angles(1); % radians
approx = sin(smallAngle);
assert(abs(approx-smallAngle) <= tol, 'Problem with small angle approximation')
