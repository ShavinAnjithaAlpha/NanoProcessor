----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/03/2023 06:13:06 PM
-- Design Name: ALU multiplexer
-- Module Name: ALU_Mux - Behavioral
-- Project Name: Nano Processor
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

entity ALU_Mux is
    Port ( Add_Sub_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Logic_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Mul_Bus : in STD_LOGIC_VECTOR (3 downto 0);
           Shift_Bus : in STD_LOGIC_VECTOR(3 downto 0);
           Mode : in STD_LOGIC_VECTOR (1 downto 0);
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end ALU_Mux;

architecture Behavioral of ALU_Mux is

    Component Buff_4
        PORT (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL add_sub_ctrl, logic_ctrl, mul_ctrl, shift_ctrl : STD_LOGIC;
    
begin
    
    -- add sub unit selecter buffer
    add_sub_ctrl <= (NOT(Mode(1)) AND NOT(Mode(0))) OR (Mode(1) AND Mode(0)) OR (Mode(1) AND Op(1) AND Op(0));
    Add_Sub_Buff : Buff_4
        PORT MAP(
            D => Add_Sub_Bus,
            Ctrl => add_sub_ctrl,
            Y => Y
        );
        
    -- logic unit selecter buffer
    logic_ctrl <= NOT(Mode(1)) AND Mode(0);
    Logic_Buff : Buff_4
        PORT MAP(
            D => Logic_Bus,
            Ctrl => logic_ctrl,
            Y => Y
        );
        
    -- multiplicator unti selecter buffer
    mul_ctrl <= Mode(1) AND NOT(Mode(0)) AND NOT(Op(1)) AND NOT(Op(0));
    Mul_Buff : Buff_4
        PORT MAP(
            D => Mul_Bus,
            Ctrl => mul_ctrl,
            Y => Y
        );
        
    -- shift unit selecter buffer
    shift_ctrl <= (Mode(1) AND NOT(Mode(0)) AND NOT(Op(1)) AND Op(0)) 
                    OR (Mode(1) AND NOT(Mode(0)) AND Op(1) AND NOT(Op(0))); 
    Shift_Buff : Buff_4
        PORT MAP(
            D => Shift_Bus,
            Ctrl => shift_ctrl,
            Y => Y
        );

end Behavioral;
