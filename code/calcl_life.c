#include <OpenCAL-CL/calcl2D.h>
#include <OpenCAL/cal2DIO.h>

#define KERNEL_SRC "./kernel"
#define KERNEL_LIFE_TRANSITION_FUNCTION "lifeTransitionFunction"
#define PLATFORM_NUM 0
#define DEVICE_NUM 0
#define DEVICE_Q 0

int main()
{
  struct CALCLDeviceManager* calcl_device_manager = calclCreateManager();
  calclPrintPlatformsAndDevices(calcl_device_manager);
  CALCLdevice device = calclGetDevice(calcl_device_manager, PLATFORM_NUM, DEVICE_NUM);
  CALCLcontext context = calclCreateContext(&device);
  CALCLprogram program = calclLoadProgram2D(context, device, KERNEL_SRC, NULL);

  struct CALModel2D* host_CA = calCADef2D(8, 16, CAL_MOORE_NEIGHBORHOOD_2D, CAL_SPACE_TOROIDAL, CAL_NO_OPT);
  struct CALSubstate2Di* Q;

  Q = calAddSubstate2Di(host_CA);

  calInitSubstate2Di(host_CA, Q, 0);
  calInit2Di(host_CA, Q, 0, 2, 1);
  calInit2Di(host_CA, Q, 1, 0, 1);
  calInit2Di(host_CA, Q, 1, 2, 1);
  calInit2Di(host_CA, Q, 2, 1, 1);
  calInit2Di(host_CA, Q, 2, 2, 1);

  struct CALCLModel2D* device_CA = calclCADef2D(host_CA, context, program, device);
  
  CALCLkernel kernel_life_transition_function = calclGetKernelFromProgram(&program, KERNEL_LIFE_TRANSITION_FUNCTION);
  calclAddElementaryProcess2D(device_CA, &kernel_life_transition_function);

  calSaveSubstate2Di(host_CA, Q, "./life_0000.txt");

  calclRun2D(device_CA, 1, 1);

  calSaveSubstate2Di(host_CA, Q, "./life_LAST.txt");

  calclFinalizeManager(calcl_device_manager);
  calclFinalize2D(device_CA);
  calFinalize2D(host_CA);

  return 0;
}
