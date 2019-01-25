library verilog;
use verilog.vl_types.all;
entity T_FF is
    port(
        c               : in     vl_logic;
        r               : in     vl_logic;
        q               : out    vl_logic
    );
end T_FF;
