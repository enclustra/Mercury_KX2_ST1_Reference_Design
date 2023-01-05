---------------------------------------------------------------------------------------------------
-- Copyright (c) 2022 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Mercury_KX2_ST1 is
  generic (
    DDR3_ADDR_WIDTH : natural
  );
  
  port (
    
    -- Anios 0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK_N                      : inout   std_logic;
    IO0_CLK_P                      : inout   std_logic;
    
    -- Anios 1
    IO1_D0_P                       : inout   std_logic;
    IO1_D1_N                       : inout   std_logic;
    IO1_D2_P                       : inout   std_logic;
    IO1_D3_N                       : inout   std_logic;
    IO1_D4_P                       : inout   std_logic;
    IO1_D5_N                       : inout   std_logic;
    IO1_D6_P                       : inout   std_logic;
    IO1_D7_N                       : inout   std_logic;
    IO1_D8_P                       : inout   std_logic;
    IO1_D9_N                       : inout   std_logic;
    IO1_D10_P                      : inout   std_logic;
    IO1_D11_N                      : inout   std_logic;
    IO1_D12_P                      : inout   std_logic;
    IO1_D13_N                      : inout   std_logic;
    IO1_D14_P                      : inout   std_logic;
    IO1_D15_N                      : inout   std_logic;
    IO1_D16_P                      : inout   std_logic;
    IO1_D17_N                      : inout   std_logic;
    IO1_D18_P                      : inout   std_logic;
    IO1_D19_N                      : inout   std_logic;
    IO1_D20_P                      : inout   std_logic;
    IO1_D21_N                      : inout   std_logic;
    IO1_D22_P                      : inout   std_logic;
    IO1_D23_N                      : inout   std_logic;
    IO1_CLK1_N                     : inout   std_logic;
    IO1_CLK0_P                     : inout   std_logic;
    
    -- BUTTONS
    BTN0_N                         : in      std_logic;
    BTN1_N                         : in      std_logic;
    
    -- Clock Generator CLK1
    CLK_REF0_N                     : in      std_logic;
    CLK_REF0_P                     : in      std_logic;
    
    -- Clock Generator CLK3
    CLK_REF2_N                     : in      std_logic;
    CLK_REF2_P                     : in      std_logic;
    
    -- 100 MHz clock
    Clk100_R                       : in      std_logic;
    
    -- 200 MHz differential clock
    CLK200_N                       : in      std_logic;
    CLK200_P                       : in      std_logic;
    
    -- DisplayPort
    DP_HPD                         : in      std_logic;
    DP_AUX_IN                      : in      std_logic;
    DP_AUX_OE                      : out     std_logic;
    DP_AUX_OUT                     : out     std_logic;
    DP_LANE0_N                     : inout   std_logic;
    DP_LANE3_N                     : inout   std_logic;
    DP_LANE0_P                     : inout   std_logic;
    DP_LANE3_P                     : inout   std_logic;
    DP_LANE1_N                     : inout   std_logic;
    DP_LANE2_N                     : inout   std_logic;
    DP_LANE1_P                     : inout   std_logic;
    DP_LANE2_P                     : inout   std_logic;
    
    -- FMC HPC Connector
    FMC_HA02_N                     : inout   std_logic;
    FMC_HA02_P                     : inout   std_logic;
    FMC_HA03_N                     : inout   std_logic;
    FMC_HA03_P                     : inout   std_logic;
    FMC_HA04_N                     : inout   std_logic;
    FMC_HA04_P                     : inout   std_logic;
    FMC_HA05_N                     : inout   std_logic;
    FMC_HA05_P                     : inout   std_logic;
    FMC_HA06_N                     : inout   std_logic;
    FMC_HA06_P                     : inout   std_logic;
    FMC_HA07_N                     : inout   std_logic;
    FMC_HA07_P                     : inout   std_logic;
    FMC_HA08_N                     : inout   std_logic;
    FMC_HA08_P                     : inout   std_logic;
    FMC_HA09_N                     : inout   std_logic;
    FMC_HA09_P                     : inout   std_logic;
    FMC_HA10_N                     : inout   std_logic;
    FMC_HA10_P                     : inout   std_logic;
    FMC_HA11_N                     : inout   std_logic;
    FMC_HA11_P                     : inout   std_logic;
    FMC_HA12_N                     : inout   std_logic;
    FMC_HA12_P                     : inout   std_logic;
    FMC_HA13_N                     : inout   std_logic;
    FMC_HA13_P                     : inout   std_logic;
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_DP0_C2M_N                  : inout   std_logic;
    FMC_DP0_C2M_P                  : inout   std_logic;
    FMC_DP0_M2C_N                  : inout   std_logic;
    FMC_DP0_M2C_P                  : inout   std_logic;
    FMC_DP1_C2M_N                  : inout   std_logic;
    FMC_DP1_C2M_P                  : inout   std_logic;
    FMC_DP1_M2C_N                  : inout   std_logic;
    FMC_DP1_M2C_P                  : inout   std_logic;
    FMC_DP2_C2M_N                  : inout   std_logic;
    FMC_DP2_C2M_P                  : inout   std_logic;
    FMC_DP2_M2C_N                  : inout   std_logic;
    FMC_DP2_M2C_P                  : inout   std_logic;
    FMC_DP3_C2M_N                  : inout   std_logic;
    FMC_DP3_C2M_P                  : inout   std_logic;
    FMC_DP3_M2C_N                  : inout   std_logic;
    FMC_DP3_M2C_P                  : inout   std_logic;
    FMC_HA00_CC_N                  : inout   std_logic;
    FMC_HA00_CC_P                  : inout   std_logic;
    FMC_HA01_CC_N                  : inout   std_logic;
    FMC_HA01_CC_P                  : inout   std_logic;
    FMC_HA17_N                     : inout   std_logic;
    FMC_HA17_P                     : inout   std_logic;
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    FMC_GCLK0_M2C_N                : inout   std_logic;
    FMC_GCLK0_M2C_P                : inout   std_logic;
    
    -- HDMI
    HDMI_HPD                       : in      std_logic;
    HDMI_CLK_N                     : out     std_logic;
    HDMI_CLK_P                     : out     std_logic;
    
    -- I2C FPGA
    I2C_SCL_FPGA                   : inout   std_logic;
    I2C_SDA_FPGA                   : inout   std_logic;
    
    -- I2C_MIPI_SEL
    I2C_MIPI_SEL                   : inout   std_logic;
    
    -- PL I2C
    I2C_INT_N                      : in      std_logic;
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IO2
    IO2_D0_P                       : inout   std_logic;
    IO2_D1_N                       : inout   std_logic;
    IO2_D2_P                       : inout   std_logic;
    IO2_D3_N                       : inout   std_logic;
    
    -- IO3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    IO3_D4_P                       : inout   std_logic;
    IO3_D5_N                       : inout   std_logic;
    IO3_D6_P                       : inout   std_logic;
    IO3_D7_N                       : inout   std_logic;
    
    -- IO4
    IO4_D0_P                       : inout   std_logic;
    IO4_D1_N                       : inout   std_logic;
    IO4_D2_P                       : inout   std_logic;
    IO4_D3_N                       : inout   std_logic;
    IO4_D4_P                       : inout   std_logic;
    IO4_D5_N                       : inout   std_logic;
    IO4_D6_P                       : inout   std_logic;
    IO4_D7_N                       : inout   std_logic;
    
    -- LED
    LED0_N                         : out     std_logic;
    LED1_N                         : out     std_logic;
    LED2_N                         : out     std_logic;
    LED3_N                         : out     std_logic;
    
    -- MIPI0
    MIPI0_D0_N                     : inout   std_logic;
    MIPI0_D0_P                     : inout   std_logic;
    MIPI0_D1_N                     : inout   std_logic;
    MIPI0_D1_P                     : inout   std_logic;
    MIPI0_CLK_D0LP_N               : inout   std_logic;
    MIPI0_CLK_D0LP_P               : inout   std_logic;
    MIPI0_CLK_N                    : inout   std_logic;
    MIPI0_CLK_P                    : inout   std_logic;
    
    -- MIPI1
    MIPI1_D0_N                     : inout   std_logic;
    MIPI1_D0_P                     : inout   std_logic;
    MIPI1_D1_N                     : inout   std_logic;
    MIPI1_D1_P                     : inout   std_logic;
    MIPI1_CLK_D0LP_N               : inout   std_logic;
    MIPI1_CLK_D0LP_P               : inout   std_logic;
    MIPI1_CLK_N                    : inout   std_logic;
    MIPI1_CLK_P                    : inout   std_logic;
    
    -- Oscillator 100 MHz
    CLK_100_CAL                    : in      std_logic;
    
    -- SDRAM
    DDR3_VSEL                      : inout   std_logic;
    DDR3_WE_N                      : out     std_logic;
    DDR3_CAS_N                     : out     std_logic;
    DDR3_RAS_N                     : out     std_logic;
    DDR3_RST_N                     : out     std_logic;
    DDR3_BA                        : out     std_logic_vector(2 downto 0);
    DDR3_DQ                        : inout   std_logic_vector(63 downto 0);
    DDR3_A                         : out     std_logic_vector(14 downto 0);
    DDR3_CKE                       : out     std_logic_vector(0 downto 0);
    DDR3_CK_N                      : out     std_logic_vector(0 downto 0);
    DDR3_CK_P                      : out     std_logic_vector(0 downto 0);
    DDR3_ODT                       : out     std_logic_vector(0 downto 0);
    DDR3_CS_N                      : out     std_logic_vector(0 downto 0);
    DDR3_DM                        : inout   std_logic_vector(7 downto 0);
    DDR3_DQS_N                     : inout   std_logic_vector(7 downto 0);
    DDR3_DQS_P                     : inout   std_logic_vector(7 downto 0);
    
    -- PL Gigabit Ethernet Interface 0
    FPGA_MDC_PUDC_N                : out     std_logic;
    ETH0_RX_CLK                    : in      std_logic;
    ETH0_TX_CLK                    : out     std_logic;
    FPGA_MDIO_EMCCLK               : inout   std_logic;
    ETH0_RX_CTL                    : in      std_logic;
    ETH0_TX_CTL                    : out     std_logic;
    ETH0_RX_D                      : in      std_logic_vector(3 downto 0);
    ETH0_TX_D                      : out     std_logic_vector(3 downto 0);
    
    -- PL Gigabit Ethernet Interface 1
    ETH1_RX_CLK                    : in      std_logic;
    ETH1_TX_CLK                    : out     std_logic;
    ETH1_RX_CTL                    : in      std_logic;
    ETH1_TX_CTL                    : out     std_logic;
    ETH1_RX_D                      : in      std_logic_vector(3 downto 0);
    ETH1_TX_D                      : out     std_logic_vector(3 downto 0);
    
    -- QSPI
    FPGA_CCLK                      : inout   std_logic;
    FLASH_CS_N                     : inout   std_logic;
    FLASH_DI                       : inout   std_logic;
    FLASH_DO                       : inout   std_logic;
    FLASH_WP_N                     : inout   std_logic;
    FLASH_HOLD_N                   : inout   std_logic;
    
    -- Rst_N
    Rst_N                          : in      std_logic;
    
    -- ST1 LED
    LED2                           : out     std_logic;
    LED3                           : out     std_logic;
    
    -- ST1 LED GPIO
    GPIO0_LED0_N                   : out     std_logic;
    GPIO1_LED1_N                   : out     std_logic;
    
    -- UART
    UART_RX                        : in      std_logic;
    UART_TX                        : out     std_logic;
    
    -- UART_FTDI_KX2
    FTDI_D0                        : inout   std_logic;
    FTDI_D1                        : inout   std_logic;
    FTDI_D2                        : inout   std_logic;
    FTDI_D3                        : inout   std_logic;
    FTDI_D4                        : inout   std_logic;
    FTDI_D5                        : inout   std_logic;
    FTDI_D6                        : inout   std_logic;
    FTDI_D7                        : inout   std_logic;
    FTDI_UART_RX                   : in      std_logic;
    FTDI_UART_TX                   : out     std_logic;
    FTDI_OE_N                      : out     std_logic;
    FTDI_RD_N                      : out     std_logic;
    FTDI_WR_N                      : out     std_logic;
    FTDI_RXF_N                     : in      std_logic;
    FTDI_TXE_N                     : in      std_logic;
    FTDI_CLKOUT                    : inout   std_logic;
    
    -- USB3
    USB0_SSRX_N                    : inout   std_logic;
    USB1_SSRX_N                    : inout   std_logic;
    USB0_SSRX_P                    : inout   std_logic;
    USB1_SSRX_P                    : inout   std_logic;
    USB0_SSTX_N                    : inout   std_logic;
    USB1_SSTX_N                    : inout   std_logic;
    USB0_SSTX_P                    : inout   std_logic;
    USB1_SSTX_P                    : inout   std_logic
  );
