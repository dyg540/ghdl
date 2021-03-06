entity tb_rec05 is
end tb_rec05;

library ieee;
use ieee.std_logic_1164.all;
use work.rec05_pkg.all;

architecture behav of tb_rec05 is
  signal inp : myrec;
  signal r : std_logic;
begin
  dut: entity work.rec05
    port map (inp => inp, o => r);

  process
  begin
    inp.a <= "0000";
    inp.b <= '1';
    wait for 1 ns;
    assert r = '0' severity failure;

    inp.a <= "0010";
    inp.b <= '1';
    wait for 1 ns;
    assert r = '1' severity failure;

    inp.a <= "1101";
    inp.b <= '0';
    wait for 1 ns;
    assert r = '1' severity failure;

    inp.a <= "1101";
    inp.b <= '1';
    wait for 1 ns;
    assert r = '0' severity failure;

    wait;
  end process;
end behav;
