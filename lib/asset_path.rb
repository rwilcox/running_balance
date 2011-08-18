module AssetPath

  # Why this instead of Sproket's require_tree?
  # Sprokets compiles one SASS file at a time, which works OK... until you want
  # to pull out some SASS things (mixins, layout settings) into separate files.
  # In that case, you want to have SASS compile everything all at once, in one big file
  # So, use this helper to include all the SASS files down a path
  #
  # The alternative is the ugly (and not DRY!): <http://asciicasts.com/episodes/268-sass-basics>
  # where you list every file manually in the application.css.scass file.
  def self.sass_require(base_dir, *inside_dirs)
    output = ""
    Dir[File.join(base_dir, *inside_dirs, "/**/*")].each do |stylesheet_path| 
      unless File.directory?(stylesheet_path) 
        current_file_name = stylesheet_path.gsub(base_dir.to_s, '') 
        output << "@import '#{current_file_name}';\n"
      end 
    end

    output
  end
end