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

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]
 
# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------

# Anios 0
set_property -dict {PACKAGE_PIN AA23  IOSTANDARD LVCMOS33  } [get_ports {IO0_D0_P}]
set_property -dict {PACKAGE_PIN AB24  IOSTANDARD LVCMOS33  } [get_ports {IO0_D1_N}]
set_property -dict {PACKAGE_PIN AB21  IOSTANDARD LVCMOS33  } [get_ports {IO0_D2_P}]
set_property -dict {PACKAGE_PIN AC21  IOSTANDARD LVCMOS33  } [get_ports {IO0_D3_N}]
set_property -dict {PACKAGE_PIN AB22  IOSTANDARD LVCMOS33  } [get_ports {IO0_D4_P}]
set_property -dict {PACKAGE_PIN AC22  IOSTANDARD LVCMOS33  } [get_ports {IO0_D5_N}]
set_property -dict {PACKAGE_PIN AE23  IOSTANDARD LVCMOS33  } [get_ports {IO0_D6_P}]
set_property -dict {PACKAGE_PIN AF23  IOSTANDARD LVCMOS33  } [get_ports {IO0_D7_N}]
set_property -dict {PACKAGE_PIN AF24  IOSTANDARD LVCMOS33  } [get_ports {IO0_D8_P}]
set_property -dict {PACKAGE_PIN AF25  IOSTANDARD LVCMOS33  } [get_ports {IO0_D9_N}]
set_property -dict {PACKAGE_PIN AD25  IOSTANDARD LVCMOS33  } [get_ports {IO0_D10_P}]
set_property -dict {PACKAGE_PIN AE25  IOSTANDARD LVCMOS33  } [get_ports {IO0_D11_N}]
set_property -dict {PACKAGE_PIN V23   IOSTANDARD LVCMOS33  } [get_ports {IO0_D12_P}]
set_property -dict {PACKAGE_PIN V24   IOSTANDARD LVCMOS33  } [get_ports {IO0_D13_N}]
set_property -dict {PACKAGE_PIN W20   IOSTANDARD LVCMOS33  } [get_ports {IO0_D14_P}]
set_property -dict {PACKAGE_PIN Y21   IOSTANDARD LVCMOS33  } [get_ports {IO0_D15_N}]
set_property -dict {PACKAGE_PIN AD21  IOSTANDARD LVCMOS33  } [get_ports {IO0_D16_P}]
set_property -dict {PACKAGE_PIN AE21  IOSTANDARD LVCMOS33  } [get_ports {IO0_D17_N}]
set_property -dict {PACKAGE_PIN AE22  IOSTANDARD LVCMOS33  } [get_ports {IO0_D18_P}]
set_property -dict {PACKAGE_PIN AF22  IOSTANDARD LVCMOS33  } [get_ports {IO0_D19_N}]
set_property -dict {PACKAGE_PIN V21   IOSTANDARD LVCMOS33  } [get_ports {IO0_D20_P}]
set_property -dict {PACKAGE_PIN W21   IOSTANDARD LVCMOS33  } [get_ports {IO0_D21_N}]
set_property -dict {PACKAGE_PIN U24   IOSTANDARD LVCMOS33  } [get_ports {IO0_D22_P}]
set_property -dict {PACKAGE_PIN U25   IOSTANDARD LVCMOS33  } [get_ports {IO0_D23_N}]
set_property -dict {PACKAGE_PIN AC24  IOSTANDARD LVCMOS33  } [get_ports {IO0_CLK_N}]
set_property -dict {PACKAGE_PIN AC23  IOSTANDARD LVCMOS33  } [get_ports {IO0_CLK_P}]

