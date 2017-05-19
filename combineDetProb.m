function combineDetProb(prefix)
det = csvread(strcat(prefix, 'det.csv'), 1, 0);
prob = csvread(strcat(prefix, 'prob.csv'), 1, 0);
comb = mean(cat(3, det, prob), 3);
% comb = max(det, prob);
csvwrite(strcat(prefix, 'comb.csv'), comb)
end
