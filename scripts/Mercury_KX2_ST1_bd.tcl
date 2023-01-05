# ----------------------------------------------------------------------------------
# Copyright (c) 2022 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

create_bd_design $module


create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze microblaze_CPU
set_property -dict [ list \
  CONFIG.C_D_AXI {1} \
  CONFIG.C_DCACHE_ADDR_TAG {17} \
] [get_bd_cells microblaze_CPU]

create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10 dlmb_v10

create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10 ilmb_v10

create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr dlmb_bram_if_cntlr

create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr ilmb_bram_if_cntlr

create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen lmb_bram
set_property -dict [ list \
  CONFIG.Memory_Type {True_Dual_Port_RAM} \
  CONFIG.Enable_B {Use_ENB_Pin} \
  CONFIG.Use_RSTB_Pin {true} \
  CONFIG.Port_B_Clock {100} \
  CONFIG.Port_B_Write_Rate {50} \
  CONFIG.Port_B_Enable_Rate {100} \
] [get_bd_cells lmb_bram]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer axi_timer

create_bd_cell -type ip -vlnv xilinx.com:ip:mdm mdm_0
set_property -dict [ list \
  CONFIG.C_USE_UART {1} \
] [get_bd_cells mdm_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc microblaze_axi_intc
set_property -dict [ list \
  CONFIG.C_HAS_FAST {1} \
  CONFIG.C_DISABLE_SYNCHRONIZERS {1} \
] [get_bd_cells microblaze_axi_intc]

create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz xadc_wiz
set_property -dict [ list \
  CONFIG.CHANNEL_ENABLE_VP_VN {false} \
  CONFIG.ENABLE_TEMP_BUS {true} \
] [get_bd_cells xadc_wiz]
set_property -dict [ list \
  CONFIG.C_USE_ICACHE {1} \
  CONFIG.C_USE_DCACHE {1} \
] [get_bd_cells microblaze_CPU]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat microblaze_xlconcat
set_property -dict [ list \
  CONFIG.NUM_PORTS {7} \
] [get_bd_cells microblaze_xlconcat]

if { $ETH == "ETH"} {
  set_property -dict [ list \
    CONFIG.NUM_PORTS {11} \
  ] [get_bd_cells microblaze_xlconcat]
}

if { $ETH == "ETH"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma axi_dma
  set_property -dict [ list \
    CONFIG.c_sg_length_width {16} \
    CONFIG.c_include_mm2s_dre {1} \
    CONFIG.c_sg_use_stsapp_length {1} \
    CONFIG.c_include_s2mm_dre {1} \
  ] [get_bd_cells axi_dma]
}

if { $ETH == "ETH"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz
  set_property -dict [ list \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125.000} \
    CONFIG.USE_LOCKED {false} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.000} \
    CONFIG.CLKOUT1_JITTER {125.247} \
  ] [get_bd_cells clk_wiz]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic IIC_FPGA

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic IIC

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio LED
set_property -dict [ list \
  CONFIG.C_GPIO_WIDTH {4} \
  CONFIG.C_ALL_OUTPUTS {1} \
  CONFIG.C_DOUT_DEFAULT {0x00000FF} \
] [get_bd_cells LED]

create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series SDRAM

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset ps_sys_rst
set_property -dict [ list \
  CONFIG.C_AUX_RESET_HIGH {0} \
] [get_bd_cells ps_sys_rst]

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset mem_sys_rst
set_property -dict [ list \
  CONFIG.C_AUX_RESET_HIGH {0} \
] [get_bd_cells mem_sys_rst]

if { $PL_DDR == "PL_DDR_FBG160"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_160FBG.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "PL_DDR_FBG160"} {
  set_property -dict [ list \
    CONFIG.XML_INPUT_FILE {mig_160FBG.prj} \
  ] [get_bd_cells SDRAM]
}

if { $PL_DDR == "PL_DDR_FFG160"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_160FFG.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "PL_DDR_FFG160"} {
  set_property -dict [ list \
    CONFIG.XML_INPUT_FILE {mig_160FFG.prj} \
  ] [get_bd_cells SDRAM]
}

