%cam = webcam();
img = snapshot(cam);
detector = vision.CascadeObjectDetector('maskdetectorr_20_60.xml', 'UseROI', true);
face_detector = vision.CascadeObjectDetector;
nose_detector = vision.CascadeObjectDetector('Nose');
while true
    img = snapshot(cam);    
    bbox_face = face_detector(img);
    bbox_nose = nose_detector(img);
    if isempty(bbox_face) == 0 & isempty(bbox_nose) == 1
        s = size(bbox_face);
        if s(1) > 1
            for i = 1:s(1)
                    bbox = detector(img, bbox_face(i,:));
                    IFaces = insertObjectAnnotation(img,'rectangle', bbox,'SUS');   
                        %figure
                    imshow(IFaces)
            end
        else
            bbox = detector(img, bbox_face);
            IFaces = insertObjectAnnotation(img,'rectangle', bbox,'JOS');   
            %figure
            imshow(IFaces)
        end
    else
        imshow(img)
    end
end
