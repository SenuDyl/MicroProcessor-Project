----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 02:46:37 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NP is
    Port ( Clk : in STD_LOGIC;
    Res : in STD_LOGIC;
    Overflow_led : out STD_LOGIC;
    Zero_led : out STD_LOGIC;
    Reg_7 : out std_logic_vector(3 downto 0);
    --Reg_1 : out std_logic_vector(3 downto 0);
    Seg7_Anode : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    Seg7_Out : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0')
    );
end NP;

architecture Behavioral of NP is
component InsDecoder
Port ( -- the instruction from the PC register address
I_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
-- for the JZR instruction
I_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
I_Clk : in STD_LOGIC;
I_Reset: in STD_LOGIC;
-- enabling the relevant register in register bank
O_Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
-- selecting the relevant register input A for Add/Sub unit
O_Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
-- selecting the relevant register input B for Add/Sub unit
O_Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
-- enable writing to PC register
O_EN_PC : out STD_LOGIC;
-- enable writing to register bank registers
O_EN_Store : out STD_LOGIC;
-- add or sub for Add/Sub unit (1 for subtraction)
O_Add_Sub_Sel : out STD_LOGIC;
-- to determine if PC is incremented normally or by address from JZR instruction (1 to jump)
O_Jump_Flag : out STD_LOGIC;
-- jump address from JZR instruction
O_Jump_Addr : out STD_LOGIC_VECTOR (2 downto 0);
-- load immediate value or add/sub result (0 for imm, 1 for add/sub)
O_Load_Sel : out STD_LOGIC;
-- immediate value passed from instruction
O_Imm_Val : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component PC
Port ( In_MUX2_3 : in STD_LOGIC_VECTOR (2 downto 0);
           --EN : in STD_LOGIC;
           Clk : in STD_LOGIC;
           --Inc: in STD_LOGIC;
           Res: in STD_LOGIC; 
           Out_PC : inout STD_LOGIC_VECTOR (2 downto 0));
end component;

component PROM
Port ( address_new : in STD_LOGIC_VECTOR (2 downto 0);
           data_new : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component RegBank
Port ( I_Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           I_Data_In : in STD_LOGIC_VECTOR (3 downto 0);
           I_Reset : in STD_LOGIC;
           I_En_Store : in STD_LOGIC;
           I_Clk : in STD_LOGIC;
           Data_out_0:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_1:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_2:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_3:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_4:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_5:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_6:out STD_LOGIC_VECTOR (3 downto 0);
           Data_out_7:out STD_LOGIC_VECTOR (3 downto 0));
end component;


component Adder3bit
Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC);
end component;

component Add_SubUnit
    Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       CTRL : in STD_LOGIC;
       S0 : inout STD_LOGIC;
       S1 : inout STD_LOGIC;
       S2 : inout STD_LOGIC;
       S3 : inout STD_LOGIC;
       overflow: out STD_LOGIC;
       zero: out STD_LOGIC);
end component;

