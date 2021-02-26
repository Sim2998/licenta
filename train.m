negativeFolder = 'C:\Users\sim_b\OneDrive\Desktop\no_mask'
NumStages = 14;
FAR = 0.6;

masks = [m.DataSource.Source m.LabelData];
masks = masks(:,[1,2]);
trainCascadeObjectDetector('maskdetectorr_14_60.xml', masks, negativeFolder, 'NumCascadeStages', NumStages, 'FalseAlarmRate', FAR);