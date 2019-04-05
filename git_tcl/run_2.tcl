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
set val(nn)     20                          ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1100                      ;# X dimension of topography
set val(y)      1100                      ;# Y dimension of topography
set val(stop)   300                         ;# time of simulation end

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
$n0 set X_ 100
$n0 set Y_ 800
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 800
$n1 set Y_ 300
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 100
$n2 set Y_ 500
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 900
$n3 set Y_ 100
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 400
$n4 set Y_ 900
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 1000
$n5 set Y_ 1000
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 400
$n6 set Y_ 100
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 800
$n7 set Y_ 800
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 500
$n8 set Y_ 500
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 900
$n9 set Y_ 700
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 400
$n10 set Y_ 400
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 0
$n11 set Y_ 1000
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 800
$n12 set Y_ 500
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 300
$n13 set Y_ 200
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 100
$n14 set Y_ 200
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 500
$n15 set Y_ 200
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 200
$n16 set Y_ 700
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 0
$n17 set Y_ 500
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 800
$n18 set Y_ 0
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 600
$n19 set Y_ 700
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20

#===================================
#        Generate movement          
#===================================
$ns at 10 " $n0 setdest 500 800 1.1 " 
$ns at 10 " $n1 setdest 100 800 1.1 " 
$ns at 10 " $n2 setdest 700 800 1.1 " 
$ns at 10 " $n3 setdest 900 200 1.1 "
$ns at 10 " $n4 setdest 600 100 1.1 " 
$ns at 10 " $n5 setdest 600 1000 1.1 " 
$ns at 10 " $n6 setdest 600 200 1.1 " 
$ns at 10 " $n7 setdest 700 200 1.1 " 
$ns at 10 " $n8 setdest 700 300 1.1 "
$ns at 10 " $n9 setdest 900 400 1.1 "
$ns at 10 " $n10 setdest 900 700 1.1 "
$ns at 10 " $n11 setdest 100 500 1.1 "
$ns at 10 " $n12 setdest 1000 600 1.1 "
$ns at 10 " $n13 setdest 200 1000 1.1 "
$ns at 10 " $n14 setdest 1000 800 1.1 "
$ns at 10 " $n15 setdest 200 500 1.1 "
$ns at 10 " $n16 setdest 200 600 1.1 "
$ns at 10 " $n17 setdest 600 800 1.1 "
$ns at 10 " $n18 setdest 800 200 1.1 "
$ns at 10 " $n19 setdest 600 300 1.1 " 

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set null0 [new Agent/Null]
$ns attach-agent $n14 $null0
$ns connect $udp0 $null0
$udp0 set packetSize_ 512
#$udp0 set fid_ 2

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1
set null1 [new Agent/Null]
$ns attach-agent $n15 $null1
$ns connect $udp1 $null1
$udp1 set packetSize_ 512

set udp2 [new Agent/UDP]
$ns attach-agent $n11 $udp2
set null2 [new Agent/Null]
$ns attach-agent $n16 $null2
$ns connect $udp2 $null2
$udp2 set packetSize_ 512

set udp3 [new Agent/UDP]
$ns attach-agent $n19 $udp3
set null3 [new Agent/Null]
$ns attach-agent $n3 $null3
$ns connect $udp3 $null3
$udp3 set packetSize_ 512

set udp4 [new Agent/UDP]
$ns attach-agent $n17 $udp4
set null4 [new Agent/Null]
$ns attach-agent $n10 $null4
$ns connect $udp4 $null4
$udp4 set packetSize_ 512

set udp5 [new Agent/UDP]
$ns attach-agent $n8 $udp5
set null5 [new Agent/Null]
$ns attach-agent $n13 $null5
$ns connect $udp5 $null5
$udp5 set packetSize_ 512

set udp6 [new Agent/UDP]
$ns attach-agent $n5 $udp6
set null6 [new Agent/Null]
$ns attach-agent $n12 $null6
$ns connect $udp6 $null6
$udp6 set packetSize_ 512

set udp7 [new Agent/UDP]
$ns attach-agent $n4 $udp7
set null7 [new Agent/Null]
$ns attach-agent $n9 $null7
$ns connect $udp7 $null7
$udp7 set packetSize_ 512

set udp8 [new Agent/UDP]
$ns attach-agent $n18 $udp8
set null8 [new Agent/Null]
$ns attach-agent $n6 $null8
$ns connect $udp8 $null8
$udp8 set packetSize_ 512

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 1500
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ 
$ns at 10.0 "$cbr0 start"
$ns at 120 "[$n2 set ragent_] malicious"
$ns at 120 "$n2 label attacker"
$ns at 150 "[$n2 set ragent_] nonmalicious"
$ns at 300 "$cbr0 stop"

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 1500
$cbr1 set rate_ 1.0Mb
$cbr1 set random_ 
$ns at 10.0 "$cbr1 start"
$ns at 300 "$cbr1 stop"

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packetSize_ 1500
$cbr2 set rate_ 1.0Mb
$cbr2 set random_ 
$ns at 10.0 "$cbr2 start"
$ns at 300 "$cbr2 stop"

set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packetSize_ 1500
$cbr3 set rate_ 1.0Mb
$cbr3 set random_ 
$ns at 10.0 "$cbr3 start"
$ns at 240 "[$n7 set ragent_] malicious"
$ns at 240 "$n7 label attacker"
$ns at 270 "[$n7 set ragent_] nonmalicious"
$ns at 300 "$cbr3 stop"

set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packetSize_ 1500
$cbr4 set rate_ 1.0Mb
$cbr4 set random_ 
$ns at 10.0 "$cbr4 start"
#$ns at 120000 "[$n2 set ragent_] malicious"
#$ns at 150000 "[$n2 set ragent_] non-malicious"
#$ns at 120000 "$n2 label attacker"
$ns at 300 "$cbr4 stop"

set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$cbr5 set packetSize_ 1500
$cbr5 set rate_ 1.0Mb
$cbr5 set random_ 
$ns at 10.0 "$cbr5 start"
$ns at 300 "$cbr5 stop"

set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packetSize_ 1500
$cbr6 set rate_ 1.0Mb
$cbr6 set random_ 
$ns at 10.0 "$cbr6 start"
$ns at 300 "$cbr6 stop"

set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp7
$cbr7 set packetSize_ 1500
$cbr7 set rate_ 1.0Mb
$cbr7 set random_ 
$ns at 10.0 "$cbr7 start"
#$ns at 240000 "[$n7 set ragent_] malicious"
#$ns at 270000 "[$n7 set ragent_] non-malicious"
#$ns at 240000 "$n7 label attacker"
$ns at 300 "$cbr7 stop"

set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp8
$cbr8 set packetSize_ 1500
$cbr8 set rate_ 1.0Mb
$cbr8 set random_ 
$ns at 10.0 "$cbr8 start"
$ns at 300 "$cbr8 stop"

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








