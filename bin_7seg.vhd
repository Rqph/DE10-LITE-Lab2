library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_7seg is
	port(
		entree : in std_logic_vector(3 downto 0);
		sortie : out std_logic_vector(7 downto 0));
	
end entity bin_7seg;

architecture arch of bin_7seg is
	signal s : std_logic_vector(3 downto 0);
	begin
		s <= entree;
		process(s)
		-- 0 = "0011 1111"
		-- 1 = "0000 0110"
		-- 2 = "0101 1011"
		-- 3 = "0100 1111"
		-- 4 = "0110 0110"
		-- 5 = "0110 1101"
		-- 6 = "0111 1101"
		-- 7 = "0100 0111"
		-- 8 = "0111 1111"
		-- 9 = "0110 0111"
		begin
			case(s) is
				when "0000" => sortie <= not("00111111");
				when "0001" => sortie <= not("00000110");
				when "0010" => sortie <= not("01011011");
				when "0011" => sortie <= not("01001111");
				when "0100" => sortie <= not("01100110");
				when "0101" => sortie <= not("01101101");
				when "0110" => sortie <= not("01111101");
				when "0111" => sortie <= not("01000111");
				when "1000" => sortie <= not("01111111");
				when "1001" => sortie <= not("01100111");
				when others => sortie <= "00000000";
			end case;
		end process;
end architecture;