int d, x, y, count, head, deg, dam, c1y, fireloop, fool;

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
if (x>=500) drive(180,100); else drive(360,100);
}

radar1()
{
d=0;


while (d <= 1) {
   d = scan(deg,10);
   if (deg <= 170) {
      deg += 20;
      } else {
      deg = 0;
      }
   }
   deg -=20;
   cannon(deg,d);
   d=0;

   fireloop = 0; count = 4; fool = 0;

      while (fool < 4) {
         d = scan(deg-count,5);
         if (d > 1) {deg=deg-count; count=4; cannon(deg,d);}
	 d = scan(deg+count,5);
         if (d > 1) {deg=deg+count; count=4; cannon(deg,d);}
	 count += 4; fool=fool + 1;
	 }

}


/* one time only */


first()
{
  int angle;

    x = loc_x(); 
    y = c1y; 
  
  angle = plot_course(x,y);
  drive(angle,100);
  while (distance(loc_x(),loc_y(),x,y) > 100 && speed() > 0)
    ;
 
  drive(angle,20);
  while (distance(loc_x(),loc_y(),x,y) > 10 && speed() > 0)
   ;

  drive(angle,0); 
}


distance(x1,y1,x2,y2)
int x1;
int y1;
int x2;
int y2;
{
  int x, y;

  x = x1 - x2;
  y = y1 - y2;
  d = sqrt((x*x) + (y*y));
  return(d);
}


plot_course(xx,yy)
int xx, yy;
{
  int d;
  int x,y;
  int scale;
  int curx, cury;

  scale = 100000;  /* scale for trig functions */
  curx = loc_x();  /* get current location */
  cury = loc_y();
  x = curx - xx;
  y = cury - yy;

  /* atan only returns -90 to +90, so figure out how to use */
  /* the atan() value */

  if (x == 0) {      /* x is zero, we either move due north or south */
    if (yy > cury)
      d = 90;        /* north */
    else
      d = 270;       /* south */
  } else {
    if (yy < cury) {
      if (xx > curx)
        d = 360 + atan((scale * y) / x);  /* south-east, quadrant 4 */
      else
        d = 180 + atan((scale * y) / x);  /* south-west, quadrant 3 */ 
    } else {
      if (xx > curx)
        d = atan((scale * y) / x);        /* north-east, quadrant 1 */
      else
        d = 180 + atan((scale * y) / x);  /* north-west, quadrant 2 */
    }
  }
  return (d);
}