# Anios 1
set_property -dict {PACKAGE_PIN P23   IOSTANDARD LVCMOS33  } [get_ports {IO1_D0_P}]
set_property -dict {PACKAGE_PIN N23   IOSTANDARD LVCMOS33  } [get_ports {IO1_D1_N}]
set_property -dict {PACKAGE_PIN T18   IOSTANDARD LVCMOS33  } [get_ports {IO1_D2_P}]
set_property -dict {PACKAGE_PIN T19   IOSTANDARD LVCMOS33  } [get_ports {IO1_D3_N}]
set_property -dict {PACKAGE_PIN N19   IOSTANDARD LVCMOS33  } [get_ports {IO1_D4_P}]
set_property -dict {PACKAGE_PIN M20   IOSTANDARD LVCMOS33  } [get_ports {IO1_D5_N}]
set_property -dict {PACKAGE_PIN T24   IOSTANDARD LVCMOS33  } [get_ports {IO1_D6_P}]
set_property -dict {PACKAGE_PIN T25   IOSTANDARD LVCMOS33  } [get_ports {IO1_D7_N}]
set_property -dict {PACKAGE_PIN R16   IOSTANDARD LVCMOS33  } [get_ports {IO1_D8_P}]
set_property -dict {PACKAGE_PIN R17   IOSTANDARD LVCMOS33  } [get_ports {IO1_D9_N}]
set_property -dict {PACKAGE_PIN N18   IOSTANDARD LVCMOS33  } [get_ports {IO1_D10_P}]
set_property -dict {PACKAGE_PIN M19   IOSTANDARD LVCMOS33  } [get_ports {IO1_D11_N}]
set_property -dict {PACKAGE_PIN T22   IOSTANDARD LVCMOS33  } [get_ports {IO1_D12_P}]
set_property -dict {PACKAGE_PIN T23   IOSTANDARD LVCMOS33  } [get_ports {IO1_D13_N}]
set_property -dict {PACKAGE_PIN P19   IOSTANDARD LVCMOS33  } [get_ports {IO1_D14_P}]
set_property -dict {PACKAGE_PIN P20   IOSTANDARD LVCMOS33  } [get_ports {IO1_D15_N}]
set_property -dict {PACKAGE_PIN P24   IOSTANDARD LVCMOS33  } [get_ports {IO1_D16_P}]
set_property -dict {PACKAGE_PIN N24   IOSTANDARD LVCMOS33  } [get_ports {IO1_D17_N}]
set_property -dict {PACKAGE_PIN R18   IOSTANDARD LVCMOS33  } [get_ports {IO1_D18_P}]
set_property -dict {PACKAGE_PIN P18   IOSTANDARD LVCMOS33  } [get_ports {IO1_D19_N}]
set_property -dict {PACKAGE_PIN U17   IOSTANDARD LVCMOS33  } [get_ports {IO1_D20_P}]
set_property -dict {PACKAGE_PIN T17   IOSTANDARD LVCMOS33  } [get_ports {IO1_D21_N}]
set_property -dict {PACKAGE_PIN P16   IOSTANDARD LVCMOS33  } [get_ports {IO1_D22_P}]
set_property -dict {PACKAGE_PIN N17   IOSTANDARD LVCMOS33  } [get_ports {IO1_D23_N}]
set_property -dict {PACKAGE_PIN R23   IOSTANDARD LVCMOS33  } [get_ports {IO1_CLK1_N}]
set_property -dict {PACKAGE_PIN R22   IOSTANDARD LVCMOS33  } [get_ports {IO1_CLK0_P}]

# BUTTONS
set_property -dict {PACKAGE_PIN C22   IOSTANDARD LVCMOS33  } [get_ports {BTN0_N}]
set_property -dict {PACKAGE_PIN AD23  IOSTANDARD LVCMOS33  } [get_ports {BTN1_N}]

# Clock Generator CLK1

# Clock Generator CLK3
set_property -dict {PACKAGE_PIN U16   IOSTANDARD LVCMOS33  } [get_ports {CLK_REF2_N}]
set_property -dict {PACKAGE_PIN N16   IOSTANDARD LVCMOS33  } [get_ports {CLK_REF2_P}]

# 100 MHz clock
create_clock -name Clk100_R -period 10.000 [get_ports Clk100_R]
set_property -dict {PACKAGE_PIN AA4   IOSTANDARD SSTL15    } [get_ports {Clk100_R}]

# 200 MHz differential clock
set_property DIFF_TERM FALSE [get_ports CLK200_N]
set_property DIFF_TERM FALSE [get_ports CLK200_P]
set_property -dict {PACKAGE_PIN AC11  IOSTANDARD DIFF_SSTL15} [get_ports {CLK200_N}]
set_property -dict {PACKAGE_PIN AB11  IOSTANDARD DIFF_SSTL15} [get_ports {CLK200_P}]

# DisplayPort
set_property -dict {PACKAGE_PIN E22   IOSTANDARD LVCMOS33  } [get_ports {DP_HPD}]
set_property -dict {PACKAGE_PIN D23   IOSTANDARD LVCMOS33  } [get_ports {DP_AUX_IN}]
set_property -dict {PACKAGE_PIN E21   IOSTANDARD LVCMOS33  } [get_ports {DP_AUX_OE}]
set_property -dict {PACKAGE_PIN D24   IOSTANDARD LVCMOS33  } [get_ports {DP_AUX_OUT}]

