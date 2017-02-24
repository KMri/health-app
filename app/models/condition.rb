class Condition < ActiveRecord::Base
  belongs_to :user
  belongs_to :dkind
  
  validates(:val, {presence: true})
  
  # from(integer): min
  # to(integer):   MAX
  # unit(string):  単位の（kg, %...）
  def create_form_menu(from, to, unit)
    col = (from..to).to_a.map{|num| (num / 10.0).to_s + unit}
    # weight_row = (from..to).to_a.map{|num| num / 10}
  end
end
