int deg,range,ang;
main ()
{
	while (1)
	{
	  while (range=scan(deg,15))
	  {
	    if (range<200) ang=180;
	    cannon(deg,range);
	    drive(deg+ang,100);
	    ang=0;
	    deg-=10;
	  }
	  deg+=10;
	  if (deg>=3600) deg-=3600;
	}
}
