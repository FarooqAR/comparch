library verilog;
use verilog.vl_types.all;
entity D_FF is
    port(
        c               : in     vl_logic;
        r               : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end D_FF;
