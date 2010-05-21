module Galdomedia::TinymceFilemanager::ViewHelpers

  def init_tinymce_managed
    tinymce_managed_javascript_tag
  end

  def tinymce_managed_javascript_tag( controller = nil )
    "#{javascript_include_tag 'tiny_mce/tiny_mce'} <script src='/javascripts/tiny_mce/tiny_mce.js' type='text/javascript'></script>" + "<script type='text/javascript' src='/javascripts/tinymce_managed.js?#{!controller.blank? && "manager=#{controller}" || ""}'></script>"
  end
  def tinymce_managed_tag name, content = '', options = {}
    append_class_name(options, 'tinymce_managed')
    text_area_tag(name, content, options)
  end

  def append_class_name options, class_name
    key = options.has_key?('class') ? 'class' : :class
    unless options[key].to_s =~ /(^|\s+)#{class_name}(\s+|$)/
      options[key] = "#{options[key]} #{class_name}".strip
    end
    options
  end
  
end