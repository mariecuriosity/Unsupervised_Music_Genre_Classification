function [ L ] = evaluate_features_builtinsvm(X, number_of_samples, number_of_features_per_sample,svmmodel )
%takes matrix of X=(N*J)x42 (42 is lenght of MPCC) and
% w is 
%returns a vector of labels L
%each song has J MPCC 
% we apply the SVM (i.e. w,b ) to eah feature (we get multiple features from a song)
% then we sum the results and decide by a majority vote. 

L=zeros(number_of_samples,1);
for i=1:number_of_samples
    [label,~]=predict(svmmodel,X(((i-1)*number_of_features_per_sample+1):(i*number_of_features_per_sample),:));
    L(i)=sum(label);
end
end



