#include <OpenCAL/cal2D.h>
#include <OpenCAL/cal2DIO.h>
#include <OpenCAL/cal2DRun.h>
#include <stdlib.h>

struct CALModel2D* life;
struct CALSubstate2Di* Q;
struct CALRun2D* life_simulation;

void lifeTransitionFunction(struct CALModel2D* life, int i, int j)
{
  int sum = 0, n;
  for (n=1; n<life->sizeof_X; n++)
    sum += calGetX2Di(life, Q, i, j, n);

  if ((sum == 3) || (sum == 2 && calGet2Di(life, Q, i, j) == 1))
    calSet2Di(life, Q, i, j, 1);
  else
    calSet2Di(life, Q, i, j, 0);
}

int main()
{
  life = calCADef2D(8, 16, CAL_MOORE_NEIGHBORHOOD_2D, CAL_SPACE_TOROIDAL, CAL_NO_OPT);
  life_simulation = calRunDef2D(life, 1, 1, CAL_UPDATE_IMPLICIT);

  Q = calAddSubstate2Di(life);

  calAddElementaryProcess2D(life, lifeTransitionFunction);

  calInitSubstate2Di(life, Q, 0);
  calInit2Di(life, Q, 0, 2, 1);
  calInit2Di(life, Q, 1, 0, 1);
  calInit2Di(life, Q, 1, 2, 1);
  calInit2Di(life, Q, 2, 1, 1);
  calInit2Di(life, Q, 2, 2, 1);

  calSaveSubstate2Di(life, Q, "./life_0000.txt");

  calRun2D(life_simulation);

  calSaveSubstate2Di(life, Q, "./life_LAST.txt");

  calRunFinalize2D(life_simulation);
  calFinalize2D(life);

  return 0;
}
