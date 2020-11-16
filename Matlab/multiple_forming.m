clear all 
clc 
close all

k=32;
x_op=9;
a_op=9;
x=de2bi(x_op,k,'left-msb');
a=de2bi(a_op,k,'left-msb');

a_neg=a; %create -a
a_neg(1)=1;

x_mbe=zeros(1,k+3);
x_mbe(3:34)=x;


a0=zeros(1,k); %0
a1=a; %+a
a2=a; %+a
a3=de2bi(bitsll(a_op,1),k,'left-msb'); %2a
a4=a3; %-2a
a4(1)=1; 
a5=a_neg; %-a
a6=a_neg; %-a
a7=a0; %0

pp=zeros(17,32); %matrix of partial products
s=zeros(1,17); %vectors of signs
j=17;
for i=1:2:33
    
    if x_mbe(i)==0 &&  x_mbe(i+1)==0 &&  x_mbe(i+2)==0
    pp(j,:)=a0;
    elseif x_mbe(i)==0 &&  x_mbe(i+1)==0 &&  x_mbe(i+2)==1
    pp(j,:)=a1;  
    elseif x_mbe(i)==0 &&  x_mbe(i+1)==1 &&  x_mbe(i+2)==0
    pp(j,:)=a2; 
    elseif x_mbe(i)==0 &&  x_mbe(i+1)==1 &&  x_mbe(i+2)==1
    pp(j,:)=a3;
    elseif x_mbe(i)==1 &&  x_mbe(i+1)==0 &&  x_mbe(i+2)==0
    pp(j,:)=a4;
    elseif x_mbe(i)==1 &&  x_mbe(i+1)==0 &&  x_mbe(i+2)==1
    pp(j,:)=a5;
    elseif x_mbe(i)==1 &&  x_mbe(i+1)==1 &&  x_mbe(i+2)==0
    pp(j,:)=a6;
    else
    pp(j,:)=a7;   
    end 
    s(j)=x_mbe(i);
    
    j=j-1;
    

end


%https://stackoverflow.com/questions/52497946/fprintf-new-line-after-a-certain-point
fid=fopen("./pp.txt",'w');
format = [strjoin(repmat({'%d'}, 1, 32), ' ') '\n'];

fprintf(fid,format,pp');
%fprintf(fid,'int32',pp(1));
fclose(fid)
