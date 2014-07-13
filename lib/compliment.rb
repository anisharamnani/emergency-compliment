class Compliment
  attr_accessor :message, :image, :color

  def initialize
    @message = select_message
    @color = select_color
    @image = select_image
  end

  def select_message
    File.readlines('./public/compliments.txt').sample
  end

  def select_color
    colors.sample
  end


  def select_image
    Dir["./public/images/*"].sample[9..-1]
  end

  def colors
    ["#4991E3",
    "#E874DE", 
    "#E86464",
    "#E864A2", 
    "#CB64E8", 
    "#9064E8", 
    "#647CE8",
    "#64B1E8", 
    "#75D1C2", 
    "#75D181", 
    "#D1D94E", 
    "#EDC651", 
    "#ED9A51", 
    "#ED6B51", 
    "#E87676", 
    "#ABABAB", 
    "#000" ]
  end

end
