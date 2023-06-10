library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX2_3bit_TB is
--  Port ( );
end MUX2_3bit_TB;

architecture Behavioral of MUX2_3bit_TB is

    COMPONENT Mux2_3bit
        Port (
            JumpFlag : in STD_LOGIC;
            In_jAddress : in STD_LOGIC_VECTOR (2 downto 0);
            In_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
            Mux2_3_out : out STD_LOGIC_VECTOR (2 downto 0)
        );
    END COMPONENT;

    SIGNAL JumpFlag : STD_LOGIC;--:= (others => '0');
    SIGNAL In_jAddress : STD_LOGIC_VECTOR (2 downto 0);
    SIGNAL In_Adder_3 : STD_LOGIC_VECTOR (2 downto 0);
    SIGNAL Mux2_3_out : STD_LOGIC_VECTOR (2 downto 0);

begin

    uut: Mux2_3bit PORT MAP (
        JumpFlag => JumpFlag,
        In_jAddress => In_jAddress,
        In_Adder_3 => In_Adder_3,
        Mux2_3_out => Mux2_3_out
    );

    stim_proc: process
    begin
       --ID No: 210364 = 110 011 010 110 111 100
       --ID No: 210706 = 110 011 011 100 010 010
        JumpFlag <= '0';
        In_jAddress <= "010";
        In_Adder_3 <= "000";
        wait for 100 ns;

        JumpFlag <= '0';
        In_jAddress <= "010";
        In_Adder_3 <= "011";
        wait for 100 ns;

        JumpFlag <= '0';
        In_jAddress <= "111";
        In_Adder_3 <= "010";
        wait for 100 ns;
        JumpFlag <= '0';
        In_jAddress <= "110";
        In_Adder_3 <= "100";
        wait for 100 ns;

        JumpFlag <= '1';
        In_jAddress <= "010";
        In_Adder_3 <= "100";
        wait for 100 ns;

        JumpFlag <= '1';
        In_jAddress <= "111";
        In_Adder_3 <= "101";
        wait for 100 ns;

        JumpFlag <= '1';
        In_jAddress <= "110";
        In_Adder_3 <= "111";
        wait for 100 ns;

        JumpFlag <= '1';
        In_jAddress <= "110";
        In_Adder_3 <= "010";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
