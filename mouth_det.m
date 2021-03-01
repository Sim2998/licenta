detector = vision.CascadeObjectDetector('maskdetectorr_20_60.xml');
nose_detector = vision.CascadeObjectDetector('Nose', 'MergeThreshold', 20);
mouth_detector = vision.CascadeObjectDetector('Mouth', 'MergeThreshold', 20);
counter = 0;
for k = 850:854
    filename = ['images\' num2str(k) '.jpg'];
    I = imread(filename);
    release(mouth_detector);
    bbox_mouth = mouth_detector(I);
    
end