# -Justin-.github.io-fsm_Fibonacci
Verilog - FSM - Fibonacci

In this exercise, the Fibonacci number is used as a study to practice finite state machine (FSM) design.  
First, we reviewed several images to understand what is the Fibonacci number and how it works.  
![image alt](https://github.com/JustinRodneyblessup/-Justin-.github.io-fsm_Fibonacci/blob/main/fibonacci_view.png?raw=true)  
![image alt](https://github.com/JustinRodneyblessup/-Justin-.github.io-fsm_Fibonacci/blob/main/fibonacci_number.png?raw=true)  
Next, the design specifications required for the circuit are listed in the table below.  
| Input  |      clk       | Time pulse                                                                               |
| Input  |     rst_n      | Reset                                                                                    |
| Input  |    in_valid    | Input a valid signal                                                                     |
| Input  | [7:0] in_level | This represents the value (Fn) for which level is required, and is valid when in_valid=1 |
| Output |    out_valid   | Valid output signal                                                                      |
| Output |  [7:0] result  | Output the value of the desired layer; it is valid when out_valid=1                      |                    
The finite state machine for this project is shown below.  
![image alt](https://github.com/JustinRodneyblessup/-Justin-.github.io-fsm_Fibonacci/blob/main/fsm_fibonacci.jpg?raw=true)  
Finally, the waveform results are presented.  
![image alt](https://github.com/JustinRodneyblessup/-Justin-.github.io-fsm_Fibonacci/blob/main/waveform_fibonacci.jpg?raw=true)  
