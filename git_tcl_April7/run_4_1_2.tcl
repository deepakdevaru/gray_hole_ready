#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     30                          ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1000                      ;# X dimension of topography
set val(y)      2000                      ;# Y dimension of topography
set val(stop)   1000                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 9 nodes
set n0 [$ns node]
$n0 set X_ 125
$n0 set Y_ 250
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 875
$n1 set Y_ 250
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 50
$n2 set Y_ 125
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 375
$n3 set Y_ 1250
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 875
$n4 set Y_ 1750
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 700
$n5 set Y_ 1750
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 725
$n6 set Y_ 1150
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 875
$n7 set Y_ 1250
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 900
$n8 set Y_ 1150
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 875
$n9 set Y_ 1000
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 50
$n10 set Y_ 750
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 200
$n11 set Y_ 50
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 250
$n12 set Y_ 750
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 875
$n13 set Y_ 1500
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 700
$n14 set Y_ 400
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 125
$n15 set Y_ 1000
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 750
$n16 set Y_ 500
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 125
$n17 set Y_ 1750
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 250
$n18 set Y_ 400
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 875
$n19 set Y_ 500
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20
set n20 [$ns node]
$n19 set X_ 400
$n19 set Y_ 500
$n19 set Z_ 0.0
$ns initial_node_pos $n20 20
set n21 [$ns node]
$n19 set X_ 750
$n19 set Y_ 1800
$n19 set Z_ 0.0
$ns initial_node_pos $n21 20
set n22 [$ns node]
$n19 set X_ 750
$n19 set Y_ 250
$n19 set Z_ 0.0
$ns initial_node_pos $n22 20
set n23 [$ns node]
$n19 set X_ 700
$n19 set Y_ 1350
$n19 set Z_ 0.0
$ns initial_node_pos $n23 20
set n24 [$ns node]
$n19 set X_ 700
$n19 set Y_ 750
$n19 set Z_ 0.0
$ns initial_node_pos $n24 20
set n25 [$ns node]
$n19 set X_ 750
$n19 set Y_ 1350
$n19 set Z_ 0.0
$ns initial_node_pos $n25 20
set n26 [$ns node]
$n19 set X_ 800
$n19 set Y_ 125
$n19 set Z_ 0.0
$ns initial_node_pos $n26 20
set n27 [$ns node]
$n19 set X_ 750
$n19 set Y_ 1000
$n19 set Z_ 0.0
$ns initial_node_pos $n27 20
set n28 [$ns node]
$n19 set X_ 875
$n19 set Y_ 1125
$n19 set Z_ 0.0
$ns initial_node_pos $n28 20
set n29 [$ns node]
$n19 set X_ 500
$n19 set Y_ 1500
$n19 set Z_ 0.0
$ns initial_node_pos $n29 20

#===================================
#        Generate movement          
#===================================
$ns at 10 " $n0 setdest 875 1750 4 " 
$ns at 10 " $n1 setdest 125 1250 4 " 
$ns at 10 " $n2 setdest 800 1650 4 " 
$ns at 10 " $n3 setdest 750 300 4 "
$ns at 10 " $n4 setdest 320 750 4 " 
$ns at 10 " $n5 setdest 180 825 4 " 
$ns at 10 " $n6 setdest 75 50 4 " 
$ns at 10 " $n7 setdest 180 600 4 " 
$ns at 10 " $n8 setdest 320 450 4 "
$ns at 10 " $n9 setdest 180 50 4 "
$ns at 10 " $n10 setdest 625 1750 4 "
$ns at 10 " $n11 setdest 880 1600 4 "
$ns at 10 " $n12 setdest 870 500 4 "
$ns at 10 " $n13 setdest 75 825 4 "
$ns at 10 " $n14 setdest 75 1325 4 "
$ns at 10 " $n15 setdest 750 1750 4 "
$ns at 10 " $n16 setdest 125 1650 4 "
$ns at 10 " $n17 setdest 870 1350 4 "
$ns at 10 " $n18 setdest 900 1900 4 "
$ns at 10 " $n19 setdest 180 1750 4 "
$ns at 10 " $n20 setdest 850 250 4 " 
$ns at 10 " $n21 setdest 100 750 4 " 
$ns at 10 " $n22 setdest 125 1500 4 " 
$ns at 10 " $n23 setdest 75 400 4 " 
$ns at 10 " $n24 setdest 75 1750 4 " 
$ns at 10 " $n25 setdest 125 250 4 " 
$ns at 10 " $n26 setdest 250 1325 4 " 
$ns at 10 " $n27 setdest 125 500 4 " 
$ns at 10 " $n28 setdest 810 300 4 " 
$ns at 10 " $n29 setdest 50 500 4 "  

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set null0 [new Agent/Null]
$ns attach-agent $n10 $null0
$ns connect $udp0 $null0
$udp0 set packetSize_ 512
#$udp0 set fid_ 2

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1
set null1 [new Agent/Null]
$ns attach-agent $n24 $null1
$ns connect $udp1 $null1
$udp1 set packetSize_ 512

