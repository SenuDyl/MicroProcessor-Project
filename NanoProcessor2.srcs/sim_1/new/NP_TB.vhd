library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NP_TB is
end NP_TB;

architecture Behavioral of NP_TB is
    -- Component declaration for the DUT
    component NP is
        Port ( Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Overflow_led : out STD_LOGIC;
               Zero_led : out STD_LOGIC;
               Reg_7 : out std_logic_vector(3 downto 0);
               --Reg_1 : out std_logic_vector(3 downto 0);
               Seg7_Anode : out STD_LOGIC_VECTOR(3 downto 0);
               Seg7_Out : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    -- Test bench signals
    signal Clk_tb : STD_LOGIC := '0';
    signal Res_tb : STD_LOGIC := '0';
    signal Overflow_led_tb : STD_LOGIC;
    signal Zero_led_tb : STD_LOGIC;
    signal Reg_7_tb : std_logic_vector(3 downto 0);
    --signal Reg_1_tb : std_logic_vector(3 downto 0);
    signal Seg7_Anode_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal Seg7_Out_tb : STD_LOGIC_VECTOR(6 downto 0);

    -- Constants
    constant CLK_PERIOD : time := 1 ns; -- Adjust the period as needed

begin
    -- Instantiate the DUT
    dut: NP
    Port map (
        Clk => Clk_tb,
        Res => Res_tb,
        Overflow_led => Overflow_led_tb,
        Zero_led => Zero_led_tb,
        Reg_7 => Reg_7_tb,
        --Reg_1 => Reg_1_tb,
        Seg7_Anode => Seg7_Anode_tb,
        Seg7_Out => Seg7_Out_tb
    );

    -- Clock process
    Clk_process: process
    begin
        while now < 1000 ns loop -- Adjust the simulation duration as needed
            Clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            Clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    Stimulus_process: process
    begin
        -- Insert your test stimulus here
        
        -- Example: Reset for a few clock cycles
        Res_tb <= '1';
        --wait for CLK_PERIOD * 5;
        wait for 100ns;
        Res_tb <= '0';
        wait for 100ns;
--        Res_tb <= '1';
--                --wait for CLK_PERIOD * 5;
--                wait for 100ns;
--                Res_tb <= '0';
--                Res_tb <= '1';
--                        --wait for CLK_PERIOD * 5;
--                        wait for 100ns;
--                        Res_tb <= '0';
        -- Insert additional test cases or scenarios
        
        wait;
    end process;

end Behavioral;
