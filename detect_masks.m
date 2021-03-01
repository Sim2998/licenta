detector = vision.CascadeObjectDetector('maskdetectorr_20_60.xml');
nose_detector = vision.CascadeObjectDetector('Nose', 'MergeThreshold', 20);
mouth_detector = vision.CascadeObjectDetector('Mouth','MergeThreshold', 110);
counter = 0;
for k = 800:854
    filename = ['images\' num2str(k) '.jpg'];
    I = imread(filename);
    release(nose_detector);
    bbox_nose = nose_detector(I);
    release(mouth_detector);
    bbox_mouth = mouth_detector(I);
    if isempty(bbox_nose) == 1 & isempty(bbox_mouth) == 1
        release(detector);
        bbox = step(detector, I);
        a = size(bbox);
        J = insertObjectAnnotation(I,'rectangle', bbox,'MASK WORN CORRECTLY');  
        figure;
        imshow(J);
        if size(bbox) > [0,0]
            counter = counter + 1;
        end
    else
        if isempty(bbox_nose) == 0 & isempty(bbox_mouth) == 1
            release(detector);
            bbox = step(detector, I);
            a = size(bbox);
            J = insertObjectAnnotation(I,'rectangle', bbox,'MASK WORN INCORRECTLY');  
            figure;
            imshow(J);
            if size(bbox) > [0,0]
                counter = counter + 1;
            end
        else
            imshow(I);
            
        end
    end
end