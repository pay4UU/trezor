#!/usr/bin/awk -f
BEGIN {

for (i = 5; i < 15; i++) 
{
	print i "!"
	for (j = 3; j < 4; j++) 
	{
	gfmt=sprintf("%d.%dG", i, j)
	print gfmt 
    printf("%" gfmt "\t", 23^5);
	}
	printf("\n")
	}
}
