----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 10:53:18 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity Adder3bit is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC);
           
end Adder3bit;

architecture Behavioral of Adder3bit is
component FAUnit
port (
A: in std_logic;
B: in std_logic;
C_in: in std_logic;
S: out std_logic;
C_out: out std_logic);
end component;
SIGNAL  FA0_C, FA1_C, FA2_C : std_logic;

begin

FA_0 : FAUnit
port map (
A => A0,
B =>B0,
C_in => '0', -- Set to ground C_in => C_in,
S => S0,
C_out => FA0_C);
FA_1 : FAUnit
port map (
A => A1,
B => B1,
C_in => FA0_C,
S => S1,
C_out => FA1_C);
FA_2 : FAUnit
port map (
A => A2,
B => B2,
C_in => FA1_C,
S => S2,
C_out => FA2_C);


end Behavioral;