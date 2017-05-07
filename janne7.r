int v_damage, l_speed, from_edge_sv, from_edge_ne, deg, area, count, targ, mcomp, d, candist,quit;



main()
{
/*v_damage=22;l_speed=30;area=15;count=11;targ=27;mcomp=0;candist=700;*  75% dude*/
/*v_damage=40;l_speed=80;from_edge_sv=90;from_edge_ne=910;area=15;count=12;targ=28;mcomp=-1;candist=740; 66% dudepro.r*/
/*area=8;count=10;targ=27;mcomp=0;candist=740;      47 vinster*/


v_damage=40;
l_speed=80;
from_edge_sv=90;
from_edge_ne=910;
area=15;
count=12;
targ=28;
mcomp=-1;
candist=740;
quit=0;
while(1){s();v();n();o();}
}

s()
{
drive(265,100);
/*deg=180;*/
  while (loc_y() > from_edge_sv){
    d=scan(deg,area);
    if (d > v_damage && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg > 250) deg=100; else deg+=count;
    if (speed() < l_speed) drive(265,100);
    }
 }
 
v()
{
drive(175,100);
/*deg=10;*/
 while (loc_x() > from_edge_sv){
    d=scan(deg,area);
    if (d > v_damage && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg > 160) deg=10; else deg+=count;
    if (speed() < l_speed) drive(175,100);
    }
}

n()
{
drive(85,100);
/*deg=280;*/
 while (loc_y() < from_edge_ne){
    d=scan(deg,area);
    if (d > v_damage && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg > 440) deg=280; else deg+=count;
    if (speed() < l_speed) drive(85,100);
    }
}

o()
{
drive(355,100);
/*deg=190;*/
 while (loc_x() < from_edge_ne){
    d=scan(deg,area);
    if (d > v_damage && d < candist) {cannon(deg-mcomp,d);deg-=targ;}
    if (deg > 340) deg=190; else deg+=count;
    if (speed() < l_speed) drive(355,100);

    }

}

