library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_TB is
end PC_TB;

architecture Behavioral of PC_TB is
    -- Component declaration for the module under test
    component PC is
        Port (
            In_Mux2_3   : in  STD_LOGIC_VECTOR(2 downto 0);
            --EN  : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            --Inc : in  STD_LOGIC;
            Res : in  STD_LOGIC;
            Out_PC   : inout  STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Testbench signals
    signal tb_clk   : STD_LOGIC;
    --signal tb_en    : STD_LOGIC;
    signal tb_d     : STD_LOGIC_VECTOR(2 downto 0);
    --signal tb_inc   : STD_LOGIC;
    signal tb_res   : STD_LOGIC;
    signal tb_q     : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- Instantiate the module under test
    uut: PC
        port map (
            In_Mux2_3   => tb_d,
            --EN  => tb_en,
            Clk => tb_clk,
            --Inc => tb_inc,
            Res => tb_res,
            Out_PC   => tb_q
        );

    -- Clock generation process
    clk_process: process
    begin
        tb_clk <= '0';
        wait for 5 ns;
        tb_clk <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize inputs
        tb_d   <= "000";
        --tb_en  <= '0';
        --tb_inc <= '0';
        tb_res <= '0';
        
        -- Apply reset
        tb_res <= '0';
        wait for 10 ns;
        tb_res <= '0';
        
        -- Enable and increment counter
        --tb_en <= '1';
        wait for 10 ns;
        --tb_inc <= '1';
        wait for 10 ns;
        --tb_inc <= '0';
        wait for 10 ns;
        
        -- Change input value
        tb_d <= "011";
        wait for 10 ns;
        
        -- Disable counter
        --tb_en <= '0';
        --wait for 10 ns;
        
        -- Apply reset again
        tb_res <= '1';
        wait for 10 ns;
        tb_d <= "100";
                wait for 10 ns;
                --tb_en <= '1';
                        --wait for 10 ns;
         tb_res <= '0';
       wait for 10 ns;
       tb_d <= "101";
        wait for 10 ns;
        tb_res <= '1';
        
        -- Wait for some additional time
        wait for 10 ns;
        tb_res <= '0';
       wait for 10 ns;
       tb_d <= "110";
       tb_res <= '0';
      wait for 10 ns;
      tb_d <= "111";
        
        -- End the simulation
        wait;
    end process;

end Behavioral;
