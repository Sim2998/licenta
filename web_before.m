%cam = webcam();
img = snapshot(cam);
detector = vision.CascadeObjectDetector('maskdetectorr_20_60.xml');
nose_detector = vision.CascadeObjectDetector('Nose', 'MergeThreshold', 20);
mouth_detector = vision.CascadeObjectDetector('Mouth','MergeThreshold', 110);
while true
    img = snapshot(cam);    
    bbox_nose = nose_detector(img);
    bbox_mouth = mouth_detector(img);
   if isempty(bbox_nose) == 1 & isempty(bbox_mouth) == 1
        bbox = detector(img);
        IFaces = insertObjectAnnotation(img,'rectangle', bbox,'Mask worn CORRECTLY');   
            %figure
        imshow(IFaces)
   else
        if isempty(bbox_nose) == 0 & isempty(bbox_mouth) == 1
            bbox = detector(img);
            IFaces = insertObjectAnnotation(img,'rectangle', bbox,'Mask worn INCORRECTLY');   
                %figure
            imshow(IFaces)
        else
            imshow(img);
        end
    end
end