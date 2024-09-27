pragma circom 2.0.0;

/This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input input_A;
   signal input input_B;

   signal input_process_A;
   signal input_process_B;

   signal output F_output;

   component gate_and=AND();
   component gate_or=OR();
   component gate_not=NOT();

   gate_and.a <== input_A ;
   gate_and.b <== input_B ;
   input_process_A <== gate_and.out ;

   gate_not.in <== input_B ;
   input_process_B <== gate_not.out;

   gate_or.a <== input_process_A;
   gate_or.b <== input_process_B;
   F_output <== gate_or.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
