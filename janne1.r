int d, x, y, count, head, deg, dam;
int corner;           /* current corner 0, 1, 2, or 2 */
int c1x, c1y;         /* corner 1 x and y */
int c2x, c2y;         /*   "    2 "  "  " */
int c3x, c3y;         /*   "    3 "  "  " */
int c4x, c4y;         /*   "    4 "  "  " */
int s1, s2, s3, s4;   /* starting scan position for corner 1 - 4 */
int sc;               /* current scan start */
int d;                /* last damage check */

main()
{
  c1x = 10;  c1y = 10;  s1 = 0;
  c2x = 10;  c2y = 990; s2 = 270;
  c3x = 990; c3y = 990; s3 = 180;
  c4x = 990; c4y = 10;  s4 = 90;
  closest = 9999;

first();
drive(0,0);
while(1) {radar(); move();}
}


pos()
{
x=loc_x();
y=loc_y();

if (x>=800) {
  head=1;
  }
if (x>=950) {
  drive(180,0);
  }

if (x<=200) {
  head=2;
  }
if (x<=50) {
  drive(360,0);
  }

}

move()
{
pos();
if (head==1) {
  drive(180,100);
  }
if (head==2) {
  drive(360,100);
  }
}

radar()
{
d=20;

while(d<40 || d>700){
    if (deg<=160){
      deg+=10;
    } else {
      deg=20;
    }
  d=scan(deg,10);
  }
attac();
}

attac()
{

d=scan(deg,10);
cannon(deg,d);
d=0;count=0;deg=deg-10;
while(d<40 || count < 20) {
  d=scan(deg,2);count+=2;
  }
  cannon(deg,d);
}


attac1()
{
dam = damage();
while (d>40) {
  d=scan(deg-5,5);
  if (d>40 && d<700) {
    if (head==1) {cannon(deg-5,d-speed());} else {cannon(deg-5,d+speed());}
  } else {d=0;}
  d=scan(deg+5,5);
  if (d>40 && d<700) {
    if (head==1) {cannon(deg+5,d-speed());} else {cannon(deg+5,d+speed());}
  } else {d=0;}

  if (dam != damage() || loc_x()>=900 || loc_x()<=100) {
    d=0;drive(0,0);
    }
  
  d=scan(deg-10,5);
  if (d>40 && d<700) {
    cannon(deg-10,d-speed());
    } else {d=0;}
  d=scan(deg+10,5);
  if (d>40 && d<700) {
    cannon(deg+10,d-speed());
    } else {d=0;}

  if (dam != damage() || loc_x()>=900 || loc_x()<=100) {
    d=0;drive(0,0);
    }
  }
}

/* one time only */


first()
{
  int x, y;
  int angle;

    x = c1x; 
    y = c1y; 
    sc = s1;
  
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

