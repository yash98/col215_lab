# Clock signal
Bank = 34, Pin name = ,	Sch name = CLK1KHZ
	set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -period 10 -name sys_clk_pin -waveform {0 5} -add [get_ports clk]

# Switches
  set_property PACKAGE_PIN V17 [get_ports switches[0]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[0]]

  set_property PACKAGE_PIN V16 [get_ports switches[1]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[1]]

  set_property PACKAGE_PIN W16 [get_ports switches[2]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[2]]

  set_property PACKAGE_PIN W17 [get_ports switches[3]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[3]]

  set_property PACKAGE_PIN W15 [get_ports switches[4]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[4]]

  set_property PACKAGE_PIN V15 [get_ports switches[5]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[5]]

  set_property PACKAGE_PIN W14 [get_ports switches[6]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[6]]

  set_property PACKAGE_PIN W13 [get_ports switches[7]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[7]]

  set_property PACKAGE_PIN V2 [get_ports switches[8]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[8]]

  set_property PACKAGE_PIN T3 [get_ports switches[9]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[9]]

  set_property PACKAGE_PIN T2 [get_ports switches[10]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[10]]

  set_property PACKAGE_PIN R3 [get_ports switches[11]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[11]]

	set_property PACKAGE_PIN W2 [get_ports switches[12]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[12]]

	set_property PACKAGE_PIN U1 [get_ports switches[13]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[13]]

	set_property PACKAGE_PIN T1 [get_ports switches[14]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[14]]

	set_property PACKAGE_PIN R2 [get_ports switches[15]]
  set_property IOSTANDARD LVCMOS33 [get_ports switches[15]]

#Push Button
	set_property PACKAGE_PIN T18 [get_ports pb[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports pb[0]]

	set_property PACKAGE_PIN W19 [get_ports pb[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports pb[1]]

	set_property PACKAGE_PIN U18 [get_ports pb[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports pb[2]]

	set_property PACKAGE_PIN T17 [get_ports pb[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports pb[3]]

	set_property PACKAGE_PIN U17 [get_ports pb[4]]
	set_property IOSTANDARD LVCMOS33 [get_ports pb[4]]

	#LEDs
	set_property PACKAGE_PIN U16 [get_ports w_addr_inp[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_inp[0]]

	set_property PACKAGE_PIN E19 [get_ports w_addr_inp[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_inp[1]]

	set_property PACKAGE_PIN U19 [get_ports w_addr_inp[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_inp[2]]

	set_property PACKAGE_PIN V19 [get_ports w_addr_inp[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_inp[3]]

	set_property PACKAGE_PIN W18 [get_ports r_addr_inp[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports r_addr_inp[0]]

	set_property PACKAGE_PIN U15 [get_ports r_addr_inp[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports r_addr_inp[1]]

	set_property PACKAGE_PIN U14 [get_ports r_addr_inp[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports r_addr_inp[2]]

	set_property PACKAGE_PIN V14 [get_ports r_addr_inp[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports r_addr_inp[3]]

	set_property PACKAGE_PIN V13 [get_ports w_addr_crc[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_crc[0]]

	set_property PACKAGE_PIN V3 [get_ports w_addr_crc[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_crc[1]]

	set_property PACKAGE_PIN W3 [get_ports w_addr_crc[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_crc[2]]

	set_property PACKAGE_PIN U3 [get_ports w_addr_crc[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports w_addr_crc[3]]

	set_property PACKAGE_PIN P3 [get_ports reading]
	set_property IOSTANDARD LVCMOS33 [get_ports reading]

	set_property PACKAGE_PIN N3 [get_ports started]
	set_property IOSTANDARD LVCMOS33 [get_ports started]

	set_property PACKAGE_PIN P1 [get_ports rsting]
	set_property IOSTANDARD LVCMOS33 [get_ports rsting]

	set_property PACKAGE_PIN L1 [get_ports done]
	set_property IOSTANDARD LVCMOS33 [get_ports done]

# Cathodes
	set_property PACKAGE_PIN W7 [get_ports cathode[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[0]]

	set_property PACKAGE_PIN W6 [get_ports cathode[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[1]]

	set_property PACKAGE_PIN U8 [get_ports cathode[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[2]]

	set_property PACKAGE_PIN V8 [get_ports cathode[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[3]]

	set_property PACKAGE_PIN U5 [get_ports cathode[4]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[4]]

	set_property PACKAGE_PIN V5 [get_ports cathode[5]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[5]]

	set_property PACKAGE_PIN U7 [get_ports cathode[6]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[6]]

#Anodes
	set_property PACKAGE_PIN U2 [get_ports anode[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[0]]

	set_property PACKAGE_PIN U4 [get_ports anode[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[1]]

	set_property PACKAGE_PIN V4 [get_ports anode[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[2]]

	set_property PACKAGE_PIN W4 [get_ports anode[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[3]]





# Others (BITSTREAM, CONFIG)
	set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
	set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
	set_property CONFIG_MODE SPIx4 [current_design]

	set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

	set_property CONFIG_VOLTAGE 3.3 [current_design]
	set_property CFGBVS VCCO [current_design]
