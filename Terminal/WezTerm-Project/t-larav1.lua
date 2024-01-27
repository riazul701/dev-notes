local function startup(wezterm)
  local mux = wezterm.mux
	
  --wezterm.log_info(os.getenv("WZ_RUNTIME"))
  local operating_system = os.getenv("OS")
  local runtime_env = os.getenv("WZ_RUNTIME")
  local project_dir = ""
  if operating_system == "Windows_NT" then
    project_dir = "e:\\xampp_8.2.4\\htdocs\\t-larav1"
	project_domain = "WSL:Ubuntu-22.04"
  else	
    project_dir = "/e/xampp_8.2.4/htdocs/t-larav1"
	project_domain = "local"
  end

  -- Docker Container
  if runtime_env == "docker" then
    local editor_tab, editor_pane, window = mux.spawn_window {
      cwd = project_dir,
      workspace = 't-larav1',
      domain = { DomainName = project_domain }
    }
    editor_tab:set_title 'Editor'
    editor_pane:send_text 'docker container exec -it e_xampp_824_php-apache_1 bash\n'
    editor_pane:send_text 'cd /var/www/html/t-larav1\n'
    editor_pane:send_text 'lvim\n'

    local terminal_tab, terminal_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    terminal_tab:set_title 'Terminal'
    terminal_pane:send_text 'docker container exec -it e_xampp_824_php-apache_1 bash\n'
    terminal_pane:send_text 'cd /var/www/html/t-larav1\n'

    local git_tab, git_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    git_tab:set_title 'Git'
    git_pane:send_text 'docker container exec -it e_xampp_824_php-apache_1 bash\n'
    git_pane:send_text 'cd /var/www/html/t-larav1\n'
    git_pane:send_text 'lazygit\n'

    local database_tab, database_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    database_tab:set_title 'Database'
    database_pane:send_text 'docker container exec -it e_xampp_824_php-apache_1 bash\n'
    database_pane:send_text 'cd /var/www/html/t-larav1\n'

    local markdown_tab, markdown_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    markdown_tab:set_title 'Markdown'
	  markdown_pane:send_text 'docker container exec -it e_xampp_824_php-apache_1 bash\n'
    markdown_pane:send_text 'cd /var/www/html/t-larav1\n'
  -- General (Xampp)	
  else
    local editor_tab, editor_pane, window = mux.spawn_window {
      cwd = project_dir,
      workspace = 't-larav1'
    }
	editor_tab:set_title 'Editor'
    editor_pane:send_text 'lvim\n'
	
	local terminal_tab, terminal_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    terminal_tab:set_title 'Terminal'

    local git_tab, git_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    git_tab:set_title 'Git'
    git_pane:send_text 'lazygit\n'

    local database_tab, database_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    database_tab:set_title 'Database'

    local markdown_tab, markdown_pane, window = window:spawn_tab {
      cwd = project_dir 
    }
    markdown_tab:set_title 'Markdown'
  end
  
end

return {
  startup = startup
}
