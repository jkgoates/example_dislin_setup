#include <stdio.h>
#include "dislin.h"

#define N 18

main()
{ double xwray[N],ywray[N];
  int  i;
  char cbuf[80];

  double xray[N]  = {1., 3., 8., 1.5, 9., 6.3, 5.8, 2.3, 8.1, 3.5,
                    2.2, 8.7, 9.2, 4.8, 3.4, 6.9, 7.5, 3.8};
  double yray[N]  = {5., 8., 3.5, 2., 7., 1.,4.3, 7.2, 6.0, 8.5,
                    4.1, 5.0, 7.3, 2.8, 1.6, 8.9, 9.5, 3.2};
  double z1ray[N] = {0., 0., 0., 0., 0., 0., 0., 0., 0., 0.,
                    0., 0., 0., 0., 0., 0., 0., 0.};
  double z2ray[N] = {4., 5., 3., 2., 3.5, 4.5, 2., 1.6, 3.8, 4.7,
                    2.1, 3.5, 1.9, 4.2, 4.9, 2.8, 3.6, 4.3};
  int icray[N] = {30, 30, 30, 30, 30, 30, 100, 100, 100, 100,
                 100, 100, 170, 170, 170, 170, 170, 170};
  for (i = 0; i < N; i++)
  { xwray[i] = 0.5;
    ywray[i] = 0.5;
  } 

  scrmod ("revers");
  metafl ("xwin");
  setpag ("da4p");
  disini ();
  pagera ();
  hwfont ();
  axspos (200, 2600);
  axslen (1800, 1800);

  name ("X-axis", "x");
  name ("Y-axis", "y");
  name ("Z-axis", "z");

  titlin ("3-D Bars / BARS3D",3);
  labl3d ("hori");

  graf3d (0.,10.,0.,2.,0.,10.,0.,2.,0.,5.,0.,1.);
  grid3d (1,1, "bottom");
  bars3d (xray, yray, z1ray, z2ray, xwray, ywray, icray, N);

  legini (cbuf, 3, 20);
  legtit (" ");
  legpos (1350, 1150);
  leglin (cbuf, "First", 1);
  leglin (cbuf, "Second", 2);
  leglin (cbuf, "Third", 3);
  legend (cbuf, 3);

  height (50);
  title ();
  disfin ();
} 
