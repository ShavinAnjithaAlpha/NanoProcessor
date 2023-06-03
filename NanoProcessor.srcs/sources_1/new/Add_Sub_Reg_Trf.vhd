----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Name - Shavin Anjitha
-- Create Date: 06/03/2023 05:39:25 PM
-- Design Name: Adder and Subtractor With Register Bypass
-- Module Name: Add_Sub_Reg_Trf - Behavioral
-- Project Name: NanoProcessors
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

entity Add_Sub_Reg_Trf is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Ovf : out STD_LOGIC;
           Zeroes : out STD_LOGIC);
end Add_Sub_Reg_Trf;

architecture Behavioral of Add_Sub_Reg_Trf is

    Component Add_Subtract -- adder subtractir unit
        PORT (
            A_in : in STD_LOGIC_VECTOR (3 downto 0);
            B_in : in STD_LOGIC_VECTOR (3 downto 0);
            S_out : out STD_LOGIC_VECTOR (3 downto 0);
            M : in STD_LOGIC; -- operation code
            Zeroes : out STD_LOGIC; -- zero flag
            Ovf : out STD_LOGIC -- overflow flag
        );
    End Component;
    
    Component Buff_4 -- tri state buffers
        PORT (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Ctrl : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    End Component;
    
    SIGNAL add_sub_out : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL add_sub_op, A_ctrl, B_ctrl : STD_LOGIC;
    
begin
    
    Add_Subtract_0 : Add_Subtract
        PORT MAP(
            A_in => A,
            B_in => B,
            S_out => add_sub_out,
            M => Op(0),
            Ovf => Ovf,
            Zeroes => Zeroes
        );
      
    -- tri state buffers with their constrol signal to control the output lines  
    add_sub_op <= NOT(Op(1));
    Add_Subtract_Line : Buff_4
        PORT MAP(
            D => add_sub_out,
            Ctrl => add_sub_op,
            Y => S
        );
        
    A_ctrl <= Op(1) AND Op(0);
    A_buff : Buff_4
        PORT MAP(
            D => A,
            Ctrl => A_ctrl,
            Y => S
        );
        
    B_ctrl <= Op(1) AND NOT(Op(0));
    B_buff : Buff_4
        PORT MAP(
            D => B,
            Ctrl => B_ctrl,
            Y => S
        );
    

end Behavioral;