# FMC HPC Connector
set_property -dict {PACKAGE_PIN H8    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA02_N}]
set_property -dict {PACKAGE_PIN H9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA02_P}]
set_property -dict {PACKAGE_PIN D16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA03_N}]
set_property -dict {PACKAGE_PIN D15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA03_P}]
set_property -dict {PACKAGE_PIN F8    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA04_N}]
set_property -dict {PACKAGE_PIN F9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA04_P}]
set_property -dict {PACKAGE_PIN G16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA05_N}]
set_property -dict {PACKAGE_PIN H16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA05_P}]
set_property -dict {PACKAGE_PIN E16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA06_N}]
set_property -dict {PACKAGE_PIN E15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA06_P}]
set_property -dict {PACKAGE_PIN D8    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA07_N}]
set_property -dict {PACKAGE_PIN D9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA07_P}]
set_property -dict {PACKAGE_PIN J16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA08_N}]
set_property -dict {PACKAGE_PIN J15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA08_P}]
set_property -dict {PACKAGE_PIN B9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA09_N}]
set_property -dict {PACKAGE_PIN C9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA09_P}]
set_property -dict {PACKAGE_PIN F15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA10_N}]
set_property -dict {PACKAGE_PIN G15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA10_P}]
set_property -dict {PACKAGE_PIN A8    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA11_N}]
set_property -dict {PACKAGE_PIN A9    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA11_P}]
set_property -dict {PACKAGE_PIN M16   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA12_N}]
set_property -dict {PACKAGE_PIN K15   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA12_P}]
set_property -dict {PACKAGE_PIN J14   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA13_N}]
set_property -dict {PACKAGE_PIN J8    IOSTANDARD LVCMOS33  } [get_ports {FMC_HA13_P}]
set_property -dict {PACKAGE_PIN A19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA02_N}]
set_property -dict {PACKAGE_PIN A18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA02_P}]
set_property -dict {PACKAGE_PIN B19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA03_N}]
set_property -dict {PACKAGE_PIN C19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA03_P}]
set_property -dict {PACKAGE_PIN A17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA04_N}]
set_property -dict {PACKAGE_PIN B17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA04_P}]
set_property -dict {PACKAGE_PIN B16   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA05_N}]
set_property -dict {PACKAGE_PIN C16   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA05_P}]
set_property -dict {PACKAGE_PIN C18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA06_N}]
set_property -dict {PACKAGE_PIN C17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA06_P}]
set_property -dict {PACKAGE_PIN D20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA07_N}]
set_property -dict {PACKAGE_PIN D19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA07_P}]
set_property -dict {PACKAGE_PIN G20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA08_N}]
set_property -dict {PACKAGE_PIN H19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA08_P}]
set_property -dict {PACKAGE_PIN J19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA09_N}]
set_property -dict {PACKAGE_PIN J18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA09_P}]
set_property -dict {PACKAGE_PIN K17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA10_N}]
set_property -dict {PACKAGE_PIN K16   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA10_P}]
set_property -dict {PACKAGE_PIN K18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA11_N}]
set_property -dict {PACKAGE_PIN L17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA11_P}]
set_property -dict {PACKAGE_PIN L18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA12_N}]
set_property -dict {PACKAGE_PIN M17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA12_P}]
set_property -dict {PACKAGE_PIN J20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA13_N}]
set_property -dict {PACKAGE_PIN K20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA13_P}]
set_property -dict {PACKAGE_PIN L20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA14_N}]
set_property -dict {PACKAGE_PIN L19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA14_P}]
set_property -dict {PACKAGE_PIN F20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA15_N}]
set_property -dict {PACKAGE_PIN G19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA15_P}]
set_property -dict {PACKAGE_PIN E20   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA16_N}]
set_property -dict {PACKAGE_PIN F19   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA16_P}]
set_property -dict {PACKAGE_PIN A15   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA19_N}]
set_property -dict {PACKAGE_PIN B15   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA19_P}]
set_property -dict {PACKAGE_PIN A14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA20_N}]
set_property -dict {PACKAGE_PIN B14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA20_P}]
set_property -dict {PACKAGE_PIN G14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA21_N}]
set_property -dict {PACKAGE_PIN H14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA21_P}]
set_property -dict {PACKAGE_PIN B11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA22_N}]
set_property -dict {PACKAGE_PIN B12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA22_P}]
set_property -dict {PACKAGE_PIN A10   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA23_N}]
set_property -dict {PACKAGE_PIN B10   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA23_P}]
set_property -dict {PACKAGE_PIN A12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA24_N}]
set_property -dict {PACKAGE_PIN A13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA24_P}]
set_property -dict {PACKAGE_PIN G9    IOSTANDARD LVCMOS33  } [get_ports {FMC_LA25_N}]
set_property -dict {PACKAGE_PIN G10   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA25_P}]
set_property -dict {PACKAGE_PIN H11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA26_N}]
set_property -dict {PACKAGE_PIN H12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA26_P}]
set_property -dict {PACKAGE_PIN J10   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA27_N}]
set_property -dict {PACKAGE_PIN J11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA27_P}]
set_property -dict {PACKAGE_PIN F12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA28_N}]
set_property -dict {PACKAGE_PIN G12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA28_P}]
set_property -dict {PACKAGE_PIN E12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA29_N}]
set_property -dict {PACKAGE_PIN E13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA29_P}]
set_property -dict {PACKAGE_PIN F13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA30_N}]
set_property -dict {PACKAGE_PIN F14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA30_P}]
set_property -dict {PACKAGE_PIN H13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA31_N}]
set_property -dict {PACKAGE_PIN J13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA31_P}]
set_property -dict {PACKAGE_PIN D13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA32_N}]
set_property -dict {PACKAGE_PIN D14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA32_P}]
set_property -dict {PACKAGE_PIN C13   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA33_N}]
set_property -dict {PACKAGE_PIN C14   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA33_P}]
set_property -dict {PACKAGE_PIN E17   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA00_CC_N}]
set_property -dict {PACKAGE_PIN F17   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA00_CC_P}]
set_property -dict {PACKAGE_PIN D10   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA01_CC_N}]
set_property -dict {PACKAGE_PIN E10   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA01_CC_P}]
set_property -dict {PACKAGE_PIN U20   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA17_N}]
set_property -dict {PACKAGE_PIN U19   IOSTANDARD LVCMOS33  } [get_ports {FMC_HA17_P}]
set_property -dict {PACKAGE_PIN D18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA00_CC_N}]
set_property -dict {PACKAGE_PIN E18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA00_CC_P}]
set_property -dict {PACKAGE_PIN F18   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA01_CC_N}]
set_property -dict {PACKAGE_PIN G17   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA01_CC_P}]
set_property -dict {PACKAGE_PIN C11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA17_CC_N}]
set_property -dict {PACKAGE_PIN C12   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA17_CC_P}]
set_property -dict {PACKAGE_PIN D11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA18_CC_N}]
set_property -dict {PACKAGE_PIN E11   IOSTANDARD LVCMOS33  } [get_ports {FMC_LA18_CC_P}]
set_property -dict {PACKAGE_PIN H18   IOSTANDARD LVCMOS33  } [get_ports {FMC_CLK0_M2C_N}]
set_property -dict {PACKAGE_PIN H17   IOSTANDARD LVCMOS33  } [get_ports {FMC_CLK0_M2C_P}]
set_property -dict {PACKAGE_PIN F10   IOSTANDARD LVCMOS33  } [get_ports {FMC_CLK1_M2C_N}]
set_property -dict {PACKAGE_PIN G11   IOSTANDARD LVCMOS33  } [get_ports {FMC_CLK1_M2C_P}]

