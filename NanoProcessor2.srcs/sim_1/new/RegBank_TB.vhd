library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegBank_TB is
end RegBank_TB;

architecture Behavioral of RegBank_TB is

    -- Component declaration
    component RegBank is
        Port (
            I_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
            I_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
            I_Reset : in STD_LOGIC;
            I_En_Store : in STD_LOGIC;
            I_Clk : in STD_LOGIC;
            Data_out_0 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_1 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_2 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_3 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_4 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_5 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_6 : out STD_LOGIC_VECTOR (3 downto 0);
            Data_out_7 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Test bench signals
    signal I_Reg_Enable_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal I_Data_In_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal I_Reset_tb : STD_LOGIC;
    signal I_En_Store_tb : STD_LOGIC;
    signal I_Clk_tb : STD_LOGIC;
    signal Data_out_0_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_1_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_2_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_3_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_4_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_5_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_6_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Data_out_7_tb : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the RegBank module
    uut: RegBank
        port map (
            I_Reg_Enable => I_Reg_Enable_tb,
            I_Data_In => I_Data_In_tb,
            I_Reset => I_Reset_tb,
            I_En_Store => I_En_Store_tb,
            I_Clk => I_Clk_tb,
            Data_out_0 => Data_out_0_tb,
            Data_out_1 => Data_out_1_tb,
            Data_out_2 => Data_out_2_tb,
            Data_out_3 => Data_out_3_tb,
            Data_out_4 => Data_out_4_tb,
            Data_out_5 => Data_out_5_tb,
            Data_out_6 => Data_out_6_tb,
            Data_out_7 => Data_out_7_tb
        );

    -- Clock generation process
    process
    begin
        I_Clk_tb <= '0';
        wait for 5 ns;
        I_Clk_tb <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        I_Reg_Enable_tb <= "000";
        I_Data_In_tb <= "0011";
        I_Reset_tb <= '1';
        I_En_Store_tb <= '1';

        -- Wait for a few clock cycles
        wait for 20 ns;

        -- Apply stimulus values
        I_Reg_Enable_tb <= "001";
        I_Data_In_tb <= "0001";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';

        -- Wait for a few clock cycles
        wait for 20 ns;

        -- Apply new stimulus values
        I_Reg_Enable_tb <= "010";
        I_Data_In_tb <= "1011";
        --I_Reset_tb <= '1';
        I_En_Store_tb <= '1';

        -- Wait for a few clock cycles
        wait for 20 ns;

        -- Apply stimulus values
        I_Reg_Enable_tb <= "100";
        I_Data_In_tb <= "0010";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';

        -- Wait for a few clock cycles
        wait for 20 ns;

        -- Apply new stimulus values
        I_Reg_Enable_tb <= "011";
        I_Data_In_tb <= "0001";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';

        -- Wait for a few clock cycles
        wait for 20 ns;
        I_Reg_Enable_tb <= "111";
        I_Data_In_tb <= "0101";
        I_Reset_tb <= '0';
        I_En_Store_tb <= '1';

        -- End simulation
        wait;
    end process stim_proc;

end Behavioral;
