----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/10/2023 05:32:29 PM
-- Design Name: 8-bit Comparator
-- Module Name: Comparator_8 - Behavioral
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

entity Comparator_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC;
           Oper : in STD_LOGIC_VECTOR (1 downto 0));
end Comparator_8;

architecture Behavioral of Comparator_8 is
    
    Component Buff_1
        PORT (
            D : in STD_LOGIC;
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    End Component;
    
    SIGNAL e0, e1, e2, e3, e4, e5, e6 : STD_LOGIC;
    SIGNAL eq_7, gr_7, ne_7, ls_7, eq_8, gr_8, neq_8, ls_8 : STD_LOGIC;
    SIGNAL eq_ctrl, neq_ctrl, gr_ctrl, ls_ctrl : STD_LOGIC;

begin

    e0 <= NOT(A(0) XOR B(0));
    e1 <= NOT(A(1) XOR B(1));
    e2 <= NOT(A(2) XOR B(2));
    e3 <= NOT(A(3) XOR B(3));
    e4 <= NOT(A(4) XOR B(4));
    e5 <= NOT(A(5) XOR B(5));
    e6 <= NOT(A(6) XOR B(6));
    
    eq_7 <= e0 AND e1 AND e2 AND e3 AND e4 AND e5 AND e6; -- 7bit equality
    
    gr_7 <= (A(0) AND NOT(B(0)))
            OR (A(1) AND NOT(B(1)) AND e0)
            OR (A(2) AND NOT(B(2)) AND e0 AND e1)
            OR (A(3) AND NOT(B(3)) AND e0 AND e1 AND e2)
            OR (A(4) AND NOT(B(4)) AND e0 AND e1 AND e2 AND e3)
            OR (A(5) AND NOT(B(5)) AND e0 AND e1 AND e2 AND e3 AND e4)
            OR (A(6) AND NOT(B(6)) AND e0 AND e1 AND e2 AND e3 AND e4 AND e5);
            
    ne_7 <= NOT eq_7;
    ls_7 <= NOT(eq_7) AND NOT(gr_7);
    
    eq_8 <= NOT(A(7) XOR B(7)) AND eq_7; -- 8-bit equal
    neq_8 <= NOT eq_8;
    
    gr_8 <= (NOT(A(7)) AND NOT(B(7)) AND gr_7) OR (A(7) AND B(7) AND ls_7) OR (NOT A(7) AND B(7)); -- 8bit greater than
    ls_8 <= NOT(eq_8) AND NOT(gr_8); -- 8-bit less than
    
   eq_ctrl <= NOT(Oper(1)) AND NOT(Oper(0));
   Eq_Buff : Buff_1
        PORT MAP(
            D => eq_8,
            Ctrl => eq_ctrl,
            Y => S
        );
        
   neq_ctrl <= Oper(1) AND Oper(0);
   Neq_Buff : Buff_1
        PORT MAP(
            D => neq_8,
            Ctrl => neq_ctrl,
            Y => S
        );
   
   gr_ctrl <= Oper(1) AND NOT(Oper(0));
   Gr_Buff : Buff_1
        PORT MAP(
            D => gr_8,
            Ctrl => gr_ctrl,
            Y => S
        );
        
   ls_ctrl <= NOT(Oper(1)) AND Oper(0);
   Ls_Buff : Buff_1
        PORT MAP(
            D => ls_8,
            Ctrl => ls_ctrl,
            Y => S
        );
    
end Behavioral;
