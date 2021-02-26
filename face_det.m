detector = vision.CascadeObjectDetector;
counter = 0;
for k = 1:5
    filename = ['C:\Users\sim_b\OneDrive\Desktop\LICENTA\test_images\cici\' num2str(k) '.jpg'];
    I = imread(filename);
    bbox = detector(I);
    a = size(bbox)
    IFaces = insertObjectAnnotation(I,'rectangle',bbox,'Face');   
    %figure
    imshow(IFaces)
    if isempty(bbox) == 0
        counter = counter + 1;
    end
end