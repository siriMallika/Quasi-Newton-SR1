
X = [2; 3];
B = [X(1,1) 0;0 X(2,1)];

x1=X(1,1);
x2=X(2,1);
Z=(x1-9)*(x1-9)+(x2-6)*(x2-6)+7; 
%gradient
dx1=2*x1-18;
dx2=2*x2-12;
gZ=[dx1;dx2];
count=0;
% while loop execution 
flag = true;
while flag

    fprintf('X_%d: %d,%d\n',count, x1,x2);
    %rootfinding B*dx=gZ --> x=??
    B=-1*B;
    dx= B \ gZ;
    r = B*dx -gZ ;
    gZ0=gZ; 
    X1=X+dx;
    x1=X1(1,1);
    x2=X1(2,1);
    dx1=2*x1-18;
    dx2=2*x2-12;
    gZ=[dx1;dx2];
    y=gZ-gZ0;
    M=(y-B*dx)'*dx\(y-B*dx)*(y-B*dx)';
    B=B+M;
    %dx=B\gZ
    X=X1;
    C=abs(dx'*(y-B*dx));
    norm1=norm(dx)*norm(y-B*dx);
    norm2=0.0000000001*norm1;
     if ~((C>= norm2))
        flag = false;
     end
    count=count+1;

end
