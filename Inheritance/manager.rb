require_relative "employee"

class Manager < Employee
    def initialize(name, salary, title, boss)
        super(name, salary, title, boss)
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        employees.each { |employee| sum += employee.salary }
        sum * multiplier
    end

    def add_employees(employee)
        @employees << employee
        employee.boss = self.name
    end

end

boss = Manager.new("Ned", 1000000, "Founder", nil)
manager = Manager.new("Darren", 78000, "TA Manager", "Ned")
p "#{boss.name} #{boss.salary} #{boss.title} #{boss.boss}"
p "#{manager.name} #{manager.salary} #{manager.title} #{manager.boss}"