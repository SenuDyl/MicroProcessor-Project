----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:17:56 PM
-- Design Name: 
-- Module Name: Mux_2_to_1 - Behavioral
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

entity Mux2_3bit is
    Port ( In_jAddress : in STD_LOGIC_VECTOR (2 downto 0);
           In_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : in STD_LOGIC;
           Mux2_3_out : out STD_LOGIC_VECTOR (2 downto 0));
end Mux2_3bit ;

architecture Behavioral of Mux2_3bit  is

begin
process(JumpFlag,In_jAddress,In_Adder_3)
begin
Mux2_3_out(0) <= (NOT(JumpFlag) AND In_Adder_3(0)) OR (JumpFlag AND In_jAddress(0));
Mux2_3_out(1) <= (NOT(JumpFlag) AND In_Adder_3(1)) OR (JumpFlag AND In_jAddress(1));
Mux2_3_out(2) <= (NOT(JumpFlag) AND In_Adder_3(2)) OR (JumpFlag AND In_jAddress(2));
end process;

end Behavioral;
