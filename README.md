# RippleCarryFA
Structure of a Ripple carry Full adder written in VHDL. Testbench and diagrams included.
<p  align="center">
<img src= img/RippleCarry.png width="50%">       <img src= img/binaryAddition.png width="45%" height="300%">
</p>

## Testing

While the following images show functionality, VHDL Assert statements were used to verify that all of the tests output matched expected output.  
  
[see the testbench](https://github.com/BarakBinyamin/RippleCarryFA/tree/main/tst)  
[see the code](https://github.com/BarakBinyamin/RippleCarryFA/tree/main/src) 
  
 
</p>
<p  align="center">
<img src=img/BehavioralSimulationWaveform.png>   
<br>Behavioral Simulation Waveform
</p>
<br><br><br>


<p>
  <img  align="left" src=img/BehavioralSimulationWaveform0-4.png width="85%">
  <h4> Behavioral Simulation Waveform tests 0-4 </h4>
  The SUM values in the waveform to the left show as unsigned Decimal.
  <br><br><br><br><br><br><br><br><br><br>
</p>



<p>
<img align="right" src=img/BehavioralSimulationWaveform5-9.png width="85%"> 
<h4>Behavioral Simulation Waveform tests 5-9</h4>
The SUM values in the waveform to the right show as signed Decimal. The smallest negative number a 4-bit signed number can make is -8, this is why 0-15 comes out to 1, this problem could be avoided by including the last carry for signed purposes only.
</p>

## References & Resources
[Image from mediaspace.illinois.edu/](https://mediaspace.illinois.edu/media/t/1_sy31lyo7/99753341)
Xilinx Vivado  
VHDL  
