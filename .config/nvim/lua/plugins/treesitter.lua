return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'markdown',
          'vim',
          'vimdoc',
          'go',
          'gomod',
          'gosum',
          'gowork',
          'javascript',
          'typescript',
          'tsx',
          'jsdoc',
          'typst'
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
}
