/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001061635037_4205968809_init();
    xilinxcorelib_ver_m_00000000001358910285_1636202929_init();
    xilinxcorelib_ver_m_00000000001687936702_2559047490_init();
    xilinxcorelib_ver_m_00000000000277421008_1505607736_init();
    xilinxcorelib_ver_m_00000000001603977570_2659733415_init();
    work_m_00000000003289761879_1696802418_init();
    work_m_00000000002612584548_0996092483_init();
    work_m_00000000001756395465_2616614556_init();
    work_m_00000000001088057041_0590806652_init();
    work_m_00000000002973164099_1482239620_init();
    work_m_00000000001422748610_0156795870_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001422748610_0156795870");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
