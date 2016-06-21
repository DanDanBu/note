class Computer
    @@users = Hash.new
    def initialize(username, password)
        @username = username
        @password = password
        @files = Hash.new
        @@users[username] = password
    end
    
    def create(filename)
        time = Time.now
        @files[filename] = time
        puts "#{filename}, #{username}, #{time}"
    end
    
    def update(filename)
        time = Time.now
        @files[filename] = time
        puts "update #{filename}, when #{time}"
    end
    
    def Computer.get_users
        return @@users
    end
end

my_computer = Computer.new("Dan", "123")
