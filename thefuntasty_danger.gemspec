
Gem::Specification.new do |spec|
  spec.name        = "thefuntasty_danger"
  spec.version     = "0.9.2"
  spec.authors     = ["Matěj Kašpar Jirásek"]
  spec.email       = ["ops@futured.app"]

  spec.summary     = "The Danger rules we use at Futured"
  spec.description = "Danger configuration used at Futured, currently mainly for iOS development"
  spec.homepage    = "https://github.com/futuredapp/danger"
  spec.license     = "MIT"

  spec.files       = ['Dangerfile']

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_runtime_dependency 'rake', '~> 13'
  spec.add_runtime_dependency 'danger', '~> 9'
  spec.add_runtime_dependency 'danger-commit_lint', '~> 0'
  spec.add_runtime_dependency 'danger-xcode_summary', '~> 1'
end
