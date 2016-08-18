
number_of_samples=20;
number_of_features_per_sample=500;
L=zeros(number_of_samples,1);
feature_error=0;
for i=1:number_of_samples
    [label,~]=predict(svmmodel,X_test(((i-1)*number_of_features_per_sample+1):(i*number_of_features_per_sample),:));
   feature_error=feature_error+sum(label.*t_train((i-1)*number_of_features_per_sample+1:(i*number_of_features_per_sample)));
    L(i)=sum(label);
end