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
IKI_DLLESPEC extern void execute_2327(char*, char *);
IKI_DLLESPEC extern void execute_2328(char*, char *);
IKI_DLLESPEC extern void execute_2324(char*, char *);
IKI_DLLESPEC extern void execute_2325(char*, char *);
IKI_DLLESPEC extern void execute_2326(char*, char *);
IKI_DLLESPEC extern void execute_46(char*, char *);
IKI_DLLESPEC extern void execute_23(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_862(char*, char *);
IKI_DLLESPEC extern void execute_863(char*, char *);
IKI_DLLESPEC extern void execute_918(char*, char *);
IKI_DLLESPEC extern void execute_919(char*, char *);
IKI_DLLESPEC extern void execute_1294(char*, char *);
IKI_DLLESPEC extern void execute_1295(char*, char *);
IKI_DLLESPEC extern void execute_1350(char*, char *);
IKI_DLLESPEC extern void execute_1351(char*, char *);
IKI_DLLESPEC extern void execute_1520(char*, char *);
IKI_DLLESPEC extern void execute_1714(char*, char *);
IKI_DLLESPEC extern void execute_1908(char*, char *);
IKI_DLLESPEC extern void execute_2102(char*, char *);
IKI_DLLESPEC extern void execute_2295(char*, char *);
IKI_DLLESPEC extern void execute_2312(char*, char *);
IKI_DLLESPEC extern void execute_2321(char*, char *);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[24] = {(funcp)execute_2327, (funcp)execute_2328, (funcp)execute_2324, (funcp)execute_2325, (funcp)execute_2326, (funcp)execute_46, (funcp)execute_23, (funcp)execute_24, (funcp)execute_862, (funcp)execute_863, (funcp)execute_918, (funcp)execute_919, (funcp)execute_1294, (funcp)execute_1295, (funcp)execute_1350, (funcp)execute_1351, (funcp)execute_1520, (funcp)execute_1714, (funcp)execute_1908, (funcp)execute_2102, (funcp)execute_2295, (funcp)execute_2312, (funcp)execute_2321, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 24;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/mmx_operations_tb_behav/xsim.reloc",  (void **)funcTab, 24);
	iki_vhdl_file_variable_register(dp + 90992);
	iki_vhdl_file_variable_register(dp + 91048);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/mmx_operations_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/mmx_operations_tb_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/mmx_operations_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/mmx_operations_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/mmx_operations_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
