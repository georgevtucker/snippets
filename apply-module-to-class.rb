#PROBLEM: You want to add instance methods from a module (or modules) to specific objects. You don't want to mix the modules into the object's class, because you want certain objects to have special abilities. 

#SOLUTION

#Use the Object#extend method.

#For example, let's say we have a mild-mannered Person class:

	 class Person
	 	attr_reader :name, :age, :occupation

	 def initialize(name, age, occupation)
	 	@name, @age, @occupation = name, age, occupation
	 end

	 def mild_mannered?
	 	true
	 end
	end

	# Now let's create a couple instances of this class:

	jimmy = Person.new('Jimmy Olsen', 21, 'cub reporter')
	clark = Person.new('Clark Kent', 35, 'reporter')
	jimmy.mild_mannered?					# => true
	clark.mild_mannered? 					# => true

#But it happens that some Person objects are not as mild-mannered as they might appear. Some of them have superpowers!

	module SuperPowers
		def fly
			'Flying!'
		end

		def leap(what)
			"Leaping #{what} in a single bound!"
		end

		def mild_mannered?
			false
		end

		def superhero_name
			'Superman'
		end
	end

#If we use include to mix the SuperPowers module into the Person class, it will give every person superpowers. Some people are bound to misuse such power. Instead, we'll use extend to give superpowers only to certain people:

	clark.extend(SuperPowers)
	clark.superhero_name			# => "Superman"
	clark.fly						# => "Flying!"
	clark.mild_mannered?			# => false
	jimmy.mild_mannered?			# => true


#The extend method is used to mix a module's methods into an object, while include is used to mix a module's methods into a class. 

#The astute reader might point out that classes are actually objects in Ruby. Let's see what happens when we use extend in a class definition:

	class Person
		extend SuperPowers
	end

	#which is equivalent to:
	Person.extend(SuperPowers)

#What exactly are we extending here? Within the class definition, extend is being called on the Person class itself; we could have also written self.extend(SuperPowers). We're extending the Person class with the methods defined in SuperPowers. This means that the methods defined in the SuperPowers module have now become class methods of Person:

	Person.superhero_name			# => "Superman"
	Person.fly        				# => "Flying!"

#This is NOT WHAT WE INTENDED in this case. However, sometimes you do want to mix methods into a class, and Class#extend is an easy and powerful way to do it. 