if { $PL_DDR == "PL_DDR_FFG325"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_325FFG.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "PL_DDR_FFG325"} {
  set_property -dict [ list \
    CONFIG.XML_INPUT_FILE {mig_325FFG.prj} \
  ] [get_bd_cells SDRAM]
}

if { $PL_DDR == "PL_DDR_FFG410"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_410FFG.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "PL_DDR_FFG410"} {
  set_property -dict [ list \
    CONFIG.XML_INPUT_FILE {mig_410FFG.prj} \
  ] [get_bd_cells SDRAM]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_DDR
set_property -dict [ list \
  CONFIG.NUM_CLKS {2} \
] [get_bd_cells smartconnect_DDR]

if { $ETH == "ETH"} {
  set_property -dict [ list \
    CONFIG.NUM_SI {5} \
  ] [get_bd_cells smartconnect_DDR]
}

if { $ETH == "ETH"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet axi_ethernet
  set_property -dict [ list \
    CONFIG.PHY_TYPE {RGMII} \
  ] [get_bd_cells axi_ethernet]
}

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi QSPI
set_property -dict [ list \
  CONFIG.C_SCK_RATIO {2} \
  CONFIG.C_SPI_MODE {2} \
  CONFIG.C_SPI_MEMORY {3} \
  CONFIG.C_FIFO_DEPTH {256} \
  CONFIG.C_TYPE_OF_AXI4_INTERFACE {1} \
] [get_bd_cells QSPI]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite UART
set_property -dict [ list \
  CONFIG.C_BAUDRATE {115200} \
] [get_bd_cells UART]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite UART_FTDI_KX2
set_property -dict [ list \
  CONFIG.C_BAUDRATE {115200} \
] [get_bd_cells UART_FTDI_KX2]

create_bd_cell -type hier CPU
move_bd_cells [get_bd_cells CPU] [get_bd_cells microblaze_CPU]
move_bd_cells [get_bd_cells CPU] [get_bd_cells mdm_0]
move_bd_cells [get_bd_cells CPU] [get_bd_cells microblaze_axi_intc]
connect_bd_intf_net [get_bd_intf_pins CPU/mdm_0/MBDEBUG_0] [get_bd_intf_pins CPU/microblaze_CPU/DEBUG]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_axi_intc/interrupt] [get_bd_intf_pins CPU/microblaze_CPU/INTERRUPT]
connect_bd_net [get_bd_pins CPU/microblaze_axi_intc/processor_clk] [get_bd_pins CPU/microblaze_CPU/Clk]
connect_bd_net [get_bd_pins CPU/microblaze_axi_intc/processor_rst] [get_bd_pins CPU/microblaze_CPU/Reset]
create_bd_cell -type hier CPU/microblaze_local_memory
move_bd_cells [get_bd_cells CPU/microblaze_local_memory] [get_bd_cells dlmb_v10]
move_bd_cells [get_bd_cells CPU/microblaze_local_memory] [get_bd_cells ilmb_v10]
move_bd_cells [get_bd_cells CPU/microblaze_local_memory] [get_bd_cells dlmb_bram_if_cntlr]
move_bd_cells [get_bd_cells CPU/microblaze_local_memory] [get_bd_cells ilmb_bram_if_cntlr]
move_bd_cells [get_bd_cells CPU/microblaze_local_memory] [get_bd_cells lmb_bram]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins CPU/microblaze_local_memory/lmb_bram/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins CPU/microblaze_local_memory/lmb_bram/BRAM_PORTB]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_local_memory/dlmb_v10/LMB_Sl_0] [get_bd_intf_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/SLMB]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_local_memory/ilmb_v10/LMB_Sl_0] [get_bd_intf_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/SLMB]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/LMB_Rst]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/ilmb_v10/SYS_Rst] [get_bd_pins CPU/microblaze_local_memory/dlmb_v10/SYS_Rst]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/dlmb_v10/SYS_Rst] [get_bd_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/LMB_Rst]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/LMB_Clk]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/dlmb_v10/LMB_Clk] [get_bd_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/LMB_Clk]
connect_bd_net [get_bd_pins CPU/microblaze_local_memory/ilmb_v10/LMB_Clk] [get_bd_pins CPU/microblaze_local_memory/dlmb_bram_if_cntlr/LMB_Clk]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/DLMB] [get_bd_intf_pins CPU/microblaze_local_memory/dlmb_v10/LMB_M]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/ILMB] [get_bd_intf_pins CPU/microblaze_local_memory/ilmb_v10/LMB_M]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins CPU/microblaze_local_memory/dlmb_v10/LMB_Clk]
connect_bd_net [get_bd_pins microblaze_xlconcat/dout] [get_bd_pins CPU/microblaze_axi_intc/intr]
connect_bd_net [get_bd_pins microblaze_xlconcat/In0] [get_bd_pins CPU/mdm_0/Interrupt]
connect_bd_net [get_bd_pins microblaze_xlconcat/In1] [get_bd_pins axi_timer/interrupt]
connect_bd_net [get_bd_pins microblaze_xlconcat/In2] [get_bd_pins UART/interrupt]
connect_bd_net [get_bd_pins microblaze_xlconcat/In4] [get_bd_pins xadc_wiz/ip2intc_irpt]
create_bd_port -dir O MDIO_mdc
create_bd_port -dir I MDIO_mdio_i
create_bd_port -dir O MDIO_mdio_o
create_bd_port -dir O MDIO_mdio_t
create_bd_port -dir I -from 3 -to 0 RGMII_rd
create_bd_port -dir I RGMII_rx_ctl
create_bd_port -dir I RGMII_rxc
create_bd_port -dir O -from 3 -to 0 RGMII_td
create_bd_port -dir O RGMII_tx_ctl
create_bd_port -dir O RGMII_txc
connect_bd_net [get_bd_pins QSPI/ip2intc_irpt] [get_bd_pins microblaze_xlconcat/In5]
set IIC_FPGA [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_FPGA ]
connect_bd_intf_net [get_bd_intf_ports IIC_FPGA] [get_bd_intf_pins IIC_FPGA/IIC]
set IIC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC ]
connect_bd_intf_net [get_bd_intf_ports IIC] [get_bd_intf_pins IIC/IIC]
create_bd_cell -type hier Memory
move_bd_cells [get_bd_cells Memory] [get_bd_cells SDRAM]
move_bd_cells [get_bd_cells Memory] [get_bd_cells ps_sys_rst]
move_bd_cells [get_bd_cells Memory] [get_bd_cells mem_sys_rst]
create_bd_pin -dir O -type clk Memory/CLK50
create_bd_pin -dir O -type clk Memory/CLK100
create_bd_pin -dir O -type clk Memory/CLK200
connect_bd_net [get_bd_pins Memory/CLK50] [get_bd_pins Memory/SDRAM/ui_addn_clk_0]
connect_bd_net [get_bd_pins Memory/CLK100] [get_bd_pins Memory/SDRAM/ui_addn_clk_1]
connect_bd_net [get_bd_pins Memory/CLK200] [get_bd_pins Memory/SDRAM/ui_addn_clk_2]
create_bd_port -dir O -type clk CLK50
create_bd_port -dir O -type clk CLK100
create_bd_port -dir O -type clk CLK200
connect_bd_net [get_bd_pins Memory/CLK50] [get_bd_ports CLK50]
connect_bd_net [get_bd_pins Memory/CLK100] [get_bd_ports CLK100]
connect_bd_net [get_bd_pins Memory/CLK200] [get_bd_ports CLK200]
connect_bd_net [get_bd_pins Memory/SDRAM/device_temp_i] [get_bd_pins xadc_wiz/temp_out]
connect_bd_net [get_bd_pins Memory/CLK100] [get_bd_pins CPU/microblaze_CPU/Clk]
set SYS_CLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK ]
connect_bd_intf_net [get_bd_intf_ports SYS_CLK] [get_bd_intf_pins Memory/SDRAM/SYS_CLK]
create_bd_port -dir I -type rst SYS_RST_N
connect_bd_net [get_bd_ports SYS_RST_N] [get_bd_pins Memory/SDRAM/sys_rst]
set DDR3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3 ]
connect_bd_intf_net [get_bd_intf_ports DDR3] [get_bd_intf_pins Memory/SDRAM/DDR3]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/slowest_sync_clk] [get_bd_pins Memory/CLK100]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/ext_reset_in] [get_bd_pins Memory/SDRAM/ui_clk_sync_rst]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/dcm_locked] [get_bd_pins Memory/SDRAM/mmcm_locked]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/mb_debug_sys_rst] [get_bd_pins CPU/mdm_0/Debug_SYS_Rst]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/bus_struct_reset] [get_bd_pins CPU/microblaze_local_memory/ilmb_bram_if_cntlr/LMB_Rst]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/mb_reset] [get_bd_pins CPU/microblaze_CPU/Reset]
connect_bd_net [get_bd_pins Memory/mem_sys_rst/peripheral_aresetn] [get_bd_pins Memory/SDRAM/aresetn]
connect_bd_net [get_bd_pins Memory/mem_sys_rst/dcm_locked] [get_bd_pins Memory/SDRAM/mmcm_locked]
connect_bd_net [get_bd_pins Memory/mem_sys_rst/ext_reset_in] [get_bd_pins Memory/SDRAM/ui_clk_sync_rst]
connect_bd_net [get_bd_pins Memory/mem_sys_rst/slowest_sync_clk] [get_bd_pins Memory/SDRAM/ui_clk]

