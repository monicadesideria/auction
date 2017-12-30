module ApplicationHelper
  def translate_status(status)
  	case status
  	  when STATUS[:to_bid]
  	  	"To bid/has not up to market place"
  	  when STATUS[:on_bid]
  	  	"On Bid"
  	  when STATUS[:bid]
  	  	"Bid"
  	  when STATUS[:sold]
  	  	"Sold"
  	end 
  end

  def translate_username(username)
    split_arr = username.split(%r{\s*})
    first_el = split_arr.first(split_arr.size-3)
    last_el = split_arr.last(3)
    replace_arr = last_el.replace(["*","*","*"])
    (first_el + replace_arr).join
  end
end