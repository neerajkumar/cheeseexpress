#Paperclip.options[:command_path] = "F:\Program Files\ImageMagick-6.5.8-Q16"

#Paperclip.options.merge!(:command_path => "F:\Program Files\ImageMagick-6.5.8-Q16") 

#Paperclip::Attachment.default_options.merge!(:command_path => "F:\Program Files\ImageMagick-6.5.8-Q16") 

Paperclip::Attachment.default_options.merge!(:command_path => "/usr/bin") 