if { $PL_DDR == "PL_DDR_FBG160"} {
  set_property generic DDR3_ADDR_WIDTH=14 [current_fileset]
}

if { $PL_DDR == "PL_DDR_FFG160"} {
  set_property generic DDR3_ADDR_WIDTH=15 [current_fileset]
}

if { $PL_DDR == "PL_DDR_FFG325"} {
  set_property generic DDR3_ADDR_WIDTH=15 [current_fileset]
}

if { $PL_DDR == "PL_DDR_FFG410"} {
  set_property generic DDR3_ADDR_WIDTH=15 [current_fileset]
}
move_bd_cells [get_bd_cells Memory] [get_bd_cells smartconnect_DDR]
connect_bd_intf_net [get_bd_intf_pins Memory/smartconnect_DDR/M00_AXI] [get_bd_intf_pins Memory/SDRAM/S_AXI]
connect_bd_net [get_bd_pins Memory/smartconnect_DDR/aclk1] [get_bd_pins Memory/CLK100]
connect_bd_net [get_bd_pins Memory/smartconnect_DDR/aclk] [get_bd_pins Memory/SDRAM/ui_clk]
connect_bd_net [get_bd_pins Memory/CLK100] [get_bd_pins QSPI/ext_spi_clk]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/M_AXI_DC] [get_bd_intf_pins Memory/smartconnect_DDR/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/M_AXI_IC] [get_bd_intf_pins Memory/smartconnect_DDR/S01_AXI]
connect_bd_net [get_bd_pins Memory/mem_sys_rst/peripheral_aresetn] [get_bd_pins Memory/smartconnect_DDR/aresetn]

