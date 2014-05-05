module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
		when /the register page/
			'/users/sign_up'
		when /the login page/
			'/users/sign_in'
		when /my profile page/
			'/users/edit'
		when /the new ssh-key page/
			'/profiles/ssh_keys/new'
		when /the sshkey overview page/
			'/profiles/ssh_keys'
		when /the app list/
			'/apps'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
