

%%%%%%%%%%%%%% @copy by sobhan siamak


%%
clc;
clear ;
close all;

%X1=linspace(-5,5,41);
%X2=linspace(-5,5,41);
X1=[-5:0.25:5];
X2=[-5:0.25:5];


n=size(X1,2);
m=size(X2,2);
fuzzysetnumbers=7;

xmin=-5;
xmax=5;
ymin=0;
ymax=50;
pointx=41;
pointy=1681;
RBpoint=1681;
stepx=(xmax-xmin)/(fuzzysetnumbers-1);
stpx=0.25;
%stepx=1.666666;%because matlab calculate to 4 digit float

stepy=(ymax-ymin)/(fuzzysetnumbers-1);
%stepy=8.33333;%because matlab calculate to 4 digit float

Y=zeros(n,m);
for i=1:n
    for j=1:m
        Y(i,j)=X1(i).^2+X2(j).^2;
    end
end
surf(X1,X2,Y);
xlabel('X1');
ylabel('X2');
zlabel('Original Y=F(X1,X2)=X1^2+X2^2');
title('Original 3D-Shape of F(X1,X2)=X1^2+X2^2 ');


Fcentx=[xmin:stepx:xmax];
Fcenty=[ymin:stepy:ymax];

%RuleBase=cell(1,RBpoint);%RBpoint is the number of Rules or 1681 
RuleBase=zeros(RBpoint,4);%RBpoint is the number of Rules or 1681 
% attension that 4th Dimension is Firing Degree
index=0;% is the index of RuleBase Matrix
for x1=xmin:stpx:xmax
     for x2=xmin:stpx:xmax
        index=index+1;
 %%       %%%%%%%Fuzzysets on X1
        if(x1==xmin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            if(mu1>mu2)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mu2>mu1)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
        end%%%%%%%%%%%%%
        if(x1>xmin && x1<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            if(mu1>mu2)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mu2>mu1)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
        end
        if(x1==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mx==mu2)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            
            
        end
        if(x1>xmin+stepx && x1<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            if(mu2>mu3)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
            if(mu3>mu2)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            
        end
        if(x1==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            
        end  %%%%%%%%%%
        if(x1>xmin+2*stepx && x1<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            if(mu3>mu4)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mu4>mu3)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
        end %%%%%%%%%%
        if(x1==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
        end  %%%%%%%%%%%%
        if(x1>xmin+3*stepx && x1<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            if(mu4>mu5)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mu5>mu4)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(x1==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mx==mu6)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
        end  %%%%%%%%%%%%%%%%
        if(x1>xmin+4*stepx && x1<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            if(mu5>mu6)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mu6>mu5)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            
        end  %%%%%%%%%%%%%%%%%%
        if(x1==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mx==mu6)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mx==mu7)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end%%%%%%%%%%%%%%%%%
        if(x1>xmin+5*stepx && x1<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            if(mu6>mu7)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mu7>mu6)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end  %%%%%%%%%%%%
        if(x1==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            if(mu6>mu7)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mu7>mu6)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end
%%        %%%%%%Fuzzysets on X2
        if(x2==xmin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            if(mu1>mu2)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mu2>mu1)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
        end%%%%%%%%%%%%%%%
        if(x2>xmin && x2<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            if(mu1>mu2)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mu2>mu1)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
        end%%%%%%%%%%%%%%%
        if(x2==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mx==mu2)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
        end%%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+stepx && x2<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            if(mu2>mu3)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
            if(mu3>mu2)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            
            
        end%%%%%%%%%%%%%%%%%%
        if(x2==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            
        end %%%%%%%%%%%%%%%%
        if(x2>xmin+2*stepx && x2<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            if(mu3>mu4)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mu4>mu3)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
        end%%%%%%%%%%%%%%
        if(x2==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
        end %%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+3*stepx && x2<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            if(mu4>mu5)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mu5>mu4)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
        end %%%%%%%%%%%%%%
        if(x2==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mx==mu6)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
        end%%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+4*stepx && x2<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            if(mu5>mu6)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mu6>mu5)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
        end%%%%%%%%%%%%%%%%%%%%%%%%
        if(x2==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mx==mu6)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mx==mu7)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%%%%
        if(x2>xmin+5*stepx && x2<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            if(mu6>mu7)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mu7>mu6)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%%%%%%%%
        if(x2==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            if(mu6>mu7)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mu7>mu6)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%
        
          y=x1^2+x2^2; 
%%        %%%%%%%%Fuzzysets on Y
        if(y==ymin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            if(mu1>mu2)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mu2>mu1)
                muy=mu2;
                RuleBase(index,3)=2;
            end
        end%%%%%%%%%%%%%%%%
        if(y>ymin && y<ymin+stepy)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            if(mu1>mu2)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mu2>mu1)
                muy=mu2;
                RuleBase(index,3)=2;
            end
        end%%%%%%%%%%%%%%%%
        if(y==ymin+stepy)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mx==mu2)
                muy=mu2;
                RuleBase(index,3)=2;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            
        end%%%%%%%%%%%%%%%%%%%
        if(y>ymin+stepy && y<ymin+2*stepy)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            if(mu2>mu3)
                muy=mu2;
                RuleBase(index,3)=2;
            end
            if(mu3>mu2)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            
        end%%%%%%%%%%%%%%%%%
        if(y==ymin+2*stepy)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                muy=mu2;
                RuleBase(index,3)=2;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
        end%%%%%%%%%%%%%%%%%%
        if(y>ymin+2*stepy && y<ymin+3*stepy)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            if(mu3>mu4)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mu4>mu3)
                muy=mu4;
                RuleBase(index,3)=4;
            end
        end%%%%%%%%%%%%%%%%%%%
        if(y==ymin+3*stepy)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(y>ymin+3*stepy && y<ymin+4*stepy)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            if(mu4>mu5)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mu5>mu4)
                muy=mu5;
                RuleBase(index,3)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(y==ymin+4*stepy)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mx==mu6)
                muy=mu6;
                RuleBase(index,3)=6;
            end
        end%%%%%%%%%%%%%%%
        if(y>ymin+4*stepy && y<ymin+5*stepy)%Fuzzyset#5 and Fuzzyset#6
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            if(mu5>mu6)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mu6>mu5)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            
        end%%%%%%%%%%%%%%%
        if(y==ymin+5*stepy)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mx==mu6)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mx==mu7)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%%%
        if(y>ymin+5*stepy && y<ymin+6*stepy)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            if(mu6>mu7)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mu7>mu6)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%%
        if(y==ymin+6*stepy)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            if(mu6>mu7)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mu7>mu6)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%
         
  %%%%location of Firing degree=mux1*mux2*muy=index4 of RuleBase Matrix
        RuleBase(index,4)=(mux1*mux2*muy);
      
        %index=index+1;
    end
   % index=index+1;
   
