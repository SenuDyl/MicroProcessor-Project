----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 11:37:16 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.All;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( In_MUX2_3 : in STD_LOGIC_VECTOR (2 downto 0);
           --EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           --Inc: in STD_LOGIC;
           Res: in STD_LOGIC; 
           Out_PC : inout STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

begin
    process (Clk) begin
    if (rising_edge(Clk)) then
        if Res = '1' then
            Out_PC <= "000";
        else
            --if EN = '1' then
                Out_PC <=  In_MUX2_3;
            --end if;
        end if;
    end if ;
    end process;
end Behavioral;
