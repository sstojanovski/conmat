function output = getSlopes(dtiList, fmriList)

  slopes = [];
  for min = -1.0:0.1:0.9
    slopes(1, index) = correlationSloping(dtiList, fmriList, min, min+0.1);

    index = index + 1;
  end
  output = slopes;
end
