class Post < ActiveRecord::Base

 	has_attached_file :picture, 
 	styles: { medium: '300x300>' },
 	storage: :s3,
 	s3_credentials: {
 		bucket: 'flimstagram',
 		access_key_id: Rails.application.secrets.s3_access_key,
 		secret_access_key: Rails.application.secrets.s3_secret_key
 	}
 	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
 	has_many :comments	
 	belongs_to :user
 	has_and_belongs_to_many :tags

 	def tag_names
 		''
 	end

 	def tag_names=(tag_names)
 		return if tag_names.blank?
 		tag_names.split(', ').each do |tag_name|
 		hash_name= '#' + tag_name.delete('#')
		self.tags.create(name: hash_name)
		end
 		# self.tags << tag_names
 	end
end
