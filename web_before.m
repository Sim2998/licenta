%cam = webcam();
I = snapshot(cam);
detector = vision.CascadeObjectDetector('maskdetectorr_20_60.xml');
nose_detector = vision.CascadeObjectDetector('Nose', 'MergeThreshold', 20, 'UseROI', true);
mouth_detector = vision.CascadeObjectDetector('Mouth','MergeThreshold', 110, 'UseROI', true);
while true
    I = snapshot(cam);    
    bbox = step(detector, I);
    s = size(bbox);
    for i = 1: s(1)
        bbox_nose = nose_detector(I, bbox(i, :));
        bbox_mouth = mouth_detector(I, bbox(i, :));
        if isempty(bbox_nose) == 1 & isempty(bbox_mouth) == 1
            J = insertObjectAnnotation(I,'rectangle', bbox(i,:),'MASK WORN CORRECTLY');  
            I = J;
        else
             if isempty(bbox_nose) == 0 & isempty(bbox_mouth) == 1
                J = insertObjectAnnotation(I,'rectangle', bbox(i,:),'MASK WORN INCORRECTLY');
                I = J;
             end
        end
    end
       imshow(I);
end