----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:42:40 PM
-- Design Name: 
-- Module Name: MUX_8_4bit - Behavioral
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

entity MUX8 is
    Port ( Reg_S : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Mux8_4_out : out STD_LOGIC_VECTOR (3 downto 0));
end MUX8;

architecture Behavioral of MUX8 is

begin
process (Reg_S, D0, D1, D2, D3, D4, D5, D6, D7)
begin 
    case Reg_S is
        when "000" =>
            Mux8_4_out <= D0;
        when "001" =>
            Mux8_4_out <= D1;
        when "010" =>
            Mux8_4_out <= D2;
        when "011" =>
            Mux8_4_out <= D3;
        when "100" =>
            Mux8_4_out <= D4;
        when "101" =>
            Mux8_4_out <= D5;
        when "110" =>
            Mux8_4_out <= D6;
        when "111" =>
            Mux8_4_out <= D7;
        when others =>
            Mux8_4_out <= (others => 'U');
    end case;
end process;



end Behavioral;