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
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Dip[0]}]
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


#=================== Segments ===================#



#======================== LED ========================#
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN B20 [get_ports {LED[6]}]
set_property PACKAGE_PIN E17 [get_ports {LED[5]}]
set_property PACKAGE_PIN D18 [get_ports {LED[4]}]
set_property PACKAGE_PIN E18 [get_ports {LED[3]}]
set_property PACKAGE_PIN E19 [get_ports {LED[2]}]
set_property PACKAGE_PIN G17 [get_ports {LED[1]}]
set_property PACKAGE_PIN G18 [get_ports {LED[0]}]


#======================== Push Button ========================#
