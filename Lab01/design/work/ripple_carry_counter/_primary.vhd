library verilog;
use verilog.vl_types.all;
entity ripple_carry_counter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        q               : out    vl_logic_vector(4 downto 0)
    );
end ripple_carry_counter;
