class Order < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def number
  	date_section = created_at.strftime('%d%m%y')
  	id_section =  "%04d" % id

  	date_section + id_section
  end


end
