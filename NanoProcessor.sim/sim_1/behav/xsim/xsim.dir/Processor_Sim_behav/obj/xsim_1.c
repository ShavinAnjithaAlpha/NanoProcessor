/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


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
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


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
extern void execute_379(char*, char *);
extern void execute_380(char*, char *);
extern void execute_54(char*, char *);
extern void execute_107(char*, char *);
extern void execute_110(char*, char *);
extern void execute_318(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_21(char*, char *);
extern void execute_24(char*, char *);
extern void execute_37(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_56(char*, char *);
extern void execute_58(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_73(char*, char *);
extern void execute_75(char*, char *);
extern void execute_92(char*, char *);
extern void execute_90(char*, char *);
extern void execute_91(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_94(char*, char *);
extern void execute_109(char*, char *);
extern void execute_179(char*, char *);
extern void execute_317(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_156(char*, char *);
extern void execute_159(char*, char *);
extern void execute_162(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_120(char*, char *);
extern void execute_153(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_178(char*, char *);
extern void execute_167(char*, char *);
extern void execute_168(char*, char *);
extern void execute_182(char*, char *);
extern void execute_190(char*, char *);
extern void execute_191(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_194(char*, char *);
extern void execute_306(char*, char *);
extern void execute_196(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_199(char*, char *);
extern void execute_308(char*, char *);
extern void execute_311(char*, char *);
extern void execute_314(char*, char *);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_7(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[70] = {(funcp)execute_379, (funcp)execute_380, (funcp)execute_54, (funcp)execute_107, (funcp)execute_110, (funcp)execute_318, (funcp)execute_15, (funcp)execute_16, (funcp)execute_21, (funcp)execute_24, (funcp)execute_37, (funcp)execute_32, (funcp)execute_33, (funcp)execute_56, (funcp)execute_58, (funcp)execute_62, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_73, (funcp)execute_75, (funcp)execute_92, (funcp)execute_90, (funcp)execute_91, (funcp)execute_81, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)execute_94, (funcp)execute_109, (funcp)execute_179, (funcp)execute_317, (funcp)execute_113, (funcp)execute_114, (funcp)execute_156, (funcp)execute_159, (funcp)execute_162, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_120, (funcp)execute_153, (funcp)execute_154, (funcp)execute_155, (funcp)execute_178, (funcp)execute_167, (funcp)execute_168, (funcp)execute_182, (funcp)execute_190, (funcp)execute_191, (funcp)execute_192, (funcp)execute_193, (funcp)execute_194, (funcp)execute_306, (funcp)execute_196, (funcp)execute_197, (funcp)execute_198, (funcp)execute_199, (funcp)execute_308, (funcp)execute_311, (funcp)execute_314, (funcp)transaction_1, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_7};
const int NumRelocateId= 70;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Processor_Sim_behav/xsim.reloc",  (void **)funcTab, 70);
	iki_vhdl_file_variable_register(dp + 39600);
	iki_vhdl_file_variable_register(dp + 39656);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Processor_Sim_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Processor_Sim_behav/xsim.reloc");
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
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Processor_Sim_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Processor_Sim_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Processor_Sim_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