# HDMI
set_property -dict {PACKAGE_PIN U26   IOSTANDARD LVCMOS33  } [get_ports {HDMI_HPD}]
set_property -dict {PACKAGE_PIN R20   IOSTANDARD LVCMOS33  } [get_ports {HDMI_CLK_N}]
set_property -dict {PACKAGE_PIN T20   IOSTANDARD LVCMOS33  } [get_ports {HDMI_CLK_P}]

# I2C FPGA
set_property -dict {PACKAGE_PIN W25   IOSTANDARD LVCMOS33  } [get_ports {I2C_SCL_FPGA}]
set_property -dict {PACKAGE_PIN W26   IOSTANDARD LVCMOS33  } [get_ports {I2C_SDA_FPGA}]

# I2C_MIPI_SEL
set_property -dict {PACKAGE_PIN V26   IOSTANDARD LVCMOS33  } [get_ports {I2C_MIPI_SEL}]

# PL I2C
set_property SLEW SLOW [get_ports I2C_INT_N]
set_property SLEW SLOW [get_ports I2C_SDA]
set_property SLEW SLOW [get_ports I2C_SCL]
set_property -dict {PACKAGE_PIN AC18  IOSTANDARD SSTL15    } [get_ports {I2C_INT_N}]
set_property -dict {PACKAGE_PIN L23   IOSTANDARD LVCMOS33  } [get_ports {I2C_SCL}]
set_property -dict {PACKAGE_PIN C24   IOSTANDARD LVCMOS33  } [get_ports {I2C_SDA}]

# IO2

# IO3
set_property -dict {PACKAGE_PIN Y23   IOSTANDARD LVCMOS33  } [get_ports {IO3_D0_P}]
set_property -dict {PACKAGE_PIN AA24  IOSTANDARD LVCMOS33  } [get_ports {IO3_D1_N}]
set_property -dict {PACKAGE_PIN AB26  IOSTANDARD LVCMOS33  } [get_ports {IO3_D2_P}]
set_property -dict {PACKAGE_PIN AC26  IOSTANDARD LVCMOS33  } [get_ports {IO3_D3_N}]
set_property -dict {PACKAGE_PIN AA25  IOSTANDARD LVCMOS33  } [get_ports {IO3_D4_P}]
set_property -dict {PACKAGE_PIN AB25  IOSTANDARD LVCMOS33  } [get_ports {IO3_D5_N}]
set_property -dict {PACKAGE_PIN U21   IOSTANDARD LVCMOS33  } [get_ports {IO3_D6_P}]
set_property -dict {PACKAGE_PIN Y20   IOSTANDARD LVCMOS33  } [get_ports {IO3_D7_N}]

# IO4
set_property -dict {PACKAGE_PIN Y25   IOSTANDARD LVCMOS33  } [get_ports {IO4_D0_P}]
set_property -dict {PACKAGE_PIN Y26   IOSTANDARD LVCMOS33  } [get_ports {IO4_D1_N}]
set_property -dict {PACKAGE_PIN U22   IOSTANDARD LVCMOS33  } [get_ports {IO4_D2_P}]
set_property -dict {PACKAGE_PIN V22   IOSTANDARD LVCMOS33  } [get_ports {IO4_D3_N}]
set_property -dict {PACKAGE_PIN W23   IOSTANDARD LVCMOS33  } [get_ports {IO4_D4_P}]
set_property -dict {PACKAGE_PIN W24   IOSTANDARD LVCMOS33  } [get_ports {IO4_D5_N}]
set_property -dict {PACKAGE_PIN AD26  IOSTANDARD LVCMOS33  } [get_ports {IO4_D6_P}]
set_property -dict {PACKAGE_PIN AE26  IOSTANDARD LVCMOS33  } [get_ports {IO4_D7_N}]

