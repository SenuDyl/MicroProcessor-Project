library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InsDecoder is
    Port (
        I_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
        I_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
        I_Clk : in STD_LOGIC;
        I_Reset : in STD_LOGIC;
        O_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
        O_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
        O_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
        O_EN_PC : out STD_LOGIC;
        O_EN_Store : out STD_LOGIC;
        O_Add_Sub_Sel : out STD_LOGIC;
        O_Jump_Flag : out STD_LOGIC;
        O_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0);
        O_Load_Sel : out STD_LOGIC;
        O_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0)
    );
end InsDecoder;


architecture Behavioral of InsDecoder is
SIGNAL reg_access: STD_LOGIC;

begin

    O_Load_Sel <= NOT(I_Instruction(11));
    --O_Reg_Enable <= I_Instruction(9 downto 7);
reg_access <= NOT (I_Instruction(11) AND I_Instruction(10));
    O_Reg_Sel_A <= I_Instruction(9 downto 7);
    O_Reg_Sel_B <= I_Instruction(6 downto 4);
    O_Jump_Addr <= I_Instruction(2 downto 0);

    O_Jump_Flag <= '1' when (I_Instruction(11) = '1' and I_Instruction(10) = '1' and I_Jump_Check = "0000") else '0';
    O_Reg_Enable <= I_Instruction(9 downto 7) when reg_access = '1' else "000";
    O_Add_Sub_Sel <= '1' when (NOT I_Instruction(11) = '1' and I_Instruction(10) = '1') else '0';
    O_Imm_Val <= I_Instruction(3 downto 0);

    O_EN_Store <= '1' when (I_Instruction(11) = '0' and I_Instruction(10) = '0') else '0';
    O_EN_PC <= '1' when (I_Instruction(11) = '1' and I_Instruction(10) = '0') else '0';

end Behavioral;
