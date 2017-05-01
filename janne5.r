int d, x, y, count, deg, c1y, fool,a,b,c,pos,a1,b1,c1,pos1,head;

main()
{
c1y = 10;
deg = 90;
first();
drive(0,0);
while(1) {pos(); radar1(); }
}


pos()
{
x=loc_x();
if (x>=500) head=10; else head=-10;
if (head==10) drive(180,100); else drive(360,100);

}

radar1()
{
d=0;deg=pos;


while (d <= 1) {
   d = scan(deg,10);
   if (deg <= 170) {
      deg += 15;
      } else {
      deg = 0;
      }
   }
   cannon(deg-15,d);
   pos();
   a1=d;
   d=0;
   a=deg-15;

   count = 3; fool = 0;

      while (fool < 2) {
         d = scan(deg-count,3);
         if (d > 1) {c1=b1-a1; pos1=c1+b1; b=deg-count; c=b-a; pos=c+b; a=pos;a1=pos1; cannon(pos-head,pos1);}
	 d = scan(deg+count,3);
         if (d > 1) {c1=b1-a1; pos1=c1+b1; b=deg+count; c=b-a; pos=c+b; a=pos;a1=pos1; cannon(pos-head,pos1);}
	 count += 6; fool +=1;
	 }

}


/* one time only */


first()
{
deg=90;

  drive(270,100);
  while (loc_y() > 50){
    if (scan(deg,10)>40) cannon(deg,scan(deg,10));
    deg+=20;
    }
  drive(0,0);
}
