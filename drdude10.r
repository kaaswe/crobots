int deg, rng, cnt;
main()
{
	while(1)
	{
	 	while(rng=scan(deg,15))
	 	{
			cannon(deg,rng);
			drive(deg,100);
			deg-=10;
			cnt=0;
		}
		cnt++;
		if (cnt>=2)
		{
			if (loc_x()<500) 
				{if (loc_y()<500) drive(45,100); else drive(315,100);}
		 	else
				{if (loc_y()<500) drive(135,100); else drive(225,100);}
		}
	  	deg+=10;
	  	if (deg>=1400) deg-=1400;
	}
}