# LED
set_property SLEW SLOW [get_ports LED0_N]
set_property SLEW SLOW [get_ports LED1_N]
set_property SLEW SLOW [get_ports LED2_N]
set_property SLEW SLOW [get_ports LED3_N]
set_property -dict {PACKAGE_PIN U9    IOSTANDARD SSTL15    } [get_ports {LED0_N}]
set_property -dict {PACKAGE_PIN V12   IOSTANDARD SSTL15    } [get_ports {LED1_N}]
set_property -dict {PACKAGE_PIN V13   IOSTANDARD SSTL15    } [get_ports {LED2_N}]
set_property -dict {PACKAGE_PIN W13   IOSTANDARD SSTL15    } [get_ports {LED3_N}]

# MIPI0
set_property -dict {PACKAGE_PIN P25   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_D0_N}]
set_property -dict {PACKAGE_PIN R25   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_D0_P}]
set_property -dict {PACKAGE_PIN L24   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_D1_N}]
set_property -dict {PACKAGE_PIN M24   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_D1_P}]
set_property -dict {PACKAGE_PIN L25   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_CLK_D0LP_N}]
set_property -dict {PACKAGE_PIN M25   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_CLK_D0LP_P}]
set_property -dict {PACKAGE_PIN P21   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_CLK_N}]
set_property -dict {PACKAGE_PIN R21   IOSTANDARD LVCMOS33  } [get_ports {MIPI0_CLK_P}]

# MIPI1
set_property -dict {PACKAGE_PIN M26   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_D0_N}]
set_property -dict {PACKAGE_PIN N26   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_D0_P}]
set_property -dict {PACKAGE_PIN M22   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_D1_N}]
set_property -dict {PACKAGE_PIN M21   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_D1_P}]
set_property -dict {PACKAGE_PIN P26   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_CLK_D0LP_N}]
set_property -dict {PACKAGE_PIN R26   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_CLK_D0LP_P}]
set_property -dict {PACKAGE_PIN N22   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_CLK_N}]
set_property -dict {PACKAGE_PIN N21   IOSTANDARD LVCMOS33  } [get_ports {MIPI1_CLK_P}]

# Oscillator 100 MHz
set_property -dict {PACKAGE_PIN AD24  IOSTANDARD LVCMOS33  } [get_ports {CLK_100_CAL}]