end Mercury_KX2_ST1;

architecture rtl of Mercury_KX2_ST1 is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Mercury_KX2 is
    port (
      SYS_CLK_clk_p       : in     std_logic;
      SYS_CLK_clk_n       : in     std_logic;
      IIC_FPGA_sda_i      : in     std_logic;
      IIC_FPGA_sda_o      : out    std_logic;
      IIC_FPGA_sda_t      : out    std_logic;
      IIC_FPGA_scl_i      : in     std_logic;
      IIC_FPGA_scl_o      : out    std_logic;
      IIC_FPGA_scl_t      : out    std_logic;
      IIC_sda_i           : in     std_logic;
      IIC_sda_o           : out    std_logic;
      IIC_sda_t           : out    std_logic;
      IIC_scl_i           : in     std_logic;
      IIC_scl_o           : out    std_logic;
      IIC_scl_t           : out    std_logic;
      LED_N               : out    std_logic_vector(3 downto 0);
      CLK50               : out    std_logic;
      CLK100              : out    std_logic;
      CLK200              : out    std_logic;
      DDR3_dq             : inout  std_logic_vector(63 downto 0);
      DDR3_dqs_p          : inout  std_logic_vector(7 downto 0);
      DDR3_dqs_n          : inout  std_logic_vector(7 downto 0);
      DDR3_addr           : out    std_logic_vector(DDR3_ADDR_WIDTH-1 downto 0);
      DDR3_ba             : out    std_logic_vector(2 downto 0);
      DDR3_ras_n          : out    std_logic;
      DDR3_cas_n          : out    std_logic;
      DDR3_we_n           : out    std_logic;
      DDR3_reset_n        : out    std_logic;
      DDR3_ck_p           : out    std_logic_vector(0 downto 0);
      DDR3_ck_n           : out    std_logic_vector(0 downto 0);
      DDR3_cke            : out    std_logic_vector(0 downto 0);
      DDR3_dm             : out    std_logic_vector(7 downto 0);
      DDR3_odt            : out    std_logic_vector(0 downto 0);
      DDR3_cs_n           : out    std_logic_vector(0 downto 0);
      MDIO_mdc            : out    std_logic;
      MDIO_mdio_i         : in     std_logic;
      MDIO_mdio_o         : out    std_logic;
      MDIO_mdio_t         : out    std_logic;
      RGMII_rd            : in     std_logic_vector(3 downto 0);
      RGMII_rx_ctl        : in     std_logic;
      RGMII_rxc           : in     std_logic;
      RGMII_td            : out    std_logic_vector(3 downto 0);
      RGMII_tx_ctl        : out    std_logic;
      RGMII_txc           : out    std_logic;
      QSPI_io0_i          : in     std_logic;
      QSPI_io0_o          : out    std_logic;
      QSPI_io0_t          : out    std_logic;
      QSPI_io1_i          : in     std_logic;
      QSPI_io1_o          : out    std_logic;
      QSPI_io1_t          : out    std_logic;
      QSPI_io2_i          : in     std_logic;
      QSPI_io2_o          : out    std_logic;
      QSPI_io2_t          : out    std_logic;
      QSPI_io3_i          : in     std_logic;
      QSPI_io3_o          : out    std_logic;
      QSPI_io3_t          : out    std_logic;
      QSPI_ss_i           : in     std_logic;
      QSPI_ss_o           : out    std_logic;
      QSPI_ss_t           : out    std_logic;
      SYS_RST_N           : in     std_logic;
      UART_rxd            : in     std_logic;
      UART_txd            : out    std_logic;
      UART_FTDI_KX2_rxd   : in     std_logic;
      UART_FTDI_KX2_txd   : out    std_logic
    );
    
  end component Mercury_KX2;
  
  component IOBUF is
    port (
      I : in STD_LOGIC;
      O : out STD_LOGIC;
      T : in STD_LOGIC;
      IO : inout STD_LOGIC
    );
  end component IOBUF;

  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal IIC_FPGA_sda_i   : std_logic;
  signal IIC_FPGA_sda_o   : std_logic;
  signal IIC_FPGA_sda_t   : std_logic;
  signal IIC_FPGA_scl_i   : std_logic;
  signal IIC_FPGA_scl_o   : std_logic;
  signal IIC_FPGA_scl_t   : std_logic;
  signal IIC_sda_i        : std_logic;
  signal IIC_sda_o        : std_logic;
  signal IIC_sda_t        : std_logic;
  signal IIC_scl_i        : std_logic;
  signal IIC_scl_o        : std_logic;
  signal IIC_scl_t        : std_logic;
  signal LED_N            : std_logic_vector(3 downto 0);
  signal CLK50            : std_logic;
  signal CLK100           : std_logic;
  signal CLK200           : std_logic;
  signal QSPI_io0_i       : std_logic;
  signal QSPI_io0_o       : std_logic;
  signal QSPI_io0_t       : std_logic;
  signal QSPI_io1_i       : std_logic;
  signal QSPI_io1_o       : std_logic;
  signal QSPI_io1_t       : std_logic;
  signal QSPI_io2_i       : std_logic;
  signal QSPI_io2_o       : std_logic;
  signal QSPI_io2_t       : std_logic;
  signal QSPI_io3_i       : std_logic;
  signal QSPI_io3_o       : std_logic;
  signal QSPI_io3_t       : std_logic;
  signal QSPI_ss_i        : std_logic;
  signal QSPI_ss_o        : std_logic;
  signal QSPI_ss_t        : std_logic;
  signal MDIO_mdc         : std_logic;
  signal MDIO_mdio_i      : std_logic;
  signal MDIO_mdio_o      : std_logic;
  signal MDIO_mdio_t      : std_logic;
  signal RGMII_rd         : std_logic_vector(3 downto 0);
  signal RGMII_td         : std_logic_vector(3 downto 0);
  signal RGMII_rx_ctl     : std_logic;
  signal RGMII_rxc        : std_logic;
  signal RGMII_tx_ctl     : std_logic;
  signal RGMII_txc        : std_logic;
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Mercury_KX2_i: component Mercury_KX2
    port map (
      SYS_CLK_clk_p        => Clk200_P,
      SYS_CLK_clk_n        => Clk200_N,
      IIC_FPGA_sda_i       => IIC_FPGA_sda_i,
      IIC_FPGA_sda_o       => IIC_FPGA_sda_o,
      IIC_FPGA_sda_t       => IIC_FPGA_sda_t,
      IIC_FPGA_scl_i       => IIC_FPGA_scl_i,
      IIC_FPGA_scl_o       => IIC_FPGA_scl_o,
      IIC_FPGA_scl_t       => IIC_FPGA_scl_t,
      IIC_sda_i            => IIC_sda_i,
      IIC_sda_o            => IIC_sda_o,
      IIC_sda_t            => IIC_sda_t,
      IIC_scl_i            => IIC_scl_i,
      IIC_scl_o            => IIC_scl_o,
      IIC_scl_t            => IIC_scl_t,
      LED_N                => LED_N,
      CLK50                => CLK50,
      CLK100               => CLK100,
      CLK200               => CLK200,
      DDR3_dq              => DDR3_DQ,
      DDR3_dqs_p           => DDR3_DQS_P,
      DDR3_dqs_n           => DDR3_DQS_N,
      DDR3_addr            => DDR3_A (DDR3_ADDR_WIDTH-1 downto 0),
      DDR3_ba              => DDR3_BA,
      DDR3_ras_n           => DDR3_RAS_N,
      DDR3_cas_n           => DDR3_CAS_N,
      DDR3_we_n            => DDR3_WE_N,
      DDR3_reset_n         => DDR3_RST_N,
      DDR3_ck_p            => DDR3_CK_P,
      DDR3_ck_n            => DDR3_CK_N,
      DDR3_cke             => DDR3_CKE,
      DDR3_dm              => DDR3_DM,
      DDR3_odt             => DDR3_ODT,
      DDR3_cs_n            => DDR3_CS_N,
      MDIO_mdc             => FPGA_MDC_PUDC_N,
      MDIO_mdio_i          => MDIO_mdio_i,
      MDIO_mdio_o          => MDIO_mdio_o,
      MDIO_mdio_t          => MDIO_mdio_t,
      RGMII_rd             => ETH0_RX_D,
      RGMII_rx_ctl         => ETH0_RX_CTL,
      RGMII_rxc            => ETH0_RX_CLK,
      RGMII_td             => ETH0_TX_D,
      RGMII_tx_ctl         => ETH0_TX_CTL,
      RGMII_txc            => ETH0_TX_CLK,
      QSPI_io0_i           => QSPI_io0_i,
      QSPI_io0_o           => QSPI_io0_o,
      QSPI_io0_t           => QSPI_io0_t,
      QSPI_io1_i           => QSPI_io1_i,
      QSPI_io1_o           => QSPI_io1_o,
      QSPI_io1_t           => QSPI_io1_t,
      QSPI_io2_i           => QSPI_io2_i,
      QSPI_io2_o           => QSPI_io2_o,
      QSPI_io2_t           => QSPI_io2_t,
      QSPI_io3_i           => QSPI_io3_i,
      QSPI_io3_o           => QSPI_io3_o,
      QSPI_io3_t           => QSPI_io3_t,
      QSPI_ss_i            => QSPI_ss_i,
      QSPI_ss_o            => QSPI_ss_o,
      QSPI_ss_t            => QSPI_ss_t,
      SYS_RST_N            => Rst_N,
      UART_rxd             => UART_RX,
      UART_txd             => UART_TX,
      UART_FTDI_KX2_rxd    => FTDI_UART_RX,
      UART_FTDI_KX2_txd    => FTDI_UART_TX
    );
  
  IIC_FPGA_scl_iobuf: component IOBUF
    port map (
      I => IIC_FPGA_scl_o,
      IO => I2C_SCL_FPGA,
      O => IIC_FPGA_scl_i,
      T => IIC_FPGA_scl_t
    );
  
  IIC_FPGA_sda_iobuf: component IOBUF
    port map (
      I => IIC_FPGA_sda_o,
      IO => I2C_SDA_FPGA,
      O => IIC_FPGA_sda_i,
      T => IIC_FPGA_sda_t
    );
  
  IIC_scl_iobuf: component IOBUF
    port map (
      I => IIC_scl_o,
      IO => I2C_SCL,
      O => IIC_scl_i,
      T => IIC_scl_t
    );
  
  IIC_sda_iobuf: component IOBUF
    port map (
      I => IIC_sda_o,
      IO => I2C_SDA,
      O => IIC_sda_i,
      T => IIC_sda_t
    );
  
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  LED0_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  LED1_N <= '0' when LED_N(0) = '0' else 'Z';
  LED2_N <= '0' when LED_N(1) = '0' else 'Z';
  LED3_N <= '0' when LED_N(2) = '0' else 'Z';
  
  DDR3_VSEL <= 'Z'; -- assign to '0' for DDR3PL 1.35 V operation
  
  mdio_MDIO_iobuf: component IOBUF
      port map (
      I => MDIO_mdio_o,
      IO => FPGA_MDIO_EMCCLK,
      O => MDIO_mdio_i,
      T => MDIO_mdio_t
  );
  
  QSPI_io0_iobuf: component IOBUF
  	port map (
  	I => QSPI_io0_o,
  	IO => FLASH_DI,
  	O => QSPI_io0_i,
  	T => QSPI_io0_t
  );
  QSPI_io1_iobuf: component IOBUF
      port map (
      I => QSPI_io1_o,
      IO => FLASH_DO,
      O => QSPI_io1_i,
      T => QSPI_io1_t
  );
  QSPI_io2_iobuf: component IOBUF
      port map (
      I => QSPI_io2_o,
      IO => FLASH_WP_N,
      O => QSPI_io2_i,
      T => QSPI_io2_t
  );
  QSPI_io3_iobuf: component IOBUF
      port map (
      I => QSPI_io3_o,
      IO => FLASH_HOLD_N,
      O => QSPI_io3_i,
      T => QSPI_io3_t
  );
  QSPI_ss_iobuf_0: component IOBUF
      port map (
      I => QSPI_ss_o,
      IO => FLASH_CS_N,
      O => QSPI_ss_i,
      T => QSPI_ss_t
  );
  FPGA_CCLK <= 'Z'; -- startup2 block is used
  
end rtl;
