int hdev, area, scan_area_count, sa, v_damage, h_speed, l_speed, s_wall, n_wall, deg, targ, mcomp, enemy, candist;
int s1, s2, s3, s4; /* scan starting points */

main()
{
/* v_damage=22;l_speed=30;area=15;count=11;targ=27;mcomp=0;candist=700;*  75% dude */
/* v_damage=40;l_speed=80;from_edge_sv=90;from_edge_ne=910;area=15;count=12;targ=28;mcomp=-1;candist=740; 66% dudepro.r */
/* area=8;count=10;targ=27;mcomp=0;candist=740;      47 vinster */

/*     135    90   45      */
/*         \  |  /         */
/*          \ | /          */
/*    180 --- x --- 0      */
/*          / | \          */
/*         /  |  \         */
/*     225   270   315     */

s1=0;
s2=270;
s3=180;
s4=90;

h_speed=100;			/* the speed the bot will have */
sa=120;					/* Scan area, how wide is the scanner */
scan_area_count=9;		/* jump the scanner */
area=10;			    /* scanner size */
v_damage=40;			/* minimum firering distance, default 40m */
hdev=15;					/* heading deviation */
l_speed=70;
s_wall=350;
n_wall=650;

targ=25; /* while in target range, back the scanner deg this amount to start over */
mcomp=3;
candist=740;
deg=90;
while(1){s();v();n();o();}
}

s()
{
drive(s2-hdev,h_speed);
/* deg=s3; */
  while (loc_y() > s_wall){
    enemy=scan(deg,area);
    if (enemy > v_damage && enemy < candist) {cannon(deg-mcomp,enemy);deg-=targ+scan_area_count;}
    if (deg > s3+sa) deg=s3; else deg+=scan_area_count;
	drive(s2-hdev,h_speed);
    }
 }
 
v()
{
drive(s3-hdev,h_speed);
/* deg=s4; */
 while (loc_x() > s_wall){
    enemy=scan(deg,area);
    if (enemy > v_damage && enemy < candist) {cannon(deg-mcomp,enemy);deg-=targ+scan_area_count;}
    if (deg > s4+sa) deg=s4; else deg+=scan_area_count;
    drive(s3-hdev,h_speed);
    }
}

n()
{
drive(s4-hdev,h_speed);
/* deg=s1; */
 while (loc_y() < n_wall){
    enemy=scan(deg,area);
    if (enemy > v_damage && enemy < candist) {cannon(deg-mcomp,enemy);deg-=targ+scan_area_count;}
    if (deg > s1+sa) deg=s1; else deg+=scan_area_count;
    drive(s4-hdev,h_speed);
    }
}

o()
{
drive(s1-hdev,h_speed);
/* deg=s2; */
 while (loc_x() < n_wall){
    enemy=scan(deg,area);
    if (enemy > v_damage && enemy < candist) {cannon(deg-mcomp,enemy);deg-=targ+scan_area_count;}
    if (deg > s2+sa) deg=s2-scan_area; else deg+=scan_area_count;
    drive(s1-hdev,h_speed);
    }
}

