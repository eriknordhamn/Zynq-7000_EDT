# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/zynq_edt/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/zynq_edt/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zynq_edt}\
-hw {/home/erik/Development/repo/Zynq-7000_EDT/hw/edt_zybo_z7_20/system_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {/home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws}

platform write
platform generate -domains 
platform active {zynq_edt}
platform generate
