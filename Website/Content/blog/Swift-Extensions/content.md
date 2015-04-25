# Swift Extensions

You use extensions when you want to add methods and <em>computed properties</em> to a class, structure or enumeration that already exists.  This comes in handy when you want new behavior for a type, but only in a particular context.  Extensions will remind Objective-C programmers of categories.

To extend a type, you use the <span id="inlinecode">extension</span> keyword followed by the name of the type that you wish to extend.

	class Person {
		
	    var name: String = "Name"
	    var age:Int = 0
    
	    func profile() -> String {
	        return "I'm \(self.name) and I'm \(self.age) years old."
	    }
	}

	extension Person {
		
	    var dogYears:Int {
			
	    	get{
	        	return self.age * 7
	    	}
	    }
	}

	var p = Person()
	p.name = "Matt"
	p.age = 40

	println(p.dogYears)
	
<span id="codelisting"><center><strong><em>Code Listing 45-1</strong></em> Extending Person Class </center></span></pre>

As you can see in Code Listing 45-1, you just need to use the <span id="inlinecode">extension</span> keyword followed by the name of the class.  Once you have that in place you may add your computed properties, methods and other type definitions.  In the last line of code you print out the information from the new computed property <span id="inlinecode">dogYears</span> which is 280.