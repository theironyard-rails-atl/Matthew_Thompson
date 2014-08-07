require 'yaml'
# The most and least expensive widget
# The total revenue and profit from all widgets sold
# The top 10 best selling widgets
# The number of widgets sold in each department

# widgets = YAML.load_file("widgets.yml")
class Whatever
  include Enumerable
  attr_reader :widgets

  def initialize(document)
    @widgets = YAML.load_file(document)
    puts @widgets.length
  end

  def each
    @widgets.each { |widget| yield widget }
  end

  def max_price
    puts @widgets.max_by { |widget| widget[:price] }
  end

  def low_price
    puts @widgets.min_by { |widget| widget[:price] }
  end

  def total_profit
    @revenue_array = @widgets.collect { |widget| widget[:price] * widget[:sold] }
    @revenue = @revenue_array.reduce { |sum, x| sum + x}.to_i
    @cost_array = @widgets.collect { |widget| widget[:cost_to_make] * widget[:sold] }
    @cost = @cost_array.reduce { |sum, x| sum + x }.to_i
    @profit = @revenue - @cost
    puts "The total revenue is #{@revenue} while the cost was #{@cost}"
    puts "The toatl profit was #{@profit}"


    #puts @widgets.reduce { |widget| widget[:price].reduce {|sum, x| sum + x } }

    #reduce {|sum, x| sum + x }
  end

  def top_ten_sales
    @widgets = @widgets.sort_by { |widget| widget[:sold] }.reverse!
    @ten_hash = @widgets.first(10)
    @top_ten = @ten_hash.each {|widget| puts widget[:name].to_s}
  end

  def total_sales_by_categories
    @widgets = @widgets.group_by {|widget| widget[:department]}
                       .map {|d,ws| ws[:sold] }


  end

end



#Whatever.new("widgets.yml")