# SDRAM
set_property DCI_CASCADE {32} [get_iobanks 34]
# DDR @ 1.35 V
#set_property INTERNAL_VREF 0.675 [get_iobanks 33]
# DDR @ 1.5 V
set_property INTERNAL_VREF 0.750 [get_iobanks 33]
set_property SLEW SLOW [get_ports DDR3_VSEL]
set_property -dict {PACKAGE_PIN AD11  IOSTANDARD SSTL15    } [get_ports {DDR3_BA[0]}]
set_property -dict {PACKAGE_PIN AA10  IOSTANDARD SSTL15    } [get_ports {DDR3_BA[1]}]
set_property -dict {PACKAGE_PIN AF12  IOSTANDARD SSTL15    } [get_ports {DDR3_BA[2]}]
set_property -dict {PACKAGE_PIN AA2   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[0]}]
set_property -dict {PACKAGE_PIN Y2    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[1]}]
set_property -dict {PACKAGE_PIN AB2   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[2]}]
set_property -dict {PACKAGE_PIN V1    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[3]}]
set_property -dict {PACKAGE_PIN Y1    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[4]}]
set_property -dict {PACKAGE_PIN W1    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[5]}]
set_property -dict {PACKAGE_PIN AC2   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[6]}]
set_property -dict {PACKAGE_PIN V2    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[7]}]
set_property -dict {PACKAGE_PIN W3    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[8]}]
set_property -dict {PACKAGE_PIN V3    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[9]}]
set_property -dict {PACKAGE_PIN AE11  IOSTANDARD SSTL15    } [get_ports {DDR3_A[0]}]
set_property -dict {PACKAGE_PIN AF9   IOSTANDARD SSTL15    } [get_ports {DDR3_A[1]}]
set_property -dict {PACKAGE_PIN AD10  IOSTANDARD SSTL15    } [get_ports {DDR3_A[2]}]
set_property -dict {PACKAGE_PIN AB10  IOSTANDARD SSTL15    } [get_ports {DDR3_A[3]}]
set_property -dict {PACKAGE_PIN AA9   IOSTANDARD SSTL15    } [get_ports {DDR3_A[4]}]
set_property -dict {PACKAGE_PIN AB9   IOSTANDARD SSTL15    } [get_ports {DDR3_A[5]}]
set_property -dict {PACKAGE_PIN AA8   IOSTANDARD SSTL15    } [get_ports {DDR3_A[6]}]
set_property -dict {PACKAGE_PIN AC8   IOSTANDARD SSTL15    } [get_ports {DDR3_A[7]}]
set_property -dict {PACKAGE_PIN AA7   IOSTANDARD SSTL15    } [get_ports {DDR3_A[8]}]
set_property -dict {PACKAGE_PIN AE8   IOSTANDARD SSTL15    } [get_ports {DDR3_A[9]}]
set_property -dict {PACKAGE_PIN AA13  IOSTANDARD SSTL15    } [get_ports {DDR3_CKE[0]}]
set_property -dict {PACKAGE_PIN AC12  IOSTANDARD DIFF_SSTL15} [get_ports {DDR3_CK_N[0]}]
set_property -dict {PACKAGE_PIN AB12  IOSTANDARD DIFF_SSTL15} [get_ports {DDR3_CK_P[0]}]
set_property -dict {PACKAGE_PIN U1    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[10]}]
set_property -dict {PACKAGE_PIN U7    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[11]}]
set_property -dict {PACKAGE_PIN U6    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[12]}]
set_property -dict {PACKAGE_PIN V4    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[13]}]
set_property -dict {PACKAGE_PIN V6    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[14]}]
set_property -dict {PACKAGE_PIN U2    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[15]}]
set_property -dict {PACKAGE_PIN AE3   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[16]}]
set_property -dict {PACKAGE_PIN AE6   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[17]}]
set_property -dict {PACKAGE_PIN AF3   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[18]}]
set_property -dict {PACKAGE_PIN AD1   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[19]}]
set_property -dict {PACKAGE_PIN AE1   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[20]}]
set_property -dict {PACKAGE_PIN AE2   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[21]}]
set_property -dict {PACKAGE_PIN AF2   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[22]}]
set_property -dict {PACKAGE_PIN AE5   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[23]}]
set_property -dict {PACKAGE_PIN AD5   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[24]}]
set_property -dict {PACKAGE_PIN Y5    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[25]}]
set_property -dict {PACKAGE_PIN AC6   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[26]}]
set_property -dict {PACKAGE_PIN Y6    IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[27]}]
set_property -dict {PACKAGE_PIN AB4   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[28]}]
set_property -dict {PACKAGE_PIN AD6   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[29]}]
set_property -dict {PACKAGE_PIN AB6   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[30]}]
set_property -dict {PACKAGE_PIN AC3   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[31]}]
set_property -dict {PACKAGE_PIN AD16  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[32]}]
set_property -dict {PACKAGE_PIN AE17  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[33]}]
set_property -dict {PACKAGE_PIN AF15  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[34]}]
set_property -dict {PACKAGE_PIN AF20  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[35]}]
set_property -dict {PACKAGE_PIN AD15  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[36]}]
set_property -dict {PACKAGE_PIN AF14  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[37]}]
set_property -dict {PACKAGE_PIN AE15  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[38]}]
set_property -dict {PACKAGE_PIN AF17  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[39]}]
set_property -dict {PACKAGE_PIN AA14  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[40]}]
set_property -dict {PACKAGE_PIN AA15  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[41]}]
set_property -dict {PACKAGE_PIN AC14  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[42]}]
set_property -dict {PACKAGE_PIN AD14  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[43]}]
set_property -dict {PACKAGE_PIN AB14  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[44]}]
set_property -dict {PACKAGE_PIN AB15  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[45]}]
set_property -dict {PACKAGE_PIN AA17  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[46]}]
set_property -dict {PACKAGE_PIN AA18  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[47]}]
set_property -dict {PACKAGE_PIN AB20  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[48]}]
set_property -dict {PACKAGE_PIN AD19  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[49]}]
set_property -dict {PACKAGE_PIN AC19  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[50]}]
set_property -dict {PACKAGE_PIN AA20  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[51]}]
set_property -dict {PACKAGE_PIN AA19  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[52]}]
set_property -dict {PACKAGE_PIN AC17  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[53]}]
set_property -dict {PACKAGE_PIN AD18  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[54]}]
set_property -dict {PACKAGE_PIN AB17  IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[55]}]
set_property -dict {PACKAGE_PIN W15   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[56]}]
set_property -dict {PACKAGE_PIN W16   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[57]}]
set_property -dict {PACKAGE_PIN W14   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[58]}]
set_property -dict {PACKAGE_PIN V16   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[59]}]
set_property -dict {PACKAGE_PIN V19   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[60]}]
set_property -dict {PACKAGE_PIN V17   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[61]}]
set_property -dict {PACKAGE_PIN V18   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[62]}]
set_property -dict {PACKAGE_PIN Y17   IOSTANDARD SSTL15_T_DCI} [get_ports {DDR3_DQ[63]}]
set_property -dict {PACKAGE_PIN AD13  IOSTANDARD SSTL15    } [get_ports {DDR3_ODT[0]}]
set_property -dict {PACKAGE_PIN AA3   IOSTANDARD SSTL15    } [get_ports {DDR3_VSEL}]
set_property -dict {PACKAGE_PIN AA12  IOSTANDARD SSTL15    } [get_ports {DDR3_WE_N}]
set_property -dict {PACKAGE_PIN AF10  IOSTANDARD SSTL15    } [get_ports {DDR3_A[10]}]
set_property -dict {PACKAGE_PIN AD8   IOSTANDARD SSTL15    } [get_ports {DDR3_A[11]}]
set_property -dict {PACKAGE_PIN AE10  IOSTANDARD SSTL15    } [get_ports {DDR3_A[12]}]
set_property -dict {PACKAGE_PIN AF8   IOSTANDARD SSTL15    } [get_ports {DDR3_A[13]}]
set_property -dict {PACKAGE_PIN AC7   IOSTANDARD SSTL15    } [get_ports {DDR3_A[14]}]
set_property -dict {PACKAGE_PIN AE12  IOSTANDARD SSTL15    } [get_ports {DDR3_CAS_N}]
set_property -dict {PACKAGE_PIN Y12   IOSTANDARD SSTL15    } [get_ports {DDR3_CS_N[0]}]
set_property -dict {PACKAGE_PIN Y3    IOSTANDARD SSTL15    } [get_ports {DDR3_DM[0]}]
set_property -dict {PACKAGE_PIN U5    IOSTANDARD SSTL15    } [get_ports {DDR3_DM[1]}]
set_property -dict {PACKAGE_PIN AD4   IOSTANDARD SSTL15    } [get_ports {DDR3_DM[2]}]
set_property -dict {PACKAGE_PIN AC4   IOSTANDARD SSTL15    } [get_ports {DDR3_DM[3]}]
set_property -dict {PACKAGE_PIN AF19  IOSTANDARD SSTL15    } [get_ports {DDR3_DM[4]}]
set_property -dict {PACKAGE_PIN AC16  IOSTANDARD SSTL15    } [get_ports {DDR3_DM[5]}]
set_property -dict {PACKAGE_PIN AB19  IOSTANDARD SSTL15    } [get_ports {DDR3_DM[6]}]
set_property -dict {PACKAGE_PIN V14   IOSTANDARD SSTL15    } [get_ports {DDR3_DM[7]}]
set_property -dict {PACKAGE_PIN AE13  IOSTANDARD SSTL15    } [get_ports {DDR3_RAS_N}]
set_property -dict {PACKAGE_PIN AC1   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[0]}]
set_property -dict {PACKAGE_PIN W5    IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[1]}]
set_property -dict {PACKAGE_PIN AF4   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[2]}]
set_property -dict {PACKAGE_PIN AB5   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[3]}]
set_property -dict {PACKAGE_PIN AF18  IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[4]}]
set_property -dict {PACKAGE_PIN Y16   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[5]}]
set_property -dict {PACKAGE_PIN AE20  IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[6]}]
set_property -dict {PACKAGE_PIN W19   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_N[7]}]
set_property -dict {PACKAGE_PIN AB1   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[0]}]
set_property -dict {PACKAGE_PIN W6    IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[1]}]
set_property -dict {PACKAGE_PIN AF5   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[2]}]
set_property -dict {PACKAGE_PIN AA5   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[3]}]
set_property -dict {PACKAGE_PIN AE18  IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[4]}]
set_property -dict {PACKAGE_PIN Y15   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[5]}]
set_property -dict {PACKAGE_PIN AD20  IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[6]}]
set_property -dict {PACKAGE_PIN W18   IOSTANDARD DIFF_SSTL15_T_DCI} [get_ports {DDR3_DQS_P[7]}]
set_property -dict {PACKAGE_PIN AB7   IOSTANDARD SSTL15    } [get_ports {DDR3_RST_N}]