set udp2 [new Agent/UDP]
$ns attach-agent $n2 $udp2
set null2 [new Agent/Null]
$ns attach-agent $n18 $null2
$ns connect $udp2 $null2
$udp2 set packetSize_ 512

set udp3 [new Agent/UDP]
$ns attach-agent $n3 $udp3
set null3 [new Agent/Null]
$ns attach-agent $n12 $null3
$ns connect $udp3 $null3
$udp3 set packetSize_ 512

set udp4 [new Agent/UDP]
$ns attach-agent $n4 $udp4
set null4 [new Agent/Null]
$ns attach-agent $n7 $null4
$ns connect $udp4 $null4
$udp4 set packetSize_ 512

set udp5 [new Agent/UDP]
$ns attach-agent $n5 $udp5
set null5 [new Agent/Null]
$ns attach-agent $n6 $null5
$ns connect $udp5 $null5
$udp5 set packetSize_ 512

set udp6 [new Agent/UDP]
$ns attach-agent $n8 $udp6
set null6 [new Agent/Null]
$ns attach-agent $n23 $null6
$ns connect $udp6 $null6
$udp6 set packetSize_ 512

set udp7 [new Agent/UDP]
$ns attach-agent $n9 $udp7
set null7 [new Agent/Null]
$ns attach-agent $n29 $null7
$ns connect $udp7 $null7
$udp7 set packetSize_ 512

set udp8 [new Agent/UDP]
$ns attach-agent $n11 $udp8
set null8 [new Agent/Null]
$ns attach-agent $n28 $null8
$ns connect $udp8 $null8
$udp8 set packetSize_ 512

set udp9 [new Agent/UDP]
$ns attach-agent $n13 $udp9
set null9 [new Agent/Null]
$ns attach-agent $n27 $null9
$ns connect $udp9 $null9
$udp9 set packetSize_ 512

set udp10 [new Agent/UDP]
$ns attach-agent $n14 $udp10
set null10 [new Agent/Null]
$ns attach-agent $n26 $null10
$ns connect $udp10 $null10
$udp10 set packetSize_ 512

set udp11 [new Agent/UDP]
$ns attach-agent $n15 $udp11
set null11 [new Agent/Null]
$ns attach-agent $n17 $null11
$ns connect $udp11 $null11
$udp11 set packetSize_ 512

set udp12 [new Agent/UDP]
$ns attach-agent $n16 $udp12
set null12 [new Agent/Null]
$ns attach-agent $n26 $null12
$ns connect $udp12 $null12
$udp12 set packetSize_ 512

set udp13 [new Agent/UDP]
$ns attach-agent $n19 $udp13
set null13 [new Agent/Null]
$ns attach-agent $n14 $null13
$ns connect $udp13 $null13
$udp13 set packetSize_ 512

set udp14 [new Agent/UDP]
$ns attach-agent $n20 $udp14
set null14 [new Agent/Null]
$ns attach-agent $n3 $null14
$ns connect $udp14 $null14
$udp14 set packetSize_ 512

