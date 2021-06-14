require'colorizer'.setup(
  {'*';},
  {
    mode     = 'background';
    names    = false;
    RGB      = true;          -- #RGB hex codes
    RRGGBB   = true;          -- #RRGGBB hex codes
    RRGGBBAA = false;         -- #RRGGBBAA hex codes
    rgb_fn   = false;         -- CSS rgb() and rgba() functions
    hsl_fn   = false;         -- CSS hsl() and hsla() functions
    css_fn   = false;
    css = {
        rgb_fn   = true;      -- CSS rgb() and rgba() functions
        css_fn   = true;
        RRGGBBAA = true;
        names    = true;
        hsl_fn   = true;      -- CSS hsl() and hsla() functions
    };
    vim = { names = true; };
  })

