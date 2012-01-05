module ApplicationHelper
  def facebook_like (opts={})
    layout = "standard"
    show_faces = "true"
    width = "450"
    if(opts[:count] == "count")
      layout = "button_count"
      show_faces = "false"
      width = "150"
    end
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{opts[:url]}&layout=#{layout}&show_faces=#{show_faces}&width=#{width}&action=like&font=arial&colorscheme=light&height=100", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like, :class => opts[:class]
  end  
end
