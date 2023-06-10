----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/04/2023 01:07:52 AM
-- Design Name: Arithmetic And Logic Unit
-- Module Name: ALU - Behavioral
-- Project Name: NanoProcessor
-- Target Devices: Basys3
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Mode : in STD_LOGIC_VECTOR (1 downto 0);
           Oper : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Comp_out : out STD_LOGIC;
           Ovf : out STD_LOGIC;
           Sign : out STD_LOGIC;
           Parity : out STD_LOGIC;
           Zeroes : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

    Component Add_Sub_Reg_Trf
        PORT (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            Op : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(7 downto 0);
            Ovf : out STD_LOGIC;
            Zeroes : out STD_LOGIC
        );
    End Component;
    
    Component Add_Sub_Reg_Trf_CU
        PORT (
            Mode : in STD_LOGIC_VECTOR(1 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC_VECTOR(1 downto 0)
        );
    End Component;
    
    
    Component Logical_Unit
        PORT (
            A_in : in STD_LOGIC_VECTOR(7 downto 0);
            B_in : in STD_LOGIC_VECTOR(7 downto 0);
            S_out : out STD_LOGIC_VECTOR(7 downto 0);
            M : in STD_LOGIC_VECTOR(1 downto 0)
        );
    End Component;
    
    Component Comparator_8
        PORT (
            A : in STD_LOGIC_VECTOR(7 downto 0);
            B : in STD_LOGIC_VECTOR(7 downto 0);
            Oper : in STD_LOGIC_VECTOR(1 downto 0);
            S : out STD_LOGIC
        );
    End Component;
    
    Component Multiplicator
        PORT ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               S : out STD_LOGIC_VECTOR (7 downto 0);
               Ovf : out STD_LOGIC);
    End Component;
    
    Component Shifter
        PORT (
            A_in : in STD_LOGIC_VECTOR (7 downto 0);
            M : in STD_LOGIC_VECTOR (1 downto 0);
            S_out : out STD_LOGIC_VECTOR (7 downto 0)
        );
    End Component;
    
    Component ALU_Mux
        PORT ( Add_Sub_Bus : in STD_LOGIC_VECTOR (7 downto 0);
               Logic_Bus : in STD_LOGIC_VECTOR (7 downto 0);
               Mul_Bus : in STD_LOGIC_VECTOR (7 downto 0);
               Shift_Bus : in STD_LOGIC_VECTOR(7 downto 0);
               Mode : in STD_LOGIC_VECTOR (1 downto 0);
               Op : in STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    End Component;
    
    SIGNAL add_sub_op : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL add_sub_out, logic_out, mul_out, shift_out, S_out : STD_LOGIC_VECTOR( 7 downto 0);
    SIGNAL cmp_out, add_ovf, mul_ovf : STD_LOGIC;
    
begin

    -- create the add-subtracter-register-transfer Control Unit
    Add_Sub_Reg_Trf_CU_0 : Add_Sub_Reg_Trf_CU 
        PORT MAP(
            Mode => Mode,
            Oper => Oper,
            S => add_sub_op
        );
    
    -- create the add-subtracter-regsiter-transfer unit
    Add_Sub_Reg_Trf_0 : Add_Sub_Reg_Trf
        PORT MAP(
            A => A,
            B => B,
            Op => add_sub_op,
            S => add_sub_out,
            Ovf => add_ovf,
            Zeroes => Zeroes
        );
        
    -- create the comparator unit
    Comparator_0 : Comparator_8
        PORT MAP(
            A => A,
            B => B,
            Oper => Oper,
            S => cmp_out
        );
    Comp_out <= cmp_out AND Mode(1) AND Mode(0);
        
    -- create the logic unit
    Logic_Unit_0 : Logical_Unit
        PORT MAP(
            A_in => A,
            B_in => B,
            M => Oper,
            S_out => logic_out
        );
     
   -- create the multiplicator   
   Multiplicator_0 : Multiplicator
    PORT MAP (
        A => A,
        B => B,
        S => mul_out,
        Ovf => mul_ovf
    );
    
   -- create the right and left shifter
   Shifter_0 : Shifter
        PORT MAP (
            A_in => B,
            M => Oper,
            S_out => shift_out
        );
   
   -- create ALU multiplexer
   ALU_Mux_0 : ALU_Mux
    PORT MAP(
        Add_Sub_Bus => add_sub_out,
        Logic_Bus => logic_out,
        Mul_Bus => mul_out,
        Shift_Bus => shift_out,
        Mode => Mode,
        Op => Oper,
        Y => S_out
    );
    
    S <= S_out;
    Sign <= S_out(7);
    Parity <= NOT(S_out(7) XOR S_out(6) XOR S_out(5) XOR S_out(4) XOR 
                    S_out(3) XOR S_out(2) XOR S_out(1) XOR S_out(0));
    Ovf <= add_ovf OR mul_ovf;

end Behavioral;
