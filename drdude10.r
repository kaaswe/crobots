int deg, range;
main ()
{
	while (1)
	{
	  while (range=scan(deg,15))
	  {
	    drive(deg,100);
	    cannon(deg,range);
	    deg-=10;
	  }
	  deg+=10;
	  if (deg>=1400) deg-=1400;
	}
}
