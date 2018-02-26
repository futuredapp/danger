
Gem::Specification.new do |spec|
  spec.name        = "thefuntasty_danger"
  spec.version     = "0.1.3"
  spec.authors     = ["Matěj Kašpar Jirásek"]
  spec.email       = ["matej.jirasek@thefuntasty.com"]

  spec.summary     = "The Danger rules we use @ The Funtasty"
  spec.description = "Danger configuration used at The Funtasty, currently mainly for iOS development"
  spec.homepage    = "https://github.com/thefuntasty/danger"
  spec.license     = "MIT"

  spec.files       = ['Dangerfile']

  spec.add_runtime_dependency 'danger', '~> 5'
  spec.add_runtime_dependency 'danger-commit_lint', '~> 0'
  spec.add_runtime_dependency 'danger-xcode_summary', '~> 0'
  spec.add_runtime_dependency 'danger-swiftlint', '~> 0'
end
