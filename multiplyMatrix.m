% C(x, y) = sigma(2^(-N)log(1+C(x,y)))
% matrix = sigma(2^(-N)log(1+matrix)))


% take in a csv, and apply the math

function output = multiplyMatrix(iterations, inputFile)

output = zeros(268, 268);

if strfind(inputFile, 'fmri')
    matrix = csvread(inputFile);
else
    matrix = csvread(inputFile, 1, 0);
end

for N = 1:iterations
    matrix = matrix*matrix;
    output = output + 2^(-N)*log(1+matrix);
end
output = reshape(output, 268*268, 1);
output = (output - min(output))/(max(output) - min(output));
output = reshape(output, 268, 268);
csvwrite(strcat('0001_01_', 'comb.csv'), output)
end
