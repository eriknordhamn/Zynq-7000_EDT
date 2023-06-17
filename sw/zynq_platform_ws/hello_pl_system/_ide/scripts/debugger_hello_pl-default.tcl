# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/hello_pl_system/_ide/scripts/debugger_hello_pl-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/hello_pl_system/_ide/scripts/debugger_hello_pl-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AD6564A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AD6564A-23727093-0"}
fpga -file /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/hello_pl/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/zynq_edt/export/zynq_edt/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/hello_pl/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/erik/Development/repo/Zynq-7000_EDT/sw/zynq_platform_ws/hello_pl/Debug/hello_pl.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