set udp15 [new Agent/UDP]
$ns attach-agent $n21 $udp15
set null15 [new Agent/Null]
$ns attach-agent $n9 $null15
$ns connect $udp15 $null15
$udp15 set packetSize_ 512

set udp16 [new Agent/UDP]
$ns attach-agent $n22 $udp16
set null16 [new Agent/Null]
$ns attach-agent $n24 $null16
$ns connect $udp16 $null16
$udp16 set packetSize_ 512

set udp17 [new Agent/UDP]
$ns attach-agent $n25 $udp17
set null17 [new Agent/Null]
$ns attach-agent $n5 $null17
$ns connect $udp17 $null17
$udp17 set packetSize_ 512

set udp18 [new Agent/UDP]
$ns attach-agent $n28 $udp18
set null18 [new Agent/Null]
$ns attach-agent $n20 $null18
$ns connect $udp18 $null18
$udp18 set packetSize_ 512

set udp19 [new Agent/UDP]
$ns attach-agent $n29 $udp19
set null19 [new Agent/Null]
$ns attach-agent $n7 $null19
$ns connect $udp19 $null19
$udp19 set packetSize_ 512


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 1500
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ 

$ns at 10 "[$n0 set ragent_] malicious"
$ns at 10 "$n0 label active_attacker"
$ns at 50 "[$n0 set ragent_] nonmalicious"
$ns at 10 "$n0 label attacked_once"

$ns at 50.0 "$cbr0 start"
$ns at 229 "$cbr0 stop"

$ns at 230 "[$n0 set ragent_] malicious"
$ns at 230 "$n0 label active_attacker"
$ns at 250 "[$n0 set ragent_] nonmalicious"
$ns at 250 "$n0 label attacked_twice"

$ns at 250.1 "$cbr0 start"
$ns at 629 "$cbr0 stop"

$ns at 630 "[$n0 set ragent_] malicious"
$ns at 630 "$n0 label active_attacker"
$ns at 680 "[$n0 set ragent_] nonmalicious"
$ns at 680 "$n0 label attacked_thrice"

$ns at 680.1 "$cbr0 start"
$ns at 874 "$cbr0 stop"

$ns at 875 "[$n0 set ragent_] malicious"
$ns at 875 "$n0 label active_attacker"
$ns at 900 "[$n0 set ragent_] nonmalicious"
$ns at 900 "$n0 label attacked_quattro"

$ns at 900.1 "$cbr0 start"
$ns at 1000 "$cbr0 stop"

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 1500
$cbr1 set rate_ 1.0Mb
$cbr1 set random_ 
$ns at 10.0 "$cbr1 start"
$ns at 29.9 "$cbr1 stop"

$ns at 30 "[$n1 set ragent_] malicious"
$ns at 30 "$n1 label active_attacker"
$ns at 90 "[$n1 set ragent_] nonmalicious"
$ns at 90 "$n1 label attacked_once"

$ns at 90.1 "$cbr1 start"
$ns at 374.9 "$cbr1 stop"

$ns at 375 "[$n1 set ragent_] malicious"
$ns at 375 "$n1 label active_attacker"
$ns at 400 "[$n1 set ragent_] nonmalicious"
$ns at 400 "$n1 label attacked_twice"

$ns at 400.1 "$cbr1 start"
$ns at 749.9 "$cbr1 stop"

$ns at 750 "[$n1 set ragent_] malicious"
$ns at 750 "$n1 label active_attacker"
$ns at 780 "[$n1 set ragent_] nonmalicious"
$ns at 780 "$n1 label attacked_thrice"

$ns at 780.1 "$cbr1 start"
$ns at 1000 "$cbr1 stop"

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packetSize_ 1500
$cbr2 set rate_ 1.0Mb
$cbr2 set random_ 

$ns at 10.0 "$cbr2 start"
$ns at 549.9 "$cbr2 stop"

$ns at 550 "[$n2 set ragent_] malicious"
$ns at 550 "$n2 label active_attacker"
$ns at 610 "[$n2 set ragent_] nonmalicious"
$ns at 610 "$n2 label attacked_once"

