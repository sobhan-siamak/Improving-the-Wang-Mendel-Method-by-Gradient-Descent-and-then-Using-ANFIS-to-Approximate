



clc;
clear ;
close all;


%% Anfis Part

%% Create Train Data

xmin=-5;
xmX=5;
stpx=0.2500;
TrainData=zeros(1681,3);
indexr=0;
for i=1:41      
     x1=xmin+(i-1)*stpx;
     for j=1 :41
         x2=xmin+(j-1)*stpx;
         indexr=indexr+1;
         TrainData(indexr,1)=x1;
         TrainData(indexr,2)=x2;
         TrainData(indexr,3)=x1.^2+x2.^2;
                 
     end
        
end


X=TrainData(:,1:2);
Y=TrainData(:,3);

epoch_n = 16;
stepsize=0.01;
fis=genfis1([X Y] , 7,'trimf');

%% Train Data Using Anfis Method

[fis,error]=anfis([X Y],fis,[epoch_n nan stepsize]);
figure(1)

plot3(TrainData(:,1),TrainData(:,2),Y);

legend('Training Data Actual Output','Actual Output');

figure(2)
plot3(TrainData(:,1),TrainData(:,2),evalfis(X,fis));
legend('Training Data Anfis Output','anfis Output');


TT=TrainData(:,3);
YY=evalfis(X,fis);
ee=TT-YY;



%% Create Test Data or Checking Data

DataCheck=zeros(169,3);
X1test=sort(unifrnd(-5,5,1,13));
X2test=sort(unifrnd(-5,5,1,13));
index=0;
Ytrue=zeros(13,13);
for i=1:13
    for j=1:13
        index=index+1;
        Ytrue(i,j)=X1test(i).^2+X2test(j).^2;
        DataCheck(index,1)=X1test(i);
        DataCheck(index,2)=X2test(j);
        DataCheck(index,3)=Ytrue(i,j);       
        
    end
end

X1=DataCheck(:,1:2);
Y1=DataCheck(:,3);

[fis_test,error2]=anfis([X1 Y1],fis,epoch_n);


TT2=DataCheck(:,3);
YY2=evalfis(X1,fis_test);
ee2=TT2-YY2;
