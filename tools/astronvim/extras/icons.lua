-- Icons to be used by plugins
--
-- obtained from:
--    https://github.com/datamonsterr/astronvim_config/blob/main/icons.lua
--    https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/configs/cmp.lua
--
-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet
--   פּ ﯟ   蘒練 some other good icons

return {
  kind = {
    Array             = "",
    Boolean           = "⊨",
    Class             = "",
    Color             = "",
    Constant          = "",
    Constructor       = "",
    Enum              = "",
    EnumMember        = "",
    Event             = "",
    Field             = "ﰠ",
    File              = "",
    Folder            = "",
    Function          = "",
    Interface         = "",
    Key               = "",
    Keyword           = "",
    Method            = "",
    Misc              = " ",
    Module            = "",
    Namespace         = "",
    Null              = "NULL",
    Number            = "#",
    Object            = "⦿",
    Operator          = "",
    Package           = "",
    Property          = "",
    Reference         = "",
    String            = "𝓐",
    Struct            = "פּ",
    Snippet           = "",
    Text              = "",
    TypeParameter     = "",
    Unit              = "",
    Value             = "",
    Variable          = "",
  },
  type = {
    Array             = " ",
    Number            = " ",
    String            = " ",
    Boolean           = " ",
    Object            = " ",
  },
  documents = {
    File              = " ",
    Files             = " ",
    Folder            = " ",
    OpenFolder        = " ",
  },
  git = {
    Branch            = " ",
    Add               = " ",
    Modify            = " ",
    Remove            = " ",
    Ignore            = " ",
    Rename            = " ",
    Diff              = " ",
    Repo              = " ",
    -- Add               = " ",
    -- Modify            = " ",
    -- Remove            = " ",
  },
  ui = {
    Lock              = " ",
    Circle            = " ",
    BigCircle         = " ",
    BigUnfilledCircle = " ",
    Close             = " ",
    NewFile           = " ",
    Search            = " ",
    Lightbulb         = " ",
    Project           = " ",
    Dashboard         = " ",
    History           = " ",
    Comment           = " ",
    Bug               = " ",
    Code              = " ",
    Telescope         = " ",
    -- Gear              = " ",
    Gear              = "  ",
    Package           = " ",
    List              = " ",
    SignIn            = " ",
    Check             = " ",
    Fire              = " ",
    Note              = " ",
    BookMark          = " ",
    Pencil            = " ",
    ChevronRight      = "",
    Table             = " ",
    Calendar          = " ",
  },
  diagnostics = {
    Error             = " ",
    Warning           = " ",
    Information       = " ",
    Question          = " ",
    Hint              = " ",
  },
  misc = {
    Robot             = " ",
    Squirrel          = " ",
    Tag               = " ",
    Watch             = " ",
  },
}