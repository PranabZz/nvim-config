local M = {}

local function create_entry(type)
    local current_dir = vim.fn.getcwd()

    vim.ui.input({
        prompt = "Enter parent directory (relative to CWD or absolute):",
        default = current_dir,
        completion = "dir",
    }, function(target_dir)
        if not target_dir then
            print("Operation cancelled.")
            return
        end

        -- Ensure target_dir is absolute or resolved relative to CWD
        if not vim.startswith(target_dir, "/") and not vim.startswith(target_dir, "~") then
            target_dir = current_dir .. "/" .. target_dir
        end
        target_dir = vim.fs.normalize(target_dir) -- Resolve to absolute path

        vim.ui.input({
            prompt = "Enter " .. type .. " name:",
            default = "",
        }, function(name)
            if not name then
                print("Operation cancelled.")
                return
            end

            local full_path = target_dir .. "/" .. name

            local cmd
            if type == "file" then
                cmd = {"touch", full_path}
            else -- type == "folder"
                cmd = {"mkdir", "-p", full_path}
            end

            local result = vim.fn.system(cmd)
            if vim.v.shell_error == 0 then
                print(type:sub(1,1):upper() .. type:sub(2) .. " '" .. full_path .. "' created successfully.")
                -- Optional: open the file in a new buffer after creation
                if type == "file" then
                    vim.cmd("edit " .. full_path)
                end
            else
                print("Error creating " .. type .. ": " .. result)
            end
        end)
    end)
end

function M.create_file()
    create_entry("file")
end

function M.create_folder()
    create_entry("folder")
end

function M.create_entry_dialog()
    vim.ui.select({"File", "Folder"}, {
        prompt = "Create new:",
        kind = "list",
        -- dressing.nvim will enhance this
    }, function(choice)
        if choice == "File" then
            M.create_file()
        elseif choice == "Folder" then
            M.create_folder()
        else
            print("Operation cancelled.")
        end
    end)
end

-- Define user commands
vim.api.nvim_create_user_command('CreateFile', M.create_file, {
    desc = 'Create a new file interactively',
    nargs = 0
})

vim.api.nvim_create_user_command('CreateFolder', M.create_folder, {
    desc = 'Create a new folder interactively',
    nargs = 0
})

-- It's common practice to return the module table at the end of the file
return M