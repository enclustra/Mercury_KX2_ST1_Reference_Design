create_generated_clock -name Clk50 [get_pins -of [get_clocks mmcm_clkout0]]
create_generated_clock -name Clk100 [get_pins -of [get_clocks mmcm_clkout1]]
create_generated_clock -name Clk200 [get_pins -of [get_clocks mmcm_clkout2]]

set_false_path -from [get_clocks Clk50] -to [get_ports LED0_N]
set_false_path -from [get_clocks Clk50] -to [get_ports LED1_N]
set_false_path -from [get_clocks Clk50] -to [get_ports LED2_N]
set_false_path -from [get_clocks Clk50] -to [get_ports LED3_N]
