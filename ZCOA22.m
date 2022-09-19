function [ yhat,Wfire] = ZCOA22( num11,num12,num21,num22,mutx11,mutx12,mutx21,mutx22,RuleBaseSugeno,Wfire )

%w1 w2 w3 w4 w5 w6
% W(i)=min(mux1,mux2)
%a1-a6   a1-a6=stepy
%z1%z6   z1-z6=Fcenty(i)
%zcoa=(w1a1z1+w2a2z2+...)/(w1a1+w2a2+...)
%yhat=zcoa
% % % % a1=stepy;%% no need
% % % % a2=stepy;%% no need
% % % % a3=stepy;%% no need
% % % % a4=stepy;%% no need

w1=mutx11*mutx21;%%%%w1=mutx11*mutx21; multiplication
Wfire(num11,num21)=w1;
w2=mutx11*mutx22;%%%%w2=mutx11*mutx22;
Wfire(num11,num22)=w2;
w3=mutx12*mutx21;%%%%w3=mutx12*mutx21;
Wfire(num12,num21)=w3;
w4=mutx12*mutx22;%%%%w4=mutx12*mutx22;
Wfire(num12,num22)=w4;

z1=RuleBaseSugeno(num11,num21);%%Z1 = RuleBaseSugeno(num11,num21);
z2=RuleBaseSugeno(num11,num22);%%Z2=RuleBaseSugeno(num11,num22);
z3=RuleBaseSugeno(num12,num21);%%Z3=RuleBaseSugeno(num12,num21);
z4=RuleBaseSugeno(num12,num22);%%Z4=RuleBaseSugeno(num12,num22);

% % % z1=Fcenty(y1);%% no need
% % % z2=Fcenty(y2);
% % % z3=Fcenty(y3);
% % % z4=Fcenty(y4);

%%%%% ZCOA = (w1*z1+...+wn*zn)/(w1+...wn)
% zcoa=((w1*a1*z1)+(w2*a2*z2)+(w3*a3*z3)+(w4*a4*z4))/((w1*a1)+(w2*a2)+(w3*a3)+(w4*a4));%% no need
zcoa=((w1*z1)+(w2*z2)+(w3*z3)+(w4*z4))/(w1+w2+w3+w4);
yhat=zcoa;

end

