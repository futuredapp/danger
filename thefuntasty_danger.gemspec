
Gem::Specification.new do |spec|
  spec.name        = "thefuntasty_danger"
  spec.version     = "0.3.0"
  spec.authors     = ["Matěj Kašpar Jirásek"]
  spec.email       = ["matej.jirasek@futured.app"]

  spec.summary     = "The Danger rules we use at Futured"
  spec.description = "Danger configuration used at Futured, currently mainly for iOS development"
  spec.homepage    = "https://github.com/futuredapp/danger"
  spec.license     = "MIT"

  spec.files       = ['Dangerfile']

  spec.add_runtime_dependency 'danger'
  spec.add_runtime_dependency 'danger-commit_lint'
  spec.add_runtime_dependency 'danger-xcode_summary'
  spec.add_runtime_dependency 'danger-swiftlint'
end
