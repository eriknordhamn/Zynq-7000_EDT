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
platform active {zynq_edt}
domain create -name {linux_domain} -os {linux} -proc {ps7_cortexa9} -arch {32-bit} -display-name {linux_domain} -desc {} -runtime {cpp}
platform write
domain config -image {}
domain -report -json
platform write
platform generate
platform active {zynq_edt}
platform config -updatehw {/home/erik/Development/repo/Zynq-7000_EDT/hw/edt_zybo_z7_20/system_wrapper.xsa}
platform config -updatehw {/home/erik/Development/repo/Zynq-7000_EDT/hw/edt_zybo_z7_20/system_wrapper.xsa}
platform generate
domain active {zynq_fsbl}
bsp reload
platform active {zynq_edt}
platform generate -domains 
