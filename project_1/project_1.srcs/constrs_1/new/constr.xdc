# This file is a general .xdc for the Basys3 rev B board
# To use it in a project:
# - uncomment the lines corresponding to used pins
# - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 [get_ports {instr[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[0]}]
set_property PACKAGE_PIN V16 [get_ports {instr[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[1]}]
set_property PACKAGE_PIN W16 [get_ports {instr[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[2]}]
set_property PACKAGE_PIN W17 [get_ports {instr[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[3]}]
set_property PACKAGE_PIN W15 [get_ports {instr[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[4]}]
set_property PACKAGE_PIN V15 [get_ports {instr[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[5]}]
set_property PACKAGE_PIN W14 [get_ports {instr[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[6]}]
set_property PACKAGE_PIN W13 [get_ports {instr[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[7]}]
set_property PACKAGE_PIN V2 [get_ports {instr[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[8]}]
set_property PACKAGE_PIN T3 [get_ports {instr[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[9]}]
set_property PACKAGE_PIN T2 [get_ports {instr[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[10]}]
set_property PACKAGE_PIN R3 [get_ports {instr[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instr[11]}]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {instrLed[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[0]}]
set_property PACKAGE_PIN E19 [get_ports {instrLed[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[1]}]
set_property PACKAGE_PIN U19 [get_ports {instrLed[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[2]}]
set_property PACKAGE_PIN V19 [get_ports {instrLed[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[3]}]
set_property PACKAGE_PIN W18 [get_ports {instrLed[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[4]}]
set_property PACKAGE_PIN U15 [get_ports {instrLed[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {instrLed[5]}]
	

#7 catment display
set_property PACKAGE_PIN W7 [get_ports {cat[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[0]}]
set_property PACKAGE_PIN W6 [get_ports {cat[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[1]}]
set_property PACKAGE_PIN U8 [get_ports {cat[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[2]}]
set_property PACKAGE_PIN V8 [get_ports {cat[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[3]}]
set_property PACKAGE_PIN U5 [get_ports {cat[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[4]}]
set_property PACKAGE_PIN V5 [get_ports {cat[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[5]}]
set_property PACKAGE_PIN U7 [get_ports {cat[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cat[6]}]



set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
#Buttons
set_property PACKAGE_PIN U18 [get_ports {reset}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
set_property PACKAGE_PIN W19 [get_ports {ok}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {ok}]
set_property PACKAGE_PIN T17 [get_ports {count}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {count}]

 


