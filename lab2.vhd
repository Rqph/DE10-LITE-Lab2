library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity lab2 is
	port(
		clk : in std_logic := '0';
		reset_n : in std_logic :='0';
		seg : out std_logic_vector(7 downto 0);
		seg2 : out std_logic_vector(7 downto 0);
		seg3 : out std_logic_vector(7 downto 0);
		button : in std_logic);
		
end entity lab2;

architecture rit of lab2 is

		component lab2_sys is
				  port (
						clk_clk                        : in  std_logic                    := 'X'; -- clk
						reset_reset_n                  : in  std_logic                    := 'X'; -- reset_n
						seg_external_connection_export : out std_logic_vector(7 downto 0);         -- export
						seg2_external_connection_export : out std_logic_vector(7 downto 0);        -- export
						seg3_external_connection_export : out std_logic_vector(7 downto 0);         -- export
						button_external_connection_export : in  std_logic
				  );
		end component lab2_sys;

		component bin_7seg is
					port (
						entree : in std_logic_vector(3 downto 0);
						sortie : out std_logic_vector(7 downto 0)
					);
		end component bin_7seg;

	 signal entreebin : std_logic_vector(7 downto 0);
	 signal entreebin2 : std_logic_vector(7 downto 0);
	 signal entreebin3 : std_logic_vector(7 downto 0);
	 
	 begin
	 
		u0 : component lab2_sys
		  port map (
				clk_clk                        => clk,       -- clk.clk
				reset_reset_n                  => reset_n,   -- reset.reset_n
				seg_external_connection_export => entreebin,-- seg_external_connection.export
				seg2_external_connection_export => entreebin2,        -- export
				seg3_external_connection_export => entreebin3,
				button_external_connection_export => button
		  );
			  
		u1 : component bin_7seg
			port map(
				entree => entreebin(3 downto 0),
				sortie => seg
			);
		
		u2 : component bin_7seg
			port map(
				entree => entreebin2(3 downto 0),
				sortie => seg2
			);
		
		u3 : component bin_7seg
			port map(
				entree => entreebin3(3 downto 0),
				sortie => seg3
			);
		  
end architecture;

