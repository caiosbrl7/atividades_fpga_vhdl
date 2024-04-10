library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           new_data : in  STD_LOGIC;
           shift_out : out STD_LOGIC_VECTOR (7 downto 0));
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    -- Declaração de um vetor temporário para armazenamento dos dados atuais.
    signal temp_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    -- Processo sensível ao clock e ao reset
    process(clk, reset)
    begin
        if reset = '1' then
            -- Se reset estiver ativo, limpa o registrador.
            temp_reg <= (others => '0');
        elsif rising_edge(clk) then
            -- Nas bordas de subida do clock, executa o deslocamento e insere o novo dado.
            temp_reg <= temp_reg(6 downto 0) & new_data; -- Desloca os bits e adiciona o novo dado no lado direito.
        end if;
    end process;
    
    -- Atribui o valor do registrador temporário à saída.
    shift_out <= temp_reg;
end Behavioral;
