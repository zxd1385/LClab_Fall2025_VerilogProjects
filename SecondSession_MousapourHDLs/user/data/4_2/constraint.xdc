#            Extension board order 
# ╭----------------------------------------╮
# │  ON                               DIP  │
# │                                        │
# │ ╭─╮  ╭─╮  ╭─╮  ╭─╮  ╭─╮  ╭─╮  ╭─╮  ╭─╮ │                                      
# │ | |  | |  | |  | |  | |  | |  | |  | | │
# │ | |  | |  | |  | |  | |  | |  | |  | | │
# │ |█|  |█|  |█|  |█|  |█|  |█|  |█|  |█| │
# │ ╰─╯  ╰─╯  ╰─╯  ╰─╯  ╰─╯  ╰─╯  ╰─╯  ╰─╯ │                                      
# │  1    2    3    4    5    6    7    8  │                                      
# ╰----------------------------------------╯
#
#
#                Logical order
# ╭----------------------------------------╮
# │ MSB                               LSB  │
# │{DIP[7], DIP[6],  ...  , DIP[1], Dip[0]}│
# ╰----------------------------------------╯
#
# The reversed order is applied on the pins, just
# change the "Dip" in case you named it sth else.

#==================== Dip Switch =====================#
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[0]}]
set_property PACKAGE_PIN J14 [get_ports {Dip[6]}]
set_property PACKAGE_PIN M14 [get_ports {Dip[5]}]
set_property PACKAGE_PIN M15 [get_ports {Dip[4]}]
set_property PACKAGE_PIN L19 [get_ports {Dip[3]}]
set_property PACKAGE_PIN L20 [get_ports {Dip[2]}]
set_property PACKAGE_PIN M19 [get_ports {Dip[1]}]
set_property PACKAGE_PIN M20 [get_ports {Dip[0]}]
#=====================================================#




#                            Extension board order 
# ╭-------------------------------------------------------------------------╮
# │                                                                         │ 
# │   ⟋⎺⎺⎺⎺⎺a⎺⎺⎺⎺⎺⟍    ⟋⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⟍       ⟋⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⟍    ⟋⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⟍   │ 
# │  │ \_________/ │  │ \_________/ │     │ \_________/ │  │ \_________/ │  │
# │  │  │       │  │  │  │       │  │     │  │       │  │  │  │       │  │  │
# │  │f │       │ b│  │  │       │  │     │  │       │  │  │  │       │  │  │
# │  │ ⟋¯¯¯¯¯¯¯¯⟍ │  │ ⟋¯¯¯¯¯¯¯¯⟍ │  ◯  │ ⟋¯¯¯¯¯¯¯¯⟍ │  │ ⟋¯¯¯¯¯¯¯¯⟍ │  │
# │  │ ⟍___g____⟋ │  │ ⟍________⟋ │  ◯  │ ⟍________⟋ │  │ ⟍________⟋ │  │ 
# │  │  │       │  │  │  │       │  │     │  │       │  │  │  │       │  │  │
# │  │e │       │ c│  │  │       │  │     │  │       │  │  │  │       │  │  │ 
# │  │  /¯¯¯¯¯¯¯\  │  │  /¯¯¯¯¯¯¯\  │     │  /¯¯¯¯¯¯¯\  │  │  /¯¯¯¯¯¯¯\  │  │
# │   ⟍_____d_____⟋   ⟍___________⟋      ⟍___________⟋   ⟍___________⟋   │
# │                                                                         │
# │       dig1             dig1                dig2             dig3        │
# ╰-------------------------------------------------------------------------╯
#
#                               Logical order
#                     ╭--------------------------------╮
#                     │ MSB                       LSB  │
#                     │{dig[3], dig[2], dig[1], dig[0]}│
#                     ╰--------------------------------╯
#               
#                 The reversed order is applied on the pins, just
#                 change the "Dip" in case you named it sth else.



#=============== 7-Seg Digit Enable ================#
set_property IOSTANDARD LVCMOS33 [get_ports {Dig[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dig[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dig[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dig[0]}]
set_property PACKAGE_PIN D20 [get_ports {Dig[3]}]
set_property PACKAGE_PIN D19 [get_ports {Dig[2]}]
set_property PACKAGE_PIN G20 [get_ports {Dig[1]}]
set_property PACKAGE_PIN B19 [get_ports {Dig[0]}]


#=================== Segments ===================#
set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property IOSTANDARD LVCMOS33 [get_ports {g}]
set_property IOSTANDARD LVCMOS33 [get_ports dp]
set_property PACKAGE_PIN F16 [get_ports {a}]
set_property PACKAGE_PIN F17 [get_ports {b}]
set_property PACKAGE_PIN H15 [get_ports {c}]
set_property PACKAGE_PIN G15 [get_ports {d}]
set_property PACKAGE_PIN J18 [get_ports {e}]
set_property PACKAGE_PIN H18 [get_ports {f}]
set_property PACKAGE_PIN H16 [get_ports {g}]
set_property PACKAGE_PIN H17 [get_ports dp]



#======================== LED ========================#

