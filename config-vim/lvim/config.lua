lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
lvim.use_icons = false

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true
--lvim.builtin.nvimtree.setup.view.side = "left" 
--lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
 
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

-- Función para navegar entre ventanas divididas en todas las direcciones
function NavigateWindows(direction)
  local current_win = vim.api.nvim_get_current_win()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  local current_row = vim.api.nvim_win_get_cursor(current_win)[1]

  local function is_horizontal()
    return vim.api.nvim_win_get_width(current_win) > 1
  end

  if direction == "j" then
    if is_horizontal() then
      vim.cmd("wincmd j")
    else
      local next_win = vim.fn.win_id2win(vim.fn.win_gotoid(current_win) + 1)
      if next_win > 0 then
        vim.api.nvim_set_current_win(next_win)
      end
    end
  elseif direction == "k" then
    if is_horizontal() then
      vim.cmd("wincmd k")
    else
      local prev_win = vim.fn.win_id2win(vim.fn.win_gotoid(current_win) - 1)
      if prev_win > 0 then
        vim.api.nvim_set_current_win(prev_win)
      end
    end
  elseif direction == "h" then
    if is_horizontal() then
      vim.cmd("wincmd h")
    else
      vim.cmd("wincmd p")
    end
  elseif direction == "l" then
    if is_horizontal() then
      vim.cmd("wincmd l")
    else
      vim.cmd("wincmd n")
    end
  end

  local new_row = vim.api.nvim_win_get_cursor(current_win)[1]
  if new_row ~= current_row then
    vim.api.nvim_win_set_cursor(current_win, { new_row, 0 })
  end
end
--instalador de paquetes 
lvim.lsp.installer.setup.automatic_installation = true
--lvim.transparent_window = true
--guarda y salir rapido
--lvim.keys.normal_mode["<C-ñ"] = ":q!<CR>"
lvim.keys.normal_mode["<C-x>"] = ":x<CR>"
--plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { "arcticicestudio/nord-vim" },
  { "mfussenegger/nvim-jdtls" },
  { "TovarishFin/vim-solidity" },
  { "shaunsingh/moonlight.nvim" },
  { "navarasu/onedark.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "nxvu699134/vn-night.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "titanzero/zephyrium" },
  { "rebelot/kanagawa.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "cpea2506/one_monokai.nvim" },
  { "yamatsum/nvim-nonicons" },
  { "ziontee113/icon-picker.nvim" },
}

lvim.keys.normal_mode["<C-m>"] = ":Sexplore<CR>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"
-- Configuración del navegador (Tree)
lvim.builtin.nvimtree.side = "left" -- Ubicación del navegador (left|right|bottom|top)
lvim.builtin.nvimtree.width = 30 -- Ancho del navegador
--abiri ventanas de archivos
lvim.keys.normal_mode["<C-b>"] = ":tabnew<Space>"
--atajo de depligue de el editor
lvim.keys.normal_mode["<C-h>"] = ":split<CR>"
lvim.keys.normal_mode["<C-j>"] = ":vsp<CR>"
lvim.keys.normal_mode["<C-k>"] = ":vsp<CR>"
lvim.keys.normal_mode["<C-l>"] = ":tabnew<CR>"
--atajo para abrir una terminal de manera is_horizontal
lvim.keys.normal_mode["<C-t>"] = ":split | terminal<CR>"
--ataja para salir de las ventanas
lvim.keys.normal_mode["<C-w>"] = ":q<CR>"
-- Moverse entre ventanas divididas en cualquier dirección con una sola tecla
lvim.keys.normal_mode["<C-Down>"] = ":<C-u>lua NavigateWindows('j')<CR>"
lvim.keys.normal_mode["<C-Up>"] = ":<C-u>lua NavigateWindows('k')<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":<C-u>lua NavigateWindows('h')<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":<C-u>lua NavigateWindows('l')<CR>"

-- Configurar la pantalla de inicio (dashboard)
lvim.builtin.alpha.active = true
lvim.builtin.alpha.startify.custom_header = {
  "██╗  ██╗███████╗██╗     ██████╗ ██╗  ██╗",
  "██║  ██║██╔════╝██║     ██╔══██╗╚██╗██╔╝",
  "███████║█████╗  ██║     ██████╔╝ ╚███╔╝ ",
  "██╔══██║██╔══╝  ██║     ██╔═══╝  ██╔██╗ ",
  "██║  ██║███████╗███████╗██║      ██╔╝ ██╗",
  "╚═╝  ╚═╝╚══════╝╚══════╝╚═╝      ╚═╝  ╚═╝",
}
lvim.builtin.alpha.startify.section.header.val = { "" }
lvim.builtin.alpha.startify.section.footer.val = {
  "   For more info, visit: https://neovim.io/",
  "                  https://github.com/ChristianChiarulli/LunarVim",
}

-- Puedes agregar más configuraciones de LSP personalizadas aquí

-- Si deseas agregar otros complementos, descomenta y ajusta esta sección
-- lvim.plugins = {
--   {
--     "folke/trouble.nvim",
--     cmd = "TroubleToggle",
--   },
--   -- Puedes agregar más complementos aquí
-- }

-- Finalmente, no olvides guardar los cambios y reiniciar Lvim para que surtan efecto.
-- ... Otras configuraciones ...

-- Configuración del linter para YAML
lvim.lsp.automatic_configuration["yaml"] = {
  linters = {
    {
      exe = "vint",
      args = {},
    },
  },
}

-- ... Otras configuraciones ...
local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
  -- Opciones específicas del servidor LSP de Python (pyright) aquí
  -- Por ejemplo, para cambiar el nivel de severidad de los diagnósticos:
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = false,
        useLibraryCodeForTypes = false,
      },
    },
  },
})

local lspconfig = require('lspconfig')

lspconfig.terraformls.setup({
  -- Opciones específicas del servidor LSP de Terraform (terraform-ls) aquí
  -- Por ejemplo, para cambiar el nivel de severidad de los diagnósticos:
  settings = {
    telemetry = {
      enable = false,
    },
    formatting = {
      enable = true,
    },
    diagnostics = {
      enable = true,
      severity = "warning", -- Puedes usar "hint", "information", "warning", o "error"
    },
  },
})
lvim.builtin.terminal.active = true



