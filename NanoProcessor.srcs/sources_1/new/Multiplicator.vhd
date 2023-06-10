----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 12:31:56 PM
-- Design Name: 
-- Module Name: Multiplicator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplicator is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Ovf : out STD_LOGIC);
end Multiplicator;

architecture Behavioral of Multiplicator is
    Component Adder_8Bit
        PORT(
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Carry : out STD_LOGIC);
    End Component;

    SIGNAL C : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15 : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC_VECTOR(7 downto 0);
    
begin
    
    ---------------------------------------------------------------------------
    T1(0) <= A(0) AND B(0); T1(1) <= A(0) AND B(1); T1(2) <= A(0) AND B(2);
    T1(3) <= A(0) AND B(3); T1(4) <= A(0) AND B(4); T1(5) <= A(0) AND B(5);
    T1(6) <= A(0) AND B(6); T1(7) <= A(0) AND B(7);
    
    T2(0) <= A(1) AND B(0); T2(1) <= A(1) AND B(1); T2(2) <= A(1) AND B(2);
    T2(3) <= A(1) AND B(3); T2(4) <= A(1) AND B(4); T2(5) <= A(1) AND B(5);
    T2(6) <= A(1) AND B(6); T2(7) <= A(1) AND B(7);
    
    A1(7) <= '0'; A1(6 downto 0) <= T1(7 downto 1); S(0) <= T1(0);
    Adder_0 : Adder_8Bit
        PORT MAP(
            A => A1,
            B => T2,
            S => T3,
            Carry => C(0)
        );
    S(1) <= T3(0);
    
    ----------------------------------------------------------------------------
    A2(7) <= C(0); A2(6 downto 0) <= T3(7 downto 1);
    T4(0) <= A(2) AND B(0); T4(1) <= A(2) AND B(1); T4(2) <= A(2) AND B(2);
    T4(3) <= A(2) AND B(3); T4(4) <= A(2) AND B(4); T4(5) <= A(2) AND B(5);
    T4(6) <= A(2) AND B(6); T4(7) <= A(2) AND B(7);
    
    Adder_1 : Adder_8Bit
        PORT MAP(
            A => A2,
            B => T4,
            S => T5,
            Carry => C(1)
        );
    S(2) <= T5(0);
    
    -----------------------------------------------------------------------------
    A3(7) <= C(1); A3(6 downto 0) <= T5(7 downto 1);
    T6(0) <= A(3) AND B(0); T6(1) <= A(3) AND B(1); T6(2) <= A(3) AND B(2);
    T6(3) <= A(3) AND B(3); T6(4) <= A(3) AND B(4); T6(5) <= A(3) AND B(5);
    T6(6) <= A(3) AND B(6); T6(7) <= A(3) AND B(7);
    
    Adder_2 : Adder_8Bit
        PORT MAP(
            A => A3,
            B => T6,
            S => T7,
            Carry => C(2)
         );
    S(3) <= T7(0);
    
    -----------------------------------------------------------------------------
    A4(7) <= C(2); A4(6 downto 0) <= T7(7 downto 1);
    T8(0) <= A(4) AND B(0); T8(1) <= A(4) AND B(1); T8(2) <= A(4) AND B(2);
    T8(3) <= A(4) AND B(3); T8(4) <= A(4) AND B(4); T8(5) <= A(4) AND B(5);
    T8(6) <= A(4) AND B(6); T8(7) <= A(4) AND B(7);
        
    Adder_3 : Adder_8Bit
        PORT MAP(
            A => A4,
            B => T8,
            S => T9,
            Carry => C(3)
            );
    S(4) <= T9(0);
    
    ------------------------------------------------------------------------------
    A5(7) <= C(3); A5(6 downto 0) <= T9(7 downto 1);
    T10(0) <= A(5) AND B(0); T10(1) <= A(5) AND B(1); T10(2) <= A(5) AND B(2);
    T10(3) <= A(5) AND B(3); T10(4) <= A(5) AND B(4); T10(5) <= A(5) AND B(5);
    T10(6) <= A(5) AND B(6); T10(7) <= A(5) AND B(7);
            
    Adder_4 : Adder_8Bit
        PORT MAP(
            A => A5,
            B => T10,
            S => T11,
            Carry => C(4)
            );
     S(5) <= T11(0);
     
     ------------------------------------------------------------------------------
     A6(7) <= C(4); A6(6 downto 0) <= T11(7 downto 1);
     T12(0) <= A(6) AND B(0); T12(1) <= A(6) AND B(1); T12(2) <= A(6) AND B(2);
     T12(3) <= A(6) AND B(3); T12(4) <= A(6) AND B(4); T12(5) <= A(6) AND B(5);
     T12(6) <= A(6) AND B(6); T12(7) <= A(6) AND B(7);
                 
     Adder_5 : Adder_8Bit
         PORT MAP(
             A => A6,
             B => T12,
             S => T13,
             Carry => C(5)
            );
      S(6) <= T13(0);
      
      ------------------------------------------------------------------------------
      A7(7) <= C(5); A7(6 downto 0) <= T13(7 downto 1);
      T14(0) <= A(7) AND B(0); T14(1) <= A(7) AND B(1); T14(2) <= A(7) AND B(2);
      T14(3) <= A(7) AND B(3); T14(4) <= A(7) AND B(4); T14(5) <= A(7) AND B(5);
      T14(6) <= A(7) AND B(6); T14(7) <= A(7) AND B(7);
                       
      Adder_6 : Adder_8Bit
          PORT MAP(
              A => A7,
              B => T14,
              S => T15,
              Carry => C(6)
             );
       S(7) <= T15(0);
       
       Ovf <= T15(1) OR T15(2) OR T15(3) OR T15(4) OR T15(5) OR T15(6) OR T15(7);
       
    

