cam = webcam();
img = snapshot(cam);
detector = vision.CascadeObjectDetector('maskdetectorr_14_60.xml');
while true
    img = snapshot(cam);    
    bbox = detector(img);
    IFaces = insertObjectAnnotation(img,'rectangle', bbox,'Mask');   
        %figure
    imshow(IFaces)
end
