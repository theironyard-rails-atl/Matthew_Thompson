class Student
  def initialize(name)
    @name = name
  end


  #same as attr_writer
  def name= new_name
    @name = new_name
  end

  #same as attr_reader
  def name
    @name
  end

  #attr_accesor does both 
end
