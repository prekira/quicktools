require 'watir'
require 'yaml'

def execute
	puts "which site list?"
	while user_input = gets.chomp
		if user_input.eql? 'kill'
			break
		else 
			get_browser(load_list(user_input + ".yml"))
		end
	end
end

def load_list(file_path)
	return YAML.load(File.read(file_path)).get("sites")
end

def get_browser(site_list)
	browser = Watir::Browser.new :firefox	
	browser.goto 'google.com'
	for i in site_list do 
		go_to_link(i)
	end
end

def go_to_link(link)
	browser.goto 'http://the-internet.herokuapp.com'
	browser.link(text: 'A/B Testing').click(:command, :shift)
        browser.goto link
       	browser.windows.last.use
end



execute
#empty gets to keep browser open while script open
gets
