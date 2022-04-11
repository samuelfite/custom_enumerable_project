module Enumerable
  # Your code goes here
   def my_each_with_index()
      index = 0
      while index < self.length do 
         yield self[index], index
         index += 1
      end
      return self
   end

   def my_select()
      ary = []
      index = 0
      while index < self.length do 
         if yield self[index]
            ary.push(self[index]) 
         end
         index += 1
      end
      return ary
   end

   def my_all?()
      index = 0
      ret = true
      while index < self.length do 
         if not yield self[index]
            ret = false 
         end
         index += 1
      end
      return ret
   end

   def my_any?()
      index = 0
      ret = false 
      while index < self.length do 
         if yield self[index]
            ret = true 
         end
         index += 1
      end
      return ret
   end

   def my_none?()
      index = 0
      ret = true
      while index < self.length do 
         if yield self[index]
            ret = false
         end
         index += 1
      end
      return ret
   end

   def my_count()
      if not block_given?
         return self.length
      end
      index = 0
      count = 0
      while index < self.length do 
         if yield self[index]
            count += 1
         end
         index += 1
      end
      return count
   end

   # take a proc
   def my_map(given_proc=nil)
      if not block_given? and not given_proc
         return self
      end
      ary = []
      index = 0
      while index < self.length do 
         if block_given?
            ary.push( yield self[index] )
         else
            ary.push( given_proc.call( self[index] ) )
         end
         index += 1
      end
      return ary
   end

   def my_inject(initial=nil)
      acc = 0
      if not initial
         initial = 0
      else
         acc = initial
      end
      index = 0
      while index < self.length do 
         acc = yield acc, self[index]
         index += 1
      end
      return acc
   end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
   def my_each
      index = 0
      while index < self.length do 
         yield self[index] 
         index += 1
      end
      return self
   end
end
