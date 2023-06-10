library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX2_4bit_TB is
--  Port ( );
end MUX2_4bit_TB;

architecture Behavioral of MUX2_4bit_TB is

    COMPONENT Mux2_4bit
        Port (
            In_load_S : in STD_LOGIC;
            In_Adder_4 : in STD_LOGIC_VECTOR (3 downto 0);
            In_Imm : in STD_LOGIC_VECTOR (3 downto 0);
            Mux2_4_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    END COMPONENT;

    SIGNAL In_load_S : STD_LOGIC;--:= (others => '0');
    SIGNAL In_Adder_4 : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL In_Imm : STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL Mux2_4_out : STD_LOGIC_VECTOR (3 downto 0);

begin

    uut: Mux2_4bit PORT MAP (
        In_load_S => In_load_S,
        In_Adder_4 => In_Adder_4,
        In_Imm => In_Imm,
        Mux2_4_out => Mux2_4_out
    );

    stim_proc: process
    begin
    --ID No: 210364 = 11 0011 0101 1011 1100
    --ID No: 210706 = 11 0011 0111 0001 0010
       
        In_load_S <= '0';
        In_Adder_4 <= "0011";
        In_Imm <= "0011";
        wait for 100 ns;

        In_load_S <= '0';
        In_Adder_4 <= "0101";
        In_Imm <= "0111";
        wait for 100 ns;

        In_load_S <= '0';
        In_Adder_4 <= "1011";
        In_Imm <= "0001";
        wait for 100 ns;

        In_load_S <= '1';
        In_Adder_4 <= "1100";
        In_Imm <= "0010";
        wait for 100 ns;

        In_load_S <= '1';
       In_Adder_4 <= "0101";
        In_Imm <= "0010";
        wait for 100 ns;

        In_load_S <= '1';
        In_Adder_4 <= "0011";
        In_Imm <= "0010";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
