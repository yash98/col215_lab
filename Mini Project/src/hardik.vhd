entity crc is
port map (
        load: in std_logic;
        reset: in std_logic;
        done: out std_logic;
        crc_disp: in std_logic_vector(15 downto 0); -- display calculated crc on ssd from bram 2
        data_inp: in std_logic_vector(15 downto 0); -- write to
        we_inp: out std_logic_vector();
        we_crc: out std_logic_vector();
        addr_inp: out std_logic_vector(15 downto 0);
        addr_crc: out std_logic_vector(15 downto 0);
    );
end entity;