# PL Gigabit Ethernet Interface 0
set_property SLEW FAST [get_ports ETH1_TX_CLK]
set_property SLEW FAST [get_ports ETH1_TX_CTL]
set_property SLEW FAST [get_ports {ETH1_TX_D[0]}]
set_property SLEW FAST [get_ports {ETH1_TX_D[1]}]
set_property SLEW FAST [get_ports {ETH1_TX_D[2]}]
set_property SLEW FAST [get_ports {ETH1_TX_D[3]}]
set_property -dict {PACKAGE_PIN B25   IOSTANDARD LVCMOS33  } [get_ports {FPGA_MDC_PUDC_N}]
set_property -dict {PACKAGE_PIN H23   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_D[0]}]
set_property -dict {PACKAGE_PIN H24   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_D[1]}]
set_property -dict {PACKAGE_PIN J21   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_D[2]}]
set_property -dict {PACKAGE_PIN H22   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_D[3]}]
set_property -dict {PACKAGE_PIN G22   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_CLK}]
set_property -dict {PACKAGE_PIN J24   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_D[0]}]
set_property -dict {PACKAGE_PIN J25   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_D[1]}]
set_property -dict {PACKAGE_PIN L22   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_D[2]}]
set_property -dict {PACKAGE_PIN K22   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_D[3]}]
set_property -dict {PACKAGE_PIN K23   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_CLK}]
set_property -dict {PACKAGE_PIN B26   IOSTANDARD LVCMOS33  } [get_ports {FPGA_MDIO_EMCCLK}]
set_property -dict {PACKAGE_PIN F23   IOSTANDARD LVCMOS33  } [get_ports {ETH0_RX_CTL}]
set_property -dict {PACKAGE_PIN J23   IOSTANDARD LVCMOS33  } [get_ports {ETH0_TX_CTL}]

