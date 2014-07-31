class Musher
  #Define Musher class such that Musher.new("+").mush(["array", "of", "strings"]) == "array + of + strings"
  def initialize (x)
    @seperator = x
  end

  def mush (this)
       this.join(" #{@seperator} ")
  end

end
