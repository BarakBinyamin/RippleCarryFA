# RippleCarryFA
Structure of a Generic Ripple-Carry Full Adder written in VHDL. Testbench and diagrams included.
<p  align="center">
<img src= img/binaryAddition.png width="45%" height="300%">        <img src= img/RippleCarry.png width="50%">       
</p>

## Testing

While the following images show functionality, VHDL Assert statements were used to verify that all of the tests output matched expected output.  
  
[see the testbench](https://github.com/BarakBinyamin/RippleCarryFA/tree/main/tst), [download testbench](https://barakbinyamin.github.io/RippleCarryFA/tst/RippleCarryTB.vhd)  
[see the code](https://github.com/BarakBinyamin/RippleCarryFA/tree/main/src), [download Full_adder](https://barakbinyamin.github.io/RippleCarryFA/src/FullAdder.vhd), [downoad RippleCarryFA](https://barakbinyamin.github.io/RippleCarryFA/src/RippleCarryFA.vhd)  
  
 
<p  align="center">
<img src=img/BehavioralSimulationWaveform.png>   
<br>Figure 1: Behavioral Simulation Waveform
</p>
<br>


<p  align="center">
<img src=img/BehavioralSimulationWaveform0-4.png>
<br>Figure 2: Behavioral Simulation Waveform tests 0-4<br>
The SUM values in figure 2 show as unsigned Decimal.
</p>  

<br>

<p  align="center">
<img src=img/BehavioralSimulationWaveform5-9.png> 
Figure 3: Behavioral Simulation Waveform tests 5-9<br>   
The SUM values Figure 3 show as signed Decimal. You may notice that 0-15 comes out to 1 in the waveform. This is because the smallest negative number a 4-bit signed number can make is -8. This problem could be avoided by optionally reading the most siginificant carry.
</p>

## How it works

When we add two numbers on paper, we reapeat common steps:  
1. Line up the numbers by place significance
2. Add each a column of numbers, passing the carry to the next column  

#### How would one add a column of bits? 
A good apraoch to designing hardware is to list out all possibilities of inputs with their corrosponding outputs, this can be seen below


|  A  |  B  |  Carry-in | Carry-out | SUM |
| --- | :-: | :-------: | :-------: | :-: |  
|  0  |  0  |    0      |     0     |  0  |
|  0  |  0  |    1      |     0     |  1  |
|  0  |  1  |    0      |     0     |  1  |
|  0  |  1  |    1      |     1     |  0  |
|  1  |  0  |    0      |     0     |  1  |
|  1  |  0  |    1      |     1     |  0  |
|  1  |  1  |    0      |     1     |  1  |
|  1  |  1  |    1      |     1     |  1  |
  

Then we can derive the logical formulas from the table:    
SUM = A xor B xor Carry-in    
Carry-out = AB or AC or BC = ((A xor B) and Carry-in)    

<p  align="center">
<img src="img/FA_.png">  
</p>  
<p  align="center">
Diagram For An Addition Unit
</p>  
    
The Ripple-Carry Adder works by passing the carry output to the next addition unit. [see diagram](https://github.com/BarakBinyamin/RippleCarryFA#RippleCarryFA)  
  
## References & Resources
[Image from mediaspace.illinois.edu/](https://mediaspace.illinois.edu/media/t/1_sy31lyo7/99753341)   
[Image from sciencedirect.com](https://www.sciencedirect.com/topics/computer-science/full-adder)    
Xilinx Vivado  
VHDL  
