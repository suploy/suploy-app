Given /I have a valid ssh\-key added/ do
	User.find_by_name('test').ssh_keys.create(title: 'title', key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbfUwjwXdbu2OwZXBxQO4i5yzy6ZUZireac1Ux01KPWy71hyZMf42H65c+bH/A8Y8fyoU48bUYHDx+dmNst9h7yN+DXjPyn1ZamP8D3UeTyQ6zoDUzcfFb/y7tUfb3n2UufeFYQLIcbb1zOFmdQZ644CrQE9icLZUf73CoHOpGEsuJDaucZ9QfDE+KbCgGDx3oWXm3vxkorbfA1GxQ28TREFS2ELT/qPg7BiOyLWnmPGLSQ4OFZZ1WZ6nfUN5+H3wfGqbNmp3ddfOmo+LFGqYGTTZmO18wpu1yrL7ouQ7KOA/1S55IPDh3cTzN6xcB6FDzPAweOMYsBsGzYefdjc3d frederic@frederic-desktop')
end

When /I provide a title/ do
	fill_in 'ssh_key_title', with: 'title'
end

When /I provide a valid ssh-key/ do
	fill_in 'ssh_key_key', with: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbfUwjwXdbu2OwZXBxQO4i5yzy6ZUZireac1Ux01KPWy71hyZMf42H65c+bH/A8Y8fyoU48bUYHDx+dmNst9h7yN+DXjPyn1ZamP8D3UeTyQ6zoDUzcfFb/y7tUfb3n2UufeFYQLIcbb1zOFmdQZ644CrQE9icLZUf73CoHOpGEsuJDaucZ9QfDE+KbCgGDx3oWXm3vxkorbfA1GxQ28TREFS2ELT/qPg7BiOyLWnmPGLSQ4OFZZ1WZ6nfUN5+H3wfGqbNmp3ddfOmo+LFGqYGTTZmO18wpu1yrL7ouQ7KOA/1S55IPDh3cTzN6xcB6FDzPAweOMYsBsGzYefdjc3d frederic@frederic-desktop'
end
