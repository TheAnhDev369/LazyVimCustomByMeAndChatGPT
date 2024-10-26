return {
  -- Theme Catppuccin (currently loaded)
  {
    "catppuccin/nvim",
    lazy = false, -- Set lazy = false to ensure it loads immediately
    name = "catppuccin",
    opts = {
      transparent_background = true, -- Đảm bảo nền trong suốt
    },
  },

  -- Theme Tokyo Night (add this to load it instead)
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Set this to false to load immediately
    opts = {
      style = "moon",
      transparent = true, -- Nền trong suốt
      styles = {
        sidebars = "transparent", -- Nền sidebar trong suốt
        floats = "transparent", -- Nền float trong suốt
      },
    },
  },

  -- Configure LazyVim to load the selected colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight", -- Set default colorscheme to Tokyo Night
    },
  },

  -- Neo Tree configuration
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 25, -- Width of the Neo Tree window
        position = "left", -- Position of the Neo Tree window
        mappings = {
          ["<space>"] = "toggle_node", -- Example of a key mapping
        },
        -- Customize the appearance
        background = {
          color = "none", -- No background color to make it transparent
        },
      },
    },
  },

  -- ToggleTerm configuration
  {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<C-t>]], -- Gán Ctrl + t để mở terminal
        direction = 'horizontal', -- Chế độ mở terminal theo chiều ngang
        size = 20, -- Kích thước terminal
        shell = 'pwsh', -- Sử dụng PowerShell làm shell
      }

      -- Tạo hàm để mở/đóng terminal
      function _G.toggle_terminal()
        local terminal_bufnr = vim.fn.bufnr('toggleterm#1')
        if vim.fn.bufexists(terminal_bufnr) == 1 then
          vim.cmd('bd! ' .. terminal_bufnr) -- Đóng terminal nếu nó đã mở
        else
          vim.cmd('ToggleTerm') -- Mở terminal nếu chưa mở
        end
      end

      -- Cập nhật phím tắt cho hàm toggle_terminal
      vim.api.nvim_set_keymap('n', '<C-t>', [[<Cmd>lua toggle_terminal()<CR>]], { noremap = true, silent = true })
    end,
  },
}
