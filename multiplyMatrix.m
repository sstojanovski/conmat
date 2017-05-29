function output = multiplyMatrix(iterations, inputFile)

output = zeros(268, 268);

if strfind(inputFile, 'fmri')
    mat_1 = csvread(inputFile);
else
    mat_1 = csvread(inputFile, 1, 0);
end

output = mat_1; % for N=1
mat_n = mat_1; % for matrix multiplication

for N = 2:iterations
    mat_n = matrix*matrix;
    output = output + 2^(-N)*log(1+mat_n);
end
output = reshape(output, 268*268, 1);
output = (output - min(output))/(max(output) - min(output));
output = reshape(output, 268, 268);
csvwrite(strcat('0001_01_', 'comb.csv'), output)
end
