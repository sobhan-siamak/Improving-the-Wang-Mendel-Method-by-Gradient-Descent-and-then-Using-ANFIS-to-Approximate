function [ yhat,Wfire] = ZCOA23( num11,num12,num21,num22,num23,mutx11,mutx12,mutx21,mutx22,mutx23,RuleBaseSugeno,Wfire)

%w1 w2 w3 w4 w5 w6
% W(i)=min(mux1,mux2)
%a1-a6   a1-a6=stepy
%z1%z6   z1-z6=Fcenty(i)
%zcoa=(w1a1z1+w2a2z2+...)/(w1a1+w2a2+...)
%yhat=zcoa

% % % % a1=stepy;
% % % % a2=stepy;
% % % % a3=stepy;
% % % % a4=stepy;
% % % % a5=stepy;
% % % % a6=stepy;

w1=mutx11*mutx21;
Wfire(num11,num21)=w1;
w2=mutx11*mutx22;
Wfire(num11,num22)=w2;
w3=mutx11*mutx23;
Wfire(num11,num23)=w3;
w4=mutx12*mutx21;
Wfire(num12,num21)=w4;
w5=mutx12*mutx22;
Wfire(num12,num22)=w5;
w6=mutx12*mutx23;
Wfire(num12,num23)=w6;


z1=RuleBaseSugeno(num11,num21);
z2=RuleBaseSugeno(num11,num22);
z3=RuleBaseSugeno(num11,num23);
z4=RuleBaseSugeno(num12,num21);
z5=RuleBaseSugeno(num12,num22);
z6=RuleBaseSugeno(num12,num23);


% % % % z1=Fcenty(y1);
% % % % z2=Fcenty(y2);
% % % % z3=Fcenty(y3);
% % % % z4=Fcenty(y4);
% % % % z5=Fcenty(y5);
% % % % z6=Fcenty(y6);




% % % % zcoa=((w1*a1*z1)+(w2*a2*z2)+(w3*a3*z3)+(w4*a4*z4)+(w5*a5*z5)+(w6*a6*z6))/((w1*a1)+(w2*a2)+(w3*a3)+(w4*a4)+(w5*a5)+(w6*a6));
zcoa=((w1*z1)+(w2*z2)+(w3*z3)+(w4*z4)+(w5*z5)+(w6*z6))/(w1+w2+w3+w4+w5+w6);
yhat=zcoa;


end