--    S_out(0) <= B_in(0) AND A_in(0);
    
--    A_tmp(0) <= B_in(0) AND A_in(1);
--    A_tmp(1) <= B_in(0) AND A_in(2);
--    A_tmp(2) <= B_in(0) AND A_in(3);
--    A_tmp(3) <= B_in(0) AND A_in(4);
--    A_tmp(4) <= B_in(0) AND A_in(5);
--    A_tmp(5) <= B_in(0) AND A_in(6);
--    A_tmp(6) <= B_in(0) AND A_in(7);
--    A_tmp(7) <= '0';

--    Adder_0 : Adder_8Bit
--        PORT MAP(
--            A_in => A_tmp,
--            B_in => B_in(1),
--            Q => A_in,
--            S_out => S_tmp1,
--            LSB => S_out(1));
    
--    Adder_1 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp1,
--            B_in => B_in(2),
--            Q => A_in,
--            S_out => S_tmp2,
--            LSB => S_out(2)); 
               
--    Adder_2 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp2,
--            B_in => B_in(3),
--            Q => A_in,
--            S_out => S_tmp3,
--            LSB => S_out(3)); 
               
--    Adder_3 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp3,
--            B_in => B_in(4),
--            Q => A_in,
--            S_out => S_tmp4,
--            LSB => S_out(4));
                
--    Adder_4 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp4,
--            B_in => B_in(5),
--            Q => A_in,
--            S_out => S_tmp5,
--            LSB => S_out(5)); 
              
--    Adder_5 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp5,
--            B_in => B_in(6),
--            Q => A_in,
--            S_out => S_tmp6,
--            LSB => S_out(6));
    
--    Adder_6 : Adder_8Bit
--        PORT MAP(
--            A_in => S_tmp6,
--            B_in => B_in(3),
--            Q => A_in,
--            LSB => S_out(7),
--            S_out => last_S_out);
            
--    Ovf <= last_S_out(0) OR last_S_out(1) OR last_S_out(2) OR last_S_out(3) OR last_S_out(4) OR last_S_out(5);
    
end Behavioral;