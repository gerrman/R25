clear; close;
load JapaneseVowelsTrain
figure
for i = 1:12
    subplot(12,1,13-i)
    plot(X{1}(i,:));
    ylabel(i) 
    xticklabels('')
    yticklabels('')
    box off
end
title("Training Observation 1")
subplot(12,1,12)
xticklabels('auto')
xlabel("Time Step")
numObservations = numel(X);
for i=1:numObservations
    sequence = X{i};
    sequenceLengths(i) = size(sequence,2);
end
[sequenceLengths,idx] = sort(sequenceLengths);
X = X(idx);
Y = Y(idx);
figure
bar(sequenceLengths)
ylim([0 30])
xlabel("Sequence")
ylabel("Length")
title("Sequence Lengths")
miniBatchSize = 27;
miniBatchLocations = miniBatchSize+1:miniBatchSize:numObservations;
XLocations = repmat(miniBatchLocations,[2 1]);
YLocations = repmat([0;30],[1 9]);
hold on
line(XLocations,YLocations, ...
        'Color','r', ...
        'LineStyle','--')
inputSize = 12;
outputSize = 100;
outputMode = 'last';
numClasses = 9;

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(outputSize,'OutputMode',outputMode)
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]
maxEpochs = 150;
miniBatchSize = 27;
shuffle = 'never';

options = trainingOptions('sgdm', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'Shuffle', shuffle);
net = trainNetwork(X,Y,layers,options);
load JapaneseVowelsTest
% XTest(1:3)
% numObservationsTest = numel(XTest);
% for i=1:numObservationsTest
%     sequence = XTest{i};
%     sequenceLengthsTest(i) = size(sequence,2);
% end
% [sequenceLengthsTest,idx] = sort(sequenceLengthsTest);
% XTest = XTest(idx);
% YTest = YTest(idx);
YPred = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize);
acc = sum(YPred == YTest)./numel(YTest)

