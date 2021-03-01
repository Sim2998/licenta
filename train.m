negativeFolder = 'no_mask'
NumStages = 20;
FAR = 0.6;

masks = [m.DataSource.Source m.LabelData];
masks = masks(:,[1,2]);
trainCascadeObjectDetector('maskdetectorr_20_60.xml', masks, negativeFolder, 'NumCascadeStages', NumStages, 'FalseAlarmRate', FAR);