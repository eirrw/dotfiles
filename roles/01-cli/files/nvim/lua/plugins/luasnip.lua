return {
  {
    'L3MON4D3/LuaSnip',
    version = '2.*',
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      }
    },
    build = "make install_jsregexp",
    opts = {
      keep_roots = true,
      link_roots = true,
      link_children = true,
      update_events = { "TextChanged", "TextChangedI" },
      delete_check_events = "TextChanged"
    },
  }
}
