local function clone_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    local packer_bootstrap=true
    if fn.empty(fn.glob(install_path)) > 0 then
      print('installing packer')
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end

    print('packer installed!')

    return packer_bootstrap
end

local function bootstrap()
    if clone_packer() then
        vim.cmd('autocmd User PackerComplete quitall')
        vim.cmd('packloadall')

        require('plugins').sync()
    else
	print('could not bootstrap packer!')
        vim.cmd('quitall')
    end
end

return { bootstrap = bootstrap }