if { $ETH == "ETH"} {
  delete_bd_objs [get_bd_ports MDIO_mdc]
  delete_bd_objs [get_bd_ports MDIO_mdio_i]
  delete_bd_objs [get_bd_ports MDIO_mdio_o]
  delete_bd_objs [get_bd_ports MDIO_mdio_t]
  delete_bd_objs [get_bd_ports RGMII_rd]
  delete_bd_objs [get_bd_ports RGMII_rx_ctl]
  delete_bd_objs [get_bd_ports RGMII_rxc]
  delete_bd_objs [get_bd_ports RGMII_td]
  delete_bd_objs [get_bd_ports RGMII_tx_ctl]
  delete_bd_objs [get_bd_ports RGMII_txc]
  create_bd_cell -type hier Ethernet
  move_bd_cells [get_bd_cells Ethernet] [get_bd_cells axi_ethernet]
  move_bd_cells [get_bd_cells Ethernet] [get_bd_cells clk_wiz]
  move_bd_cells [get_bd_cells Ethernet] [get_bd_cells axi_dma]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_out1] [get_bd_pins Ethernet/axi_ethernet/gtx_clk]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_in1] [get_bd_pins Ethernet/axi_ethernet/axis_clk]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_in1] [get_bd_pins Ethernet/axi_dma/m_axi_sg_aclk]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_in1] [get_bd_pins Ethernet/axi_dma/m_axi_mm2s_aclk]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_in1] [get_bd_pins Ethernet/axi_dma/m_axi_s2mm_aclk]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/clk_in1] [get_bd_pins Memory/CLK100]
  connect_bd_net [get_bd_pins Ethernet/clk_wiz/reset] [get_bd_pins Memory/bus_struct_reset]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/ref_clk] [get_bd_pins Memory/CLK200]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/axi_txd_arstn] [get_bd_pins Ethernet/axi_dma/mm2s_prmry_reset_out_n]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/axi_txc_arstn] [get_bd_pins Ethernet/axi_dma/mm2s_cntrl_reset_out_n]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/axi_rxd_arstn] [get_bd_pins Ethernet/axi_dma/s2mm_prmry_reset_out_n]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/axi_rxs_arstn] [get_bd_pins Ethernet/axi_dma/s2mm_sts_reset_out_n]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_ethernet/s_axis_txc] [get_bd_intf_pins Ethernet/axi_dma/M_AXIS_CNTRL]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_ethernet/s_axis_txd] [get_bd_intf_pins Ethernet/axi_dma/M_AXIS_MM2S]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_ethernet/m_axis_rxd] [get_bd_intf_pins Ethernet/axi_dma/S_AXIS_S2MM]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_ethernet/m_axis_rxs] [get_bd_intf_pins Ethernet/axi_dma/S_AXIS_STS]
  set MDIO [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 MDIO ]
  connect_bd_intf_net [get_bd_intf_ports MDIO] [get_bd_intf_pins Ethernet/axi_ethernet/mdio]
  set RGMII [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 RGMII ]
  connect_bd_intf_net [get_bd_intf_ports RGMII] [get_bd_intf_pins Ethernet/axi_ethernet/rgmii]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_dma/M_AXI_SG] [get_bd_intf_pins Memory/smartconnect_DDR/S02_AXI]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_dma/M_AXI_MM2S] [get_bd_intf_pins Memory/smartconnect_DDR/S03_AXI]
  connect_bd_intf_net [get_bd_intf_pins Ethernet/axi_dma/M_AXI_S2MM] [get_bd_intf_pins Memory/smartconnect_DDR/S04_AXI]
  connect_bd_net [get_bd_pins Ethernet/axi_dma/mm2s_introut] [get_bd_pins microblaze_xlconcat/In7]
  connect_bd_net [get_bd_pins Ethernet/axi_dma/s2mm_introut] [get_bd_pins microblaze_xlconcat/In8]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/mac_irq] [get_bd_pins microblaze_xlconcat/In9]
  connect_bd_net [get_bd_pins Ethernet/axi_ethernet/interrupt] [get_bd_pins microblaze_xlconcat/In10]
}
set QSPI [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 QSPI ]
connect_bd_intf_net [get_bd_intf_ports QSPI] [get_bd_intf_pins QSPI/SPI_0]
set UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART ]
connect_bd_intf_net [get_bd_intf_ports UART] [get_bd_intf_pins UART/UART]
set UART_FTDI_KX2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART_FTDI_KX2 ]
connect_bd_intf_net [get_bd_intf_ports UART_FTDI_KX2] [get_bd_intf_pins UART_FTDI_KX2/UART]
connect_bd_net [get_bd_pins UART_FTDI_KX2/interrupt] [get_bd_pins microblaze_xlconcat/In6]

