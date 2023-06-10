## CS M152A Lab 2
### Floating Point Conversion

For this lab, we used the Xilinx ISE software to design and test a combinational circuit that converts a 12-bit linear encoding of an analog signal into a compounded 8-bit Floating Point (FP) Representation.

### Overall Design
The first block converts the 12-bit two’s-complement input to sign-magnitude representation. Nonnegative numbers (sign bit 0) are unchanged, while negative numbers are replaced by their absolute value. As you should know, the negative of a number in twos'-complement representation can be found by complementing (inverting) all bits, then incrementing (adding 1)
to this intermediate result. One problem case is the most negative number, -2048 =
(100000000000); when complement-increment is applied, the result is 100000000000, which
looks like -2048 instead of +2048.


The second block performs the basic linear to Floating Point conversion. The Exponent output
encodes the number of leading zeroes of the linear encoding, as shown in table A above. To count
the leading zeroes, we recommend you implement a priority encoder. The Significand output is
obtained by right shifting the most significant input bits from bit positions 0 to 7. What this means
is that each bit of the Significand comes from one of 8 possible magnitude bits.

The third block performs rounding of the Floating Point Representation. If the fifth bit following
the last leading 0 of the intermediate Floating Point Representation is 1, the Significand is
incremented by 1. If the Significand over flows, then we shift the Significand right one bit and
increase the Exponent by 1.