end



%% Delete Conflict and Same Rule Bases and Select one of them

RuleBaseFinal=zeros(7,7);
FDegree=zeros(7,7);
[m2,n2]=size(RuleBaseFinal);
m1=size(RuleBase,1);
for i=1:m1
   for j=1:m2
       for k=1:n2
           if((RuleBase(i,1)==j)&&(RuleBase(i,2)==k)&&FDegree(j,k)<RuleBase(i,4))
               RuleBaseFinal(j,k)=RuleBase(i,3);
               FDegree(j,k)=RuleBase(i,4);
           end
           
       end
   end
    
end
disp('*********************Part A*****************')
disp('--------------------------------------------')
disp('Final Rule Base in Part A is:');
disp(RuleBaseFinal);

%% Start Gradient Decsent Algorithm
RuleBaseSugeno=zeros(m2,n2);
for i=1:m2
    for j=1:n2
        if(RuleBaseFinal(i,j)==1)
            RuleBaseSugeno(i,j)=Fcenty(1);
        end
        if(RuleBaseFinal(i,j)==2)
            RuleBaseSugeno(i,j)=Fcenty(2);
        end
        if(RuleBaseFinal(i,j)==3)
            RuleBaseSugeno(i,j)=Fcenty(3);
        end
        if(RuleBaseFinal(i,j)==4)
            RuleBaseSugeno(i,j)=Fcenty(4);
        end
        if(RuleBaseFinal(i,j)==5)
            RuleBaseSugeno(i,j)=Fcenty(5);
        end
        if(RuleBaseFinal(i,j)==6)
            RuleBaseSugeno(i,j)=Fcenty(6);
        end
        if(RuleBaseFinal(i,j)==7)
            RuleBaseSugeno(i,j)=Fcenty(7);
        end       
          
        
    end
