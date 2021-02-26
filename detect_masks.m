detector = vision.CascadeObjectDetector('maskdetectorr_14_60.xml');
counter = 0;
for k = 45:60
    filename = ['images\' num2str(k) '.jpg'];
    I = imread(filename);
    release(detector);
    bbox = step(detector, I)
    a = size(bbox)
    J = insertShape(I,'rectangle', bbox);
    figure;
    imshow(J);
    if size(bbox) > [0,0]
        counter = counter + 1;
    end
end