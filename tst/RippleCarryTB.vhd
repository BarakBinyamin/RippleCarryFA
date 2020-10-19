library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity RippleCarryTB is
end RippleCarryTB;


architecture Behavioral of RippleCarryTB is
 type test_vector is record
                A	: std_logic_vector(4-1 downto 0);
		B	: std_logic_vector(4-1 downto 0);
		OP	: std_logic;
		SUM : std_logic_vector(4-1 downto 0);
     end record;
     
     type test_array is array (natural range <>) of test_vector;
constant test_vector_array : test_array := (
--0+0=0
	(A => "0000", B => "0000", OP=>'0', SUM => "0000"),
--2+2=4
	(A => "0010", B => "0010", OP=>'0', SUM => "0100"),
--15+15=30 --> 0000
        (A => "1111", B => "1111", OP=>'0', SUM => "0000"),
--15 + 0
	(A => "1111", B => "0000", OP=>'0', SUM => "1111"),
--5-5=10
        (A => "0101", B => "0101", OP=>'0', SUM => "1010"),
    
--0-0=0
	(A => "0000", B => "0000", OP=>'1', SUM => "0000"),
--15-15=0 0
        (A => "1111", B => "1111", OP=>'1', SUM => "0000"),
--0-15 =-15 => but smallest number is -8
	(A => "0000", B => "1111", OP=>'1', SUM => "0000"),
--0-8=-8
        (A => "0000", B => "1000", OP=>'1', SUM => "1000"),
--10-5=5
	(A => "1010", B => "0101", OP=>'1', SUM => "0101")
    
	);

	SIGNAL OP          : std_logic := '0';
        SIGNAL A, B, SUM   : std_logic_vector (4-1 DOWNTO 0) := (OTHERS => '0');
  
	
        signal clk     : std_logic;
	CONSTANT delay : TIME := 50 ns;
begin

    UUT: entity work.RippleCarryFA
    GENERIC map(N => 4)
	Port map(
		A    => A,
		B    => B,
		OP   => OP,
		SUM  => SUM
		);
		
clk_proc:process
begin
	clk <= '1';
	wait for delay;
	clk <= '0';
	wait for delay;
end process;

stim_proc:process
begin
	for i in 0 to test_vector_array'length loop
		wait until clk='0';
		A   <= test_vector_array(i).A;
		B   <= test_vector_array(i).B;
		OP  <= test_vector_array(i).OP;
        wait for 10ns;
        assert SUM = test_vector_array(i).SUM
        report "SUM is not correct in test " & integer'image(i) severity error;
	end loop;
	wait until clk='0';

    assert false
        report "Testbench Concluded"
        severity failure;
end process;

end Behavioral;
