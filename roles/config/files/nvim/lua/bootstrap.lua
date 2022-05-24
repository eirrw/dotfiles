local function clone_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end

    return packer_bootstrap
end

local function bootstrap()
    if clone_packer() then
        vim.cmd('autocmd User PackerComplete quitall')
        vim.cmd('packloadall')

        require('plugins').sync()
    else
        vim.cmd('quitall')
    end
end

return { bootstrap = bootstrap }
