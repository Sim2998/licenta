file = dir('C:\Users\sim_b\OneDrive\Desktop\LICENTA\dataset\with_mask');
NF = length(file);
images = cell(NF,1);
for k = 1 : NF
  images{k} = imread(fullfile('C:\Users\sim_b\OneDrive\Desktop\LICENTA\dataset\with_mask', file(k).name));
end