# PL Gigabit Ethernet Interface 1
set_property SLEW FAST [get_ports ETH0_TX_CLK]
set_property SLEW FAST [get_ports ETH0_TX_CTL]
set_property SLEW FAST [get_ports {ETH0_TX_D[0]}]
set_property SLEW FAST [get_ports {ETH0_TX_D[1]}]
set_property SLEW FAST [get_ports {ETH0_TX_D[2]}]
set_property SLEW FAST [get_ports {ETH0_TX_D[3]}]
set_property -dict {PACKAGE_PIN G25   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_D[0]}]
set_property -dict {PACKAGE_PIN G26   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_D[1]}]
set_property -dict {PACKAGE_PIN F25   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_D[2]}]
set_property -dict {PACKAGE_PIN E26   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_D[3]}]
set_property -dict {PACKAGE_PIN G24   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_CLK}]
set_property -dict {PACKAGE_PIN J26   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_D[0]}]
set_property -dict {PACKAGE_PIN H26   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_D[1]}]
set_property -dict {PACKAGE_PIN H21   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_D[2]}]
set_property -dict {PACKAGE_PIN G21   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_D[3]}]
set_property -dict {PACKAGE_PIN E25   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_CLK}]
set_property -dict {PACKAGE_PIN F24   IOSTANDARD LVCMOS33  } [get_ports {ETH1_RX_CTL}]
set_property -dict {PACKAGE_PIN D25   IOSTANDARD LVCMOS33  } [get_ports {ETH1_TX_CTL}]

# QSPI
set_property SLEW FAST [get_ports FPGA_CCLK]
set_property SLEW FAST [get_ports FLASH_WP_N]
set_property SLEW FAST [get_ports FLASH_HOLD_N]
set_property SLEW FAST [get_ports FLASH_DI]
set_property SLEW FAST [get_ports FLASH_DO]
set_property SLEW FAST [get_ports FLASH_CS_N]
set_property -dict {PACKAGE_PIN K21   IOSTANDARD LVCMOS33  } [get_ports {FPGA_CCLK}]
set_property -dict {PACKAGE_PIN C23   IOSTANDARD LVCMOS33  } [get_ports {FLASH_CS_N}]
set_property -dict {PACKAGE_PIN B24   IOSTANDARD LVCMOS33  } [get_ports {FLASH_DI}]
set_property -dict {PACKAGE_PIN A25   IOSTANDARD LVCMOS33  } [get_ports {FLASH_DO}]
set_property -dict {PACKAGE_PIN B22   IOSTANDARD LVCMOS33  } [get_ports {FLASH_WP_N}]
set_property -dict {PACKAGE_PIN A22   IOSTANDARD LVCMOS33  } [get_ports {FLASH_HOLD_N}]

# Rst_N
set_property -dict {PACKAGE_PIN AD9   IOSTANDARD SSTL15    } [get_ports {Rst_N}]

# ST1 LED
set_property -dict {PACKAGE_PIN K25   IOSTANDARD LVCMOS33  } [get_ports {LED2}]
set_property -dict {PACKAGE_PIN K26   IOSTANDARD LVCMOS33  } [get_ports {LED3}]

# ST1 LED GPIO
set_property -dict {PACKAGE_PIN F22   IOSTANDARD LVCMOS33  } [get_ports {GPIO0_LED0_N}]
set_property -dict {PACKAGE_PIN E23   IOSTANDARD LVCMOS33  } [get_ports {GPIO1_LED1_N}]

# UART
set_property -dict {PACKAGE_PIN B20   IOSTANDARD LVCMOS33  } [get_ports {UART_RX}]
set_property -dict {PACKAGE_PIN A20   IOSTANDARD LVCMOS33  } [get_ports {UART_TX}]

# UART_FTDI_KX2
set_property -dict {PACKAGE_PIN W10   IOSTANDARD SSTL15    } [get_ports {FTDI_D0}]
set_property -dict {PACKAGE_PIN W9    IOSTANDARD SSTL15    } [get_ports {FTDI_D1}]
set_property -dict {PACKAGE_PIN Y8    IOSTANDARD SSTL15    } [get_ports {FTDI_D2}]
set_property -dict {PACKAGE_PIN Y7    IOSTANDARD SSTL15    } [get_ports {FTDI_D3}]
set_property -dict {PACKAGE_PIN Y11   IOSTANDARD SSTL15    } [get_ports {FTDI_D4}]
set_property -dict {PACKAGE_PIN Y10   IOSTANDARD SSTL15    } [get_ports {FTDI_D5}]
set_property -dict {PACKAGE_PIN V9    IOSTANDARD SSTL15    } [get_ports {FTDI_D6}]
set_property -dict {PACKAGE_PIN W8    IOSTANDARD SSTL15    } [get_ports {FTDI_D7}]
set_property -dict {PACKAGE_PIN AB16  IOSTANDARD SSTL15    } [get_ports {FTDI_UART_RX}]
set_property -dict {PACKAGE_PIN W11   IOSTANDARD SSTL15    } [get_ports {FTDI_UART_TX}]
set_property -dict {PACKAGE_PIN V11   IOSTANDARD SSTL15    } [get_ports {FTDI_OE_N}]
set_property -dict {PACKAGE_PIN V8    IOSTANDARD SSTL15    } [get_ports {FTDI_RD_N}]
set_property -dict {PACKAGE_PIN V7    IOSTANDARD SSTL15    } [get_ports {FTDI_WR_N}]
set_property -dict {PACKAGE_PIN AF7   IOSTANDARD SSTL15    } [get_ports {FTDI_RXF_N}]
set_property -dict {PACKAGE_PIN AE7   IOSTANDARD SSTL15    } [get_ports {FTDI_TXE_N}]
set_property -dict {PACKAGE_PIN AC9   IOSTANDARD SSTL15    } [get_ports {FTDI_CLKOUT}]

# USB3
