def convert_hash_syntax(old_syntax)
  old_syntax.gsub(/:(\w+)\s*=>\s*/) do
    "#{$1}: "
  end
end