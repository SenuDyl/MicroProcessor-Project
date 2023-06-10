library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegBank is
    Port (
        I_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
        I_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
        I_Reset : in STD_LOGIC;
        I_En_Store : in STD_LOGIC;
        I_Clk : in STD_LOGIC;
        --Data_out : out STD_LOGIC_VECTOR (31 downto 0)
        Data_out_0:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_1:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_2:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_3:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_4:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_5:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_6:out STD_LOGIC_VECTOR (3 downto 0);
        Data_out_7:out STD_LOGIC_VECTOR (3 downto 0)
        
    );
end RegBank;

architecture Behavioral of RegBank is
    component Decoder3New is
        Port (
            I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    component Register4 is
        Port (
            D : in STD_LOGIC_VECTOR (3 downto 0);
            En : in STD_LOGIC;
            En_Store : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal Reg_Sel : STD_LOGIC_VECTOR(7 downto 0);

begin
    Decoder3_8_0: Decoder3New
    port map (
        I => I_Reg_Enable,
        EN => I_En_Store,
        Y => Reg_Sel
    );

    --Data_out(31 downto 28) <= "0000";
    Data_out_0 <= "0000";

    Reg_1: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(1),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_1
    );

    Reg_2: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(2),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_2
    );

    Reg_3: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(3),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_3
    );

    Reg_4: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(4),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_4
    );

    Reg_5: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(5),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_5
    );

    Reg_6: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(6),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_6
    );

    Reg_7: Register4
    port map (
        D => I_Data_In,
        En => Reg_Sel(7),
        En_Store => I_En_Store,
        Res => I_Reset,
        Clk => I_Clk,
        Q => Data_out_7
    );

end Behavioral;