if { ( $ETH == "ETH" ) } {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect CPU/interconnect_CPU0
  set_property -dict [list CONFIG.NUM_MI {12} CONFIG.NUM_SI {1}] [get_bd_cells CPU/interconnect_CPU0]
  connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/M_AXI_DP] [get_bd_intf_pins CPU/interconnect_CPU0/S00_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/S00_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/S00_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M00_AXI ] [get_bd_intf_pins CPU/mdm_0/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M00_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M00_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M01_AXI ] [get_bd_intf_pins CPU/microblaze_axi_intc/s_axi]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M01_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M01_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M02_AXI ] [get_bd_intf_pins axi_timer/s_axi]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M02_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M02_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M03_AXI ] [get_bd_intf_pins xadc_wiz/S_AXI_LITE]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M03_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M03_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M04_AXI ] [get_bd_intf_pins Ethernet/axi_dma/S_AXI_LITE]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M04_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M04_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M05_AXI ] [get_bd_intf_pins IIC_FPGA/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M05_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M05_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M06_AXI ] [get_bd_intf_pins IIC/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M06_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M06_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M07_AXI ] [get_bd_intf_pins LED/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M07_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M07_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M08_AXI ] [get_bd_intf_pins Ethernet/axi_ethernet/s_axi]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M08_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M08_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M09_AXI ] [get_bd_intf_pins QSPI/AXI_FULL]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M09_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M09_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M10_AXI ] [get_bd_intf_pins UART/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M10_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M10_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M11_AXI ] [get_bd_intf_pins UART_FTDI_KX2/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M11_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M11_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
}
if { ( $ETH == "No_ETH" ) } {
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect CPU/interconnect_CPU0
  set_property -dict [list CONFIG.NUM_MI {10} CONFIG.NUM_SI {1}] [get_bd_cells CPU/interconnect_CPU0]
  connect_bd_intf_net [get_bd_intf_pins CPU/microblaze_CPU/M_AXI_DP] [get_bd_intf_pins CPU/interconnect_CPU0/S00_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/S00_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/S00_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M00_AXI ] [get_bd_intf_pins CPU/mdm_0/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M00_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M00_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M01_AXI ] [get_bd_intf_pins CPU/microblaze_axi_intc/s_axi]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M01_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M01_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M02_AXI ] [get_bd_intf_pins axi_timer/s_axi]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M02_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M02_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M03_AXI ] [get_bd_intf_pins xadc_wiz/S_AXI_LITE]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M03_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M03_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M04_AXI ] [get_bd_intf_pins IIC_FPGA/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M04_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M04_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M05_AXI ] [get_bd_intf_pins IIC/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M05_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M05_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M06_AXI ] [get_bd_intf_pins LED/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M06_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M06_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M07_AXI ] [get_bd_intf_pins QSPI/AXI_FULL]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M07_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M07_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M08_AXI ] [get_bd_intf_pins UART/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M08_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M08_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
  connect_bd_intf_net [get_bd_intf_pins CPU/interconnect_CPU0/M09_AXI ] [get_bd_intf_pins UART_FTDI_KX2/S_AXI]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M09_ACLK] [get_bd_pins CPU/microblaze_CPU/Clk]
  connect_bd_net [get_bd_pins CPU/interconnect_CPU0/M09_ARESETN] [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn]
}

connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins CPU/mdm_0/S_AXI_ARESETN]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins CPU/mdm_0/S_AXI_ACLK]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins CPU/microblaze_axi_intc/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins CPU/microblaze_axi_intc/s_axi_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins axi_timer/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins axi_timer/s_axi_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins xadc_wiz/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins xadc_wiz/s_axi_aclk]
if { ${ETH} == "ETH"} {
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins Ethernet/axi_dma/axi_resetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins Ethernet/axi_dma/s_axi_lite_aclk]
}
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins IIC_FPGA/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins IIC_FPGA/s_axi_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins IIC/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins IIC/s_axi_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins LED/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins LED/s_axi_aclk]
if { ${ETH} == "ETH"} {
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins Ethernet/axi_ethernet/s_axi_lite_resetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins Ethernet/axi_ethernet/s_axi_lite_clk]
}
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins QSPI/s_axi4_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins QSPI/s_axi4_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins UART/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins UART/s_axi_aclk]
connect_bd_net [get_bd_pins Memory/ps_sys_rst/peripheral_aresetn] [get_bd_pins UART_FTDI_KX2/s_axi_aresetn]
connect_bd_net [get_bd_pins CPU/microblaze_CPU/Clk] [get_bd_pins UART_FTDI_KX2/s_axi_aclk]

set LED_N [ create_bd_port -dir O -from 3 -to 0 LED_N]
connect_bd_net [get_bd_ports LED_N] [get_bd_pins LED/gpio_io_o]
assign_bd_address
save_bd_design
validate_bd_design
save_bd_design