end


disp('Final Rule Base Sugeno in Part A is:');
disp(RuleBaseSugeno);



%% Calculate MSE on Train Data
% YtrueTrain=zeros(41,41);
% YhatTrain=zeros(41,41);
% indexi=0;
% indexj=0;



RuleBase2=zeros(1681,3);
indexr=0;
for i=1:41      
     x1=xmin+(i-1)*stpx;
     for j=1 :41
         x2=xmin+(j-1)*stpx;
         indexr=indexr+1;
         RuleBase2(indexr,1)=x1;
         RuleBase2(indexr,2)=x2;
         RuleBase2(indexr,3)=x1.^2+x2.^2;
                 
     end
        
end
%%for iteration=1:100
    %for epoch=1:16
 Winit=zeros(7,7);   
 Wfire=zeros(7,7);
 RuleBaseSugenoFinal=RuleBaseSugeno;
 alpha1=0.1;
 alpha2=0.01;
 alpha3=0.001;
 alpha4=0.0001;
 iteration=250;
 MSEonTrain=zeros(1,iteration);
for i=1:iteration  
      
      indx=randi(1681,[1,16]);
   for epoch=1:16
%     for x1=xmin:stpx:xmax
        flag1=0;
%         indexi=indexi+1;
       x1=RuleBase2(indx(epoch),1);
       x2=RuleBase2(indx(epoch),2);
       ytrue=RuleBase2(indx(epoch),3);
        if(x1==xmin)%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if((x1>xmin) && (x1<xmin+stepx))%Fuzzyset#1 and Fuzzyset#2
            num11=1;
            num12=2;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if(x1==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num11=1;
            num12=2;
            num13=3;
            mutx11=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%%%
        if(x1>xmin+stepx && x1<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num11=2;
            num12=3;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%%
        if(x1==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num11=2;
            num12=3;
            num13=4;
            mutx11=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(x1>xmin+2*stepx && x1<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num11=3;
            num12=4;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);           
            
        end%%%%%%%%%%%%%%%
        if(x1==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num11=3;
            num12=4;
            num13=5;
            mutx11=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%%
        if(x1>xmin+3*stepx && x1<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num11=4;
            num12=5;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            
        end%%%%%%%%%%%%%%%%
        if(x1==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num11=4;
            num12=5;
            num13=6;
            mutx11=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%%
        if(x1>xmin+4*stepx && x1<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num11=5;
            num12=6;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            
        end%%%%%%%%%%%%%%
        if(x1==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num11=5;
            num12=6;
            num13=7;
            mutx11=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx13=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            flag1=1;
        end%%%%%%%%%%%%%%
        if(x1>xmin+5*stepx && x1<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            
        end%%%%%%%%%%%%%%
        if(x1==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num11=6;
            num12=7;
            mutx11=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mutx12=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            
            
        end%%%%%%%%%%%%%
        
  
  
  %%        %%%%%%Fuzzysets on X2Train
  
%     for x2=xmin:stpx:xmax
        flag2=0;
%         indexj=indexj+1;
        if(x2==xmin)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%%
        if(x2>xmin && x2<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            num21=1;
            num22=2;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%%
        if(x2==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            num21=1;
            num22=2;
            num23=3;
            mutx21=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            flag2=1;
            
        end%%%%%%%%%%%%%%%%%
        if(x2>xmin+stepx && x2<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            num21=2;
            num22=3;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
        end%%%%%%%%%%%%%%%%%
        if(x2==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            num21=2;
            num22=3;
            num23=4;
            mutx21=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%%
        if(x2>xmin+2*stepx && x2<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            num21=3;
            num22=4;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2); 
            
        end%%%%%%%%%%%%%%%
        if(x2==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            num21=3;
            num22=4;
            num23=5;
            mutx21=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%%%
        if(x2>xmin+3*stepx && x2<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            num21=4;
            num22=5;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            
        end%%%%%%%%%%%%%%%%
        if(x2==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            num21=4;
            num22=5;
            num23=6;
            mutx21=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            flag2=1;
            
        end%%%%%%%%%%%%%%%
        if(x2>xmin+4*stepx && x2<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            num21=5;
            num22=6;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
           
        end%%%%%%%%%%%%%%
        if(x2==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            num21=5;
            num22=6;
            num23=7;
            mutx21=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx23=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            flag2=1;
        end%%%%%%%%%%%%%%
        if(x2>xmin+5*stepx && x2<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            
        end%%%%%%%%%%%%%%
        if(x2==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            num21=6;
            num22=7;
            mutx21=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mutx22=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
        end%%%%%%%%%%%%%
        %%%%%%%%
        %%%%%%%%%%
        %%%%%%%% location of yhat and call zcoa
         if(flag1==0 && flag2==0)%%%%%ZCOA22
          [yhat,Wfire]=ZCOA22(num11,num12,num21,num22,mutx11,mutx12,mutx21,mutx22,RuleBaseSugeno,Wfire);
         end
         if(flag1==0 && flag2==1)%%%%%ZCOA23
          [yhat,Wfire]=ZCOA23(num11,num12,num21,num22,num23,mutx11,mutx12,mutx21,mutx22,mutx23,RuleBaseSugeno,Wfire);
         end
         if(flag1==1 && flag2==0)%%%%%ZCOA32
          [yhat,Wfire]=ZCOA32(num11,num12,num13,num21,num22,mutx11,mutx12,mutx13,mutx21,mutx22,RuleBaseSugeno,Wfire);
         end
         if(flag1==1 && flag2==1)%%%%%ZCOA33
          [yhat,Wfire]=ZCOA33(num11,num12,num13,num21,num22,num23,mutx11,mutx12,mutx13,mutx21,mutx22,mutx23,RuleBaseSugeno,Wfire);
         end
%          YtrueTrain(indexi,indexj)=(x1.^2+x2.^2);
%          YhatTrain(indexi,indexj) =yhat;
%      end%%%%%%%%%%%%%%%%%%%%end of second for
%      indexj=0;
%    end%%%%%%%%%%%%%%%end of first for

    
            Winit=Wfire+(yhat-ytrue)*Wfire;
%             Winit=(yhat-ytrue)*Wfire;

%             Winit=Winit+(yhat-ytrue)*Wfire;

%             Winit=Wfire;
             
           Winit=Winit/sum(sum(Wfire));%% Normalization
               
        
    end%%%%%% end of epoch
    
    
      %%%%%% location of update RuleBaseSugeno or Fuzzy centers
      RuleBaseSugenoFinal=RuleBaseSugenoFinal-(alpha1*Winit);
      MSEonTrain(1,i)=MSECalculate(xmin,stpx,xmax,stepx,Fcentx,RuleBaseSugenoFinal,Wfire);
%       Wfire=zeros(7,7);
end %%%%%% end of iteration
% end
figure(2)
plot(MSEonTrain,'r');
% title('Alpha=0.0001');
xlabel('iteration');
ylabel('MSE');
MSEF=sum(MSEonTrain)/(2*iteration);

disp('*************** Mean MSE on Train Data with Gradient Descent Method***********');
disp('**********************************************************');
disp(['Mean of iteration MSE on Train Data is ' num2str(MSEF)]);
('**********************************************************************************');





%% Test Part


MSETest=zeros(1,100);
run=100;
%%%%%%% 100 times RUN  %%%%%%% location of Run For

for k=1:run

   
    
    
   [Ytrue,YhatTest,m]=EstimationYTest(xmin,stepx,Fcentx,RuleBaseSugenoFinal);
   MSETest(k)=(sum(sum((YhatTest-Ytrue).^2)))/(2*m); 
   

end



MeanMSE=(sum(MSETest)/run);
VarMSE=var(MSETest);
StdMSE=std(MSETest);



disp('*******************************************************');
disp('Report MSE ,Variance and Standard Deviation on Test Data with Gradient Descent Algorithm');
disp('********************************************************');
disp(['Final mean of MSE on Test Data with Gradient Descent Algorithm is:    ' num2str(MeanMSE)]);
disp('**************************')
disp(['Variance of MSE on Test Data with Gradient Descent Algorithm is:      ' num2str(VarMSE)]);
disp('**************************')
disp(['Standard Deviation of MSE on Test Data with Gradient Descent Algorithm is:   ' num2str(StdMSE)]);
disp('**************************')
      