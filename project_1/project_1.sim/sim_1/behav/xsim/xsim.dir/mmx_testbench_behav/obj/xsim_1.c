/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_2371(char*, char *);
IKI_DLLESPEC extern void execute_2372(char*, char *);
IKI_DLLESPEC extern void execute_2368(char*, char *);
IKI_DLLESPEC extern void execute_2369(char*, char *);
IKI_DLLESPEC extern void execute_2370(char*, char *);
IKI_DLLESPEC extern void execute_20(char*, char *);
IKI_DLLESPEC extern void execute_2365(char*, char *);
IKI_DLLESPEC extern void execute_2366(char*, char *);
IKI_DLLESPEC extern void execute_2367(char*, char *);
IKI_DLLESPEC extern void execute_48(char*, char *);
IKI_DLLESPEC extern void execute_25(char*, char *);
IKI_DLLESPEC extern void execute_26(char*, char *);
IKI_DLLESPEC extern void execute_657(char*, char *);
IKI_DLLESPEC extern void execute_658(char*, char *);
IKI_DLLESPEC extern void execute_685(char*, char *);
IKI_DLLESPEC extern void execute_950(char*, char *);
IKI_DLLESPEC extern void execute_1141(char*, char *);
IKI_DLLESPEC extern void execute_1392(char*, char *);
IKI_DLLESPEC extern void execute_1558(char*, char *);
IKI_DLLESPEC extern void execute_1752(char*, char *);
IKI_DLLESPEC extern void execute_1946(char*, char *);
IKI_DLLESPEC extern void execute_2140(char*, char *);
IKI_DLLESPEC extern void execute_2336(char*, char *);
IKI_DLLESPEC extern void execute_2353(char*, char *);
IKI_DLLESPEC extern void execute_2362(char*, char *);
IKI_DLLESPEC extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[27] = {(funcp)execute_2371, (funcp)execute_2372, (funcp)execute_2368, (funcp)execute_2369, (funcp)execute_2370, (funcp)execute_20, (funcp)execute_2365, (funcp)execute_2366, (funcp)execute_2367, (funcp)execute_48, (funcp)execute_25, (funcp)execute_26, (funcp)execute_657, (funcp)execute_658, (funcp)execute_685, (funcp)execute_950, (funcp)execute_1141, (funcp)execute_1392, (funcp)execute_1558, (funcp)execute_1752, (funcp)execute_1946, (funcp)execute_2140, (funcp)execute_2336, (funcp)execute_2353, (funcp)execute_2362, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 27;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/mmx_testbench_behav/xsim.reloc",  (void **)funcTab, 27);
	iki_vhdl_file_variable_register(dp + 97376);
	iki_vhdl_file_variable_register(dp + 97432);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/mmx_testbench_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/mmx_testbench_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/mmx_testbench_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/mmx_testbench_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/mmx_testbench_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
