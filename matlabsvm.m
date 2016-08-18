function [ svmmodel ] =matlabsvm(X_train, t_train)
svmmodel=fitcsvm(X_train,t_train,'KernelFunction','rbf');
end

%dads