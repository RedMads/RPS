require "colorize"



module Banner


    def print_banner()
banner = """
____________________  _________
\\______   \\______   \\/   _____/
|       _/|     ___/\\_____  \\ 
|    |   \\|    |    /        \\
|____|_  /|____|   /_______  /
        \\/                  \\/ 
""" 

version = "                            v1.0\n"
name = "        By RedMad :$\n"
github = "https://github.com/RedMads/\n\n\n"
        puts banner + version + name + github

    end

end