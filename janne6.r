int deg, area, count, targ, mcomp, d, candist,quit;



main()
{
/*area=8;count=10;targ=32;mcomp=3;candist=740;*/
/*area=8;count=10;targ=27;mcomp=0;candist=740;      47 vinster*/
area=8;count=10;targ=27;mcomp=0;candist=740;quit=0;
while(1){s();v();n();o();}
}

s()
{
drive(265,100);
/*deg=100;*/
  while (loc_y() > 150){
    d=scan(deg,area);
    if (d > 40 && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg>250) deg=100; else deg+=count;
    if (speed()<30) drive(265,100);
    }
 }
 
v()
{
drive(175,100);
/*deg=10;*/
 while (loc_x() > 150){
    d=scan(deg,area);
    if (d > 40 && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg>160) deg=10; else deg+=count;
    if (speed()<30) drive(175,100);
    }
}

n()
{
drive(85,100);
/*deg=280;*/
 while (loc_y() < 850){
    d=scan(deg,area);
    if (d > 40 && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg>440) deg=280; else deg+=count;
    if (speed()<30) drive(85,100);
    }
}

o()
{
drive(355,100);
/*deg=190;*/
 while (loc_x() < 850){
    d=scan(deg,area);
    if (d > 40 && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg>340) deg=190; else deg+=count;
    if (speed()<30) drive(355,100);

    }

}

