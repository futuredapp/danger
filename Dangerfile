
# Configuration
jira_link = "https://thefuntasty.atlassian.net/browse/"
max_pr_length = 500
swiftlint_binary_path = './Pods/SwiftLint/swiftlint'
build_report_file = 'build/reports/errors.json'

# Regular expressions for PR title and branch
title_name_check = /^([A-Z]{2,}-\d+)\s\w{2,}/
branch_jira_id_check = /^(feature|hotfix|fix)\/([A-Z]{2,})-\d+-/

# Convenience variables
has_correct_prefix = github.branch_for_head.match(/^(feature|hotfix|fix|release|housekeep)\//)
is_feature_or_fix = github.branch_for_head.match(/^(feature|hotfix|fix)\//)
can_be_merged_to_master = github.branch_for_head.match(/^(release|hotfix|)\//)
branch_contains_jira_id = github.branch_for_head.match(/^(feature|hotfix|fix)\/([A-Z]{2,}-\d+)-/)

title_contains_jira_id = github.pr_title.match(title_name_check)
is_pr_wip = github.pr_title.include? "[WIP]"

is_pr_big = git.lines_of_code > max_pr_length

# Throw errors
fail("Only hotfix and release can point to master.") if !can_be_merged_to_master and github.branch_for_base == "master"

# Throw descriptive warnings
warn("Branch name should have `release/`, `hotfix/`, `fix/`, `housekeep/` or `feature/` prefix.") if !has_correct_prefix
warn("Feature or fix PR title should include JIRA-ID and short description.") if is_feature_or_fix and !title_contains_jira_id
warn("Feature or fix PR branch name should include JIRA-ID and short description.") if is_feature_or_fix and !branch_contains_jira_id
warn("Pull request is classed as Work in Progress") if is_pr_wip
warn("This pull request is too big.") if is_pr_big

# Send link to JIRA if possible
if title_contains_jira_id then
  jira_id = title_contains_jira_id.captures.first
  message(":large_blue_diamond: [#{jira_id}](#{jira_link}#{jira_id})")
end

# Check commit messages
commit_lint.check warn: :all

# Lint Swift files if possible
if File.file?(swiftlint_binary_path) then
  swiftlint.binary_path = './Pods/SwiftLint/swiftlint'
  swiftlint.max_num_violations = 20
  swiftlint.lint_files inline_mode: true
end

# Send warning from iOS build if possible
if File.file?(build_report_file)
  xcode_summary.ignored_files = '**/Pods/**'
  xcode_summary.inline_mode = true
  xcode_summary.report build_report_file
end


