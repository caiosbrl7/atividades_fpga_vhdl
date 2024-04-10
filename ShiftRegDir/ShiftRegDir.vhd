library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegisterDir is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           new_data : in  STD_LOGIC;
           dir : in STD_LOGIC; -- Direção do deslocamento
           shift_out : out STD_LOGIC_VECTOR (7 downto 0));
end ShiftRegisterDir;

architecture Behavioral of ShiftRegisterDir is
    signal temp_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp_reg <= (others => '0');
        elsif rising_edge(clk) then
            if dir = '0' then
                -- Desloca para a direita e adiciona o novo dado.
                temp_reg <= temp_reg(6 downto 0) & new_data;
            else
                -- Desloca para a esquerda e adiciona o novo dado no lado esquerdo.
                temp_reg <= new_data & temp_reg(7 downto 1);
            end if;
        end if;
    end process;
    
    shift_out <= temp_reg;
end Behavioral;
