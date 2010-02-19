# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dti_nitf}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Turner"]
  s.date = %q{2010-02-19}
  s.description = %q{Helps you processes the 'XML' (Quotes intentional) from DTI's XML export into valid NITF documents or Story & Media objects}
  s.email = %q{mark@amerine.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "dti_nitf.gemspec",
     "lib/dti_nitf.rb",
     "lib/dti_nitf/lookup_table.yml",
     "lib/dti_nitf/nitf.rb",
     "lib/dti_nitf/story.rb",
     "test/helper.rb",
     "test/test_dti_nitf.rb"
  ]
  s.homepage = %q{http://github.com/amerine/dti_nitf}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Process DTI's XML export into valid NITF documents or Story & Media objects}
  s.test_files = [
    "test/helper.rb",
     "test/test_dti_nitf.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<crack>, [">= 0.1.6"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<crack>, [">= 0.1.6"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<crack>, [">= 0.1.6"])
  end
end