$ns at 610.1 "$cbr2 start"
$ns at 849.9 "$cbr2 stop"

$ns at 850 "[$n2 set ragent_] malicious"
$ns at 850 "$n2 label active_attacker"
$ns at 900 "[$n2 set ragent_] nonmalicious"
$ns at 900 "$n2 label attacked_twice"

$ns at 900.1 "$cbr2 start"
$ns at 1000 "$cbr2 stop"

set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packetSize_ 1500
$cbr3 set rate_ 1.0Mb
$cbr3 set random_ 
$ns at 10.0 "$cbr3 start"
$ns at 1000 "$cbr3 stop"

set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packetSize_ 1500
$cbr4 set rate_ 1.0Mb
$cbr4 set random_ 
$ns at 10.0 "$cbr4 start"
$ns at 1000 "$cbr4 stop"

set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$cbr5 set packetSize_ 1500
$cbr5 set rate_ 1.0Mb
$cbr5 set random_ 
$ns at 10.0 "$cbr5 start"
$ns at 1000 "$cbr5 stop"

set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packetSize_ 1500
$cbr6 set rate_ 1.0Mb
$cbr6 set random_ 
$ns at 10.0 "$cbr6 start"
$ns at 1000 "$cbr6 stop"

set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp7
$cbr7 set packetSize_ 1500
$cbr7 set rate_ 1.0Mb
$cbr7 set random_ 
$ns at 10.0 "$cbr7 start"
$ns at 1000 "$cbr7 stop"

set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp8
$cbr8 set packetSize_ 1500
$cbr8 set rate_ 1.0Mb
$cbr8 set random_ 
$ns at 10.0 "$cbr8 start"
$ns at 1000 "$cbr8 stop"

set cbr9 [new Application/Traffic/CBR]
$cbr9 attach-agent $udp9
$cbr9 set packetSize_ 1500
$cbr9 set rate_ 1.0Mb
$cbr9 set random_ 
$ns at 10.0 "$cbr9 start"
$ns at 1000 "$cbr9 stop"

set cbr10 [new Application/Traffic/CBR]
$cbr10 attach-agent $udp10
$cbr10 set packetSize_ 1500
$cbr10 set rate_ 1.0Mb
$cbr10 set random_ 
$ns at 10.0 "$cbr10 start"
$ns at 1000 "$cbr10 stop"

set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp11
$cbr11 set packetSize_ 1500
$cbr11 set rate_ 1.0Mb
$cbr11 set random_ 
$ns at 10.0 "$cbr11 start"
$ns at 1000 "$cbr11 stop"

set cbr12 [new Application/Traffic/CBR]
$cbr12 attach-agent $udp12
$cbr12 set packetSize_ 1500
$cbr12 set rate_ 1.0Mb
$cbr12 set random_
 
$ns at 10.0 "$cbr12 start"
$ns at 149.9 "$cbr12 stop"

$ns at 150 "[$n16 set ragent_] malicious"
$ns at 150 "$n16 label active_attacker"
$ns at 180 "[$n16 set ragent_] nonmalicious"
$ns at 180 "$n16 label attacked_once"

$ns at 180.1 "$cbr12 start"
$ns at 674.9 "$cbr12 stop"

$ns at 675 "[$n16 set ragent_] malicious"
$ns at 675 "$n16 label active_attacker"
$ns at 700 "[$n16 set ragent_] nonmalicious"
$ns at 700 "$n16 label attacked_twice"

$ns at 700.1 "$cbr12 start"
$ns at 824.9 "$cbr12 stop"

$ns at 825 "[$n16 set ragent_] malicious"
$ns at 825 "$n16 label active_attacker"
$ns at 850 "[$n16 set ragent_] nonmalicious"
$ns at 850 "$n16 label attacked_thrice"

$ns at 850.1 "$cbr12 start"
$ns at 1000 "$cbr12 stop"