component MUX8
Port ( Reg_S : in STD_LOGIC_VECTOR (2 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Mux8_4_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Mux2_4bit
Port (In_Adder_4: in STD_LOGIC_VECTOR (3 downto 0);
           In_Imm : in STD_LOGIC_VECTOR (3 downto 0);
           In_load_S : in STD_LOGIC;
           Mux2_4_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux2_3bit
Port ( In_jAddress : in STD_LOGIC_VECTOR (2 downto 0);
           In_Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : in STD_LOGIC;
           Mux2_3_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component LUT_16_7New
Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal EN_PC, Add_Sub_Sel, jmpflg, Load_Sel, EN_Store,S_Clk: STD_LOGIC;
signal Data_Out_0 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_1 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_2 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_3 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_4 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_5 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_6 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_Out_7 : STD_LOGIC_VECTOR(3 downto 0);
signal Mem_Sel, Mux_2_3_out,Reg_Sel_A, Reg_Sel_B,jmpaddr: STD_LOGIC_VECTOR(2 downto 0);
signal Mux_8_4_A_out, Mux_8_4_B_out : STD_LOGIC_VECTOR(3 downto 0);
signal Imm_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Adder_4 : STD_LOGIC_VECTOR(3 downto 0);
signal Data_In : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR(2 downto 0);
signal Instruction : STD_LOGIC_VECTOR(11 downto 0);
signal bit_3_out : STD_LOGIC_VECTOR(2 downto 0);
signal led_address : STD_LOGIC_VECTOR (3 downto 0);
signal led_data : STD_LOGIC_VECTOR (6 downto 0);

begin
Slow_Clk_0:Slow_Clk
port map( Clk_in=>Clk,
       Clk_out=>S_Clk
);
Instruction_Decoder_0 : InsDecoder
Port map ( I_Instruction => Instruction,
    I_Jump_Check => Mux_8_4_A_out,
    I_Clk => S_Clk,
    I_Reset=> Res,
    O_Reg_Enable => Reg_Enable,
    O_Reg_Sel_A => Reg_Sel_A,
    O_Reg_Sel_B => Reg_Sel_B,
    O_EN_PC => EN_PC,
    O_EN_Store => EN_Store,
    O_Add_Sub_Sel => Add_Sub_Sel,
    O_Jump_Flag => jmpflg,
    O_Jump_Addr =>jmpaddr ,
    O_Load_Sel => Load_Sel,
    O_Imm_Val => Imm_Val
);

Program_Counter_0 : PC
port map(
Res => Res,
Clk => S_Clk,
--EN=> EN_PC,
In_MUX2_3 => Mux_2_3_out,
Out_PC => Mem_Sel
);

Program_ROM_0 : PROM
Port map(
address_new => Mem_Sel,
data_new => Instruction
);

Reg_Bank_0 : RegBank
Port map (
I_Clk => S_Clk,
I_Reg_Enable => Reg_Enable,
I_Data_In => Data_In,
I_EN_Store => '1',
Data_out_0 => Data_Out_0,
Data_out_1 => Data_Out_1,
Data_out_2 => Data_Out_2,
Data_out_3 => Data_Out_3,
Data_out_4 => Data_Out_4,
Data_out_5 => Data_Out_5,
Data_out_6 => Data_Out_6,
Data_out_7 => Data_Out_7,
I_Reset => Res
);

Adder_3_0 : Adder3bit
Port map(A0=> Mem_Sel(0),
A1=> Mem_Sel(1),
A2=> Mem_Sel(2),
B0=>'1',
B1=>'0',
B2=>'0',
S0=>bit_3_out(0),
S1=>bit_3_out(1),
S2=>bit_3_out(2)
);

Add_Sub_4_0 : Add_SubUnit
Port map( A0=> Mux_8_4_A_out(0),
A1=> Mux_8_4_A_out(1),
A2=> Mux_8_4_A_out(2),
A3=> Mux_8_4_A_out(3),
B0 => Mux_8_4_B_out(0),
B1 => Mux_8_4_B_out(1),
B2 => Mux_8_4_B_out(2),
B3 => Mux_8_4_B_out(3),
CTRL => Add_Sub_Sel,
S0 => Adder_4(0),
S1 => Adder_4(1),
S2 => Adder_4(2),
S3 => Adder_4(3),
overflow => Overflow_led,
zero => Zero_led
);

MUX_8_4_A : MUX8
Port map( D7 => Data_Out_7 ,
D6 => Data_Out_6,
D5 => Data_Out_5,
D4 => Data_Out_4,
D3 => Data_Out_3,
D2 => Data_Out_2,
D1 => Data_Out_1,
D0 => Data_Out_0,
Reg_S => Reg_Sel_A,
Mux8_4_out => Mux_8_4_A_out
);
MUX_8_4_B : MUX8
Port map( D7 => Data_Out_7 ,
D6 => Data_Out_6,
D5 => Data_Out_5,
D4 => Data_Out_4,
D3 => Data_Out_3,
D2 => Data_Out_2,
D1 => Data_Out_1,
D0 => Data_Out_0,
Reg_S => Reg_Sel_B,
Mux8_4_out => Mux_8_4_B_out
);
MUX_2_4_0 : Mux2_4bit
Port map( In_Imm => Imm_Val,
In_Adder_4 => Adder_4,
In_load_S => Load_Sel,
MUX2_4_out=> Data_In
);

MUX_2_3_0 :  Mux2_3bit
Port map( In_Adder_3 => bit_3_out,
In_jAddress=> jmpaddr ,
JumpFlag => jmpflg,
Mux2_3_out => Mux_2_3_out
);

LUT_16_7_0 : LUT_16_7New
port map(
address => led_address,
data => Seg7_Out
);

Reg_7<=Data_Out_7;
--Reg_1<=Data_Out_0;
led_address <= Data_Out_7;
Seg7_Anode <= "1110";


end Behavioral;
