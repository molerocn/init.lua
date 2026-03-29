-- chat chat
local function cambiar_proyecto_y_abrir_oil()
  -- 1. Recolectamos las carpetas nativamente
  local carpetas = {}
  for _, ruta in ipairs({ "~/", "~/projects/", "~/work/", "~/personal/" }) do
    local expandida = vim.fn.expand(ruta)
    for _, dir in ipairs(vim.fn.glob(expandida .. "*/", true, true)) do
      table.insert(carpetas, dir)
    end
  end

  -- 2. Construimos y abrimos Telescope
  require("telescope.pickers").new({}, {
    prompt_title = "Cambiar a Proyecto (Abre en Oil)",
    finder = require("telescope.finders").new_table({ results = carpetas }),
    sorter = require("telescope.config").values.generic_sorter({}),
    
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local seleccion = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        
        if seleccion then
          local dir = seleccion.value
          
          -- Cambiamos el directorio global (CWD)
          vim.api.nvim_set_current_dir(dir)
          
          -- Abrimos oil.nvim en el nuevo directorio de forma segura
          local status_ok, oil = pcall(require, "oil")
          if status_ok then
            oil.open(dir)
          else
            vim.notify("No se pudo cargar oil.nvim", vim.log.levels.ERROR)
          end
        end
      end)
      return true
    end,
  }):find()
end