set cbr13 [new Application/Traffic/CBR]
$cbr13 attach-agent $udp13
$cbr13 set packetSize_ 1500
$cbr13 set rate_ 1.0Mb
$cbr13 set random_ 
$ns at 10.0 "$cbr13 start"
$ns at 1000 "$cbr13 stop"

set cbr14 [new Application/Traffic/CBR]
$cbr14 attach-agent $udp14
$cbr14 set packetSize_ 1500
$cbr14 set rate_ 1.0Mb
$cbr14 set random_ 
$ns at 10.0 "$cbr14 start"
$ns at 1000 "$cbr14 stop"

set cbr15 [new Application/Traffic/CBR]
$cbr15 attach-agent $udp15
$cbr15 set packetSize_ 1500
$cbr15 set rate_ 1.0Mb
$cbr15 set random_ 
$ns at 10.0 "$cbr15 start"
$ns at 1000 "$cbr15 stop"

set cbr16 [new Application/Traffic/CBR]
$cbr16 attach-agent $udp16
$cbr16 set packetSize_ 1500
$cbr16 set rate_ 1.0Mb
$cbr16 set random_ 
$ns at 10.0 "$cbr16 start"
$ns at 1000 "$cbr16 stop"

set cbr17 [new Application/Traffic/CBR]
$cbr17 attach-agent $udp17
$cbr17 set packetSize_ 1500
$cbr17 set rate_ 1.0Mb
$cbr17 set random_ 
$ns at 10.0 "$cbr17 start"
$ns at 79.9 "$cbr17 stop"

$ns at 80 "[$n25 set ragent_] malicious"
$ns at 80 "$n25 label active_attacker"
$ns at 110 "[$n25 set ragent_] nonmalicious"
$ns at 110 "$n25 label attacked_once"

$ns at 110.1 "$cbr17 start"
$ns at 249.9 "$cbr17 stop"

$ns at 250 "[$n25 set ragent_] malicious"
$ns at 250 "$n25 label active_attacker"
$ns at 300 "[$n25 set ragent_] nonmalicious"
$ns at 300 "$n25 label attacked_twice"

$ns at 300.1 "$cbr17 start"
$ns at 749.9 "$cbr17 stop"

$ns at 750 "[$n25 set ragent_] malicious"
$ns at 750 "$n25 label active_attacker"
$ns at 780 "[$n25 set ragent_] nonmalicious"
$ns at 780 "$n25 label attacked_thrice"

$ns at 780.1 "$cbr17 start"
$ns at 979.9 "$cbr17 stop"

$ns at 980 "[$n25 set ragent_] malicious"
$ns at 980 "$n25 label active_attacker"
$ns at 1000 "[$n25 set ragent_] nonmalicious"
$ns at 1000 "$n25 label attacked_quattro"

set cbr18 [new Application/Traffic/CBR]
$cbr18 attach-agent $udp18
$cbr18 set packetSize_ 1500
$cbr18 set rate_ 1.0Mb
$cbr18 set random_

$ns at 10.0 "$cbr18 start"
$ns at 709.9 "$cbr18 stop"

$ns at 710 "[$n28 set ragent_] malicious"
$ns at 710 "$n28 label active_attacker"
$ns at 750 "[$n28 set ragent_] nonmalicious"
$ns at 750 "$n28 label attacked_once"

$ns at 750.1 "$cbr18 start"
$ns at 919.9 "$cbr18 stop"

$ns at 920 "[$n28 set ragent_] malicious"
$ns at 920 "$n28 label active_attacker"
$ns at 950 "[$n28 set ragent_] nonmalicious"
$ns at 950 "$n28 label attacked_twice"

$ns at 950.1 "$cbr18 start"
$ns at 1000 "$cbr18 stop"

set cbr19 [new Application/Traffic/CBR]
$cbr19 attach-agent $udp19
$cbr19 set packetSize_ 1500
$cbr19 set rate_ 1.0Mb
$cbr19 set random_ 
$ns at 10.0 "$cbr19 start"
$ns at 1000 "$cbr19 stop"

#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run








