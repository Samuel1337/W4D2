

class Employee
    attr_reader :name, :salary, :title, :boss

    def initialize(name, salary, title, boss=nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
        
    end
    
    def bonus(multiplier)
        salary * multiplier
    end
end


employee1 = Employee.new("Shawna", 12000, "TA", "Darren")
employee2 = Employee.new("David", 10000, "TA", "Darren")



p "#{employee1.name} #{employee1.salary} #{employee1.title} #{employee1.boss}"
p "#{employee2.name} #{employee2.salary} #{employee2.title} #{employee2.boss}"