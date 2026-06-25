return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap
    { "<c-space>", mode = { "n", "x", "o" }, false },
    -- Simulate nvim-treesitter incremental selection
    { "<c-i>", mode = { "n", "o", "x" },
  function()
    require("flash").treesitter({
      actions = {
        ["<c-i>"] = "next",
        ["<BS>"] = "prev"
      }
    }) 
  end, desc = "Treesitter Incremental Selection" },
  },
}
