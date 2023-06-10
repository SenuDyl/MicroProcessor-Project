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

entity Mux2_4bit is
    Port (In_Adder_4: in STD_LOGIC_VECTOR (3 downto 0);
           In_Imm : in STD_LOGIC_VECTOR (3 downto 0);
           In_load_S : in STD_LOGIC;
           Mux2_4_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux2_4bit;

architecture Behavioral of Mux2_4bit is

begin
process(In_load_S,In_Adder_4,In_Imm)
begin
--if In_load_S='0' then
--Mux2_4_out<=In_Adder_4;
--else
--Mux2_4_out<=In_Imm;
--end if;
Mux2_4_out(0) <= (NOT(In_load_S) AND In_Imm(0)) OR (In_load_S AND In_Adder_4(0));
Mux2_4_out(1) <= (NOT(In_load_S) AND In_Imm(1)) OR (In_load_S AND In_Adder_4(1));
Mux2_4_out(2) <= (NOT(In_load_S) AND In_Imm(2)) OR (In_load_S AND In_Adder_4(2));
Mux2_4_out(3) <= (NOT(In_load_S) AND In_Imm(3)) OR (In_load_S AND In_Adder_4(3));
end process;

end Behavioral;
