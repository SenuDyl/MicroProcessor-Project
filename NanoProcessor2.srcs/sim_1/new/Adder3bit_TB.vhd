----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 11:09:39 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity Adder3bit_TB is
--  Port ( );
end Adder3bit_TB;

architecture Behavioral of Adder3bit_TB is
COMPONENT Adder3bit
   PORT( A0	:	IN	STD_LOGIC; 
          A1	:	IN	STD_LOGIC; 
          A2	:	IN	STD_LOGIC; 
          B0	:	IN	STD_LOGIC; 
          B1    :    IN    STD_LOGIC; 
          B2    :    IN    STD_LOGIC; 
          S0	:	OUT	STD_LOGIC; 
          S1    :    OUT    STD_LOGIC; 
          S2    :    OUT    STD_LOGIC 
          
          );
   END COMPONENT;

   SIGNAL A0	:	STD_LOGIC;
   SIGNAL A1	:	STD_LOGIC;
   SIGNAL A2	:	STD_LOGIC;
   SIGNAL B0	:	STD_LOGIC;
   SIGNAL B1    :    STD_LOGIC;
   SIGNAL B2    :    STD_LOGIC;
   SIGNAL S0    :    STD_LOGIC;
   SIGNAL S1    :    STD_LOGIC;
   SIGNAL S2    :    STD_LOGIC;
  

begin
UUT: Adder3bit PORT MAP(
		A0 => A0,
		A1 => A1,
		A2 => A2,
		B0 => B0,
		B1 =>B1,
		B2 => B2,
		
		S0 => S0,
		S1 => S1,
		S2 => S2
		
	);
   tb : process
              BEGIN
              for i in 0 to 1 loop
                   
                   
                   A0 <= '0';
                   B0 <= '0';
                   A1 <= '0';
                   B1 <= '0';
                   A2 <= '0';
                   B2 <= '0';
                 --ID No: 210364 = 110 011 010 110 111 100
                 --ID No: 210706 = 110 011 011 100 010 010
                 -- 100+010
                   WAIT for 5 ns;
                   A2 <= '1';
                   
                   B1 <= '1';
                 -- 111 + 010
                   WAIT for 5 ns;
                   A2 <= '1';
                   A1 <= '1';
                   A0 <= '1';
                 -- 110 + 100
                   WAIT for 5 ns;
                   A0 <= '0';
                   B2 <= '1';
                   B1 <= '0';
                   B0 <= '0';
                 -- 0111 + 1111
                   WAIT for 5 ns;
                   A1 <= '1';
                   B2 <= '1';
                   
                 -- 0110 + 1011
                   WAIT for 5 ns;
                   A0 <= '1';
                   B2 <= '0';
                 -- 0010 + 1010
                   Wait for 5 ns;
                   A2 <= '0';
                   B0 <= '0';
                   
                 -- 0001 + 0101 
                   WAIT for 5 ns;
                   A0 <= '1';
                   A1 <= '0';
                   B0 <= '1';
                   B1 <= '0';
                   B2 <= '1';
                  
                 -- 1100 + 1101 
                   WAIT for 5 ns;
                   A2 <= '1';
                   A0 <= '0';
                 -- 0000 + 0000
                   WAIT for 5 ns;
                   A2 <= '0';
                   B2 <= '0';
                   B0 <= '0';
                   
               end loop;
                 WAIT; -- will wait forever
              END PROCESS;    
end Behavioral;