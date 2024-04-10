library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pattern_counter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        output_pattern : out STD_LOGIC_VECTOR (3 downto 0)
    );
end pattern_counter;

architecture Behavioral of pattern_counter is
    type state_type is (s8, s6_first, s2, s5, s6_second, s1);
    signal state, next_state: state_type;
    signal pattern: STD_LOGIC_VECTOR (3 downto 0); -- Intermediate signal for the output pattern
begin

    -- Assign the intermediate pattern signal to the actual output port
    output_pattern <= pattern;

    process(clk, reset)
    begin
        if reset = '1' then
            state <= s8;
            pattern <= "1000"; -- 8 in binary
        elsif rising_edge(clk) then
            state <= next_state;
            case state is
                when s8 =>
                    pattern <= "0110"; -- 6
                    next_state <= s6_first;
                when s6_first =>
                    pattern <= "0010"; -- 2
                    next_state <= s2;
                when s2 =>
                    pattern <= "0101"; -- 5
                    next_state <= s5;
                when s5 =>
                    pattern <= "0110"; -- 6 again
                    next_state <= s6_second;
                when s6_second =>
                    pattern <= "0001"; -- 1
                    next_state <= s1;
                when s1 =>
                    pattern <= "1000"; -- Back to 8
                    next_state <= s8;
                when others =>
                    pattern <= (others => 'X'); -- Invalid state
            end case;
        end if;
    end process;
end Behavioral;
