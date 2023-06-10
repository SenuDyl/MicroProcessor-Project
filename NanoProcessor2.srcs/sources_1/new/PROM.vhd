----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 09:03:33 AM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROM is
    Port ( address_new : in STD_LOGIC_VECTOR (2 downto 0);
           data_new : out STD_LOGIC_VECTOR (11 downto 0));
end PROM;

architecture Behavioral of PROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal assemblyInstructions_ROM : rom_type := (
    --"100010001010", -- MOVI R1, 10 ; R1 ? 10
    --"100100000001",--MOVI R2, 1 ; R2 ? 1
    --"010100000000",-- NEG R2 ; R2 ? -R2
    --"000010100000",-- ADD R1, R2 ; R1 ? R1 + R2
    --"110010000111",-- JZR R1, 7 ; If R1 = 0 jump to line 7
    --"110000000011"--JZR R0, 3 ; If R0 = 0 jump to line 3
    "101110000001", --0 Move 1 to R7 
           "100100000010", --1 Move 2 to R2 
           "100110000011", --2 Move 3 to R3 
           "001110100000", --3 R7 <= R7 + R2 
           "001110110000", --4 R7 <= R7 + R3 
           "010110000000", --5 R3 <= -R3
           "111110000101", --6 Jump to instruction 5 if Reg7 is 0
           "110000000110"  --7 Jump to instruction 6 if Reg0 is 0
);

begin
data_new <= assemblyInstructions_ROM(to_integer(unsigned(address_new)));

end Behavioral;
