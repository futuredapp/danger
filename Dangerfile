# Configuration
jira_link = "https://thefuntasty.atlassian.net/browse/"
max_pr_length = 500
swiftlint_binary_path = './Pods/SwiftLint/swiftlint'
build_report_file = 'build/reports/errors.json'

# Regular expressions for PR title and branch
pr_title_pattern = /^([A-Z]{2,}-\d+)\s\w{2,}/
branch_name_pattern = /^(feature|hotfix|fix)\/([A-Z]{2,})-\d+-/

# Convenience variables
has_correct_prefix = github.branch_for_head.match(/^(feature|hotfix|fix|release|housekeep)\//)
is_feature_or_fix = github.branch_for_head.match(/^(feature|hotfix|fix)\//)
can_be_merged_to_master = github.branch_for_head.match(/^(release|hotfix)\//)

branch_contains_jira_id = github.branch_for_head.match(branch_name_pattern)
title_contains_jira_id = github.pr_title.match(pr_title_pattern)

is_pr_wip = github.pr_title.include? "[WIP]"
is_pr_big = git.insertions > max_pr_length

# Do not show out of range issues, not caused by the current PR
github.dismiss_out_of_range_messages

# Throw errors
fail("Only hotfix and release can point to master.") if !can_be_merged_to_master and github.branch_for_base == "master"

# Throw descriptive warnings
warn("Branch name should have `release/`, `hotfix/`, `fix/`, `housekeep/` or `feature/` prefix.") if !has_correct_prefix
warn("Feature or fix PR title should include JIRA-ID and short description.") if is_feature_or_fix and !title_contains_jira_id
warn("Feature or fix PR branch name should include JIRA-ID and short description.") if is_feature_or_fix and !branch_contains_jira_id
warn("Pull request is classed as Work in Progress") if is_pr_wip
warn("This pull request is too big.") if is_pr_big

# Send link to JIRA if possible
def jira_message(link, id)
  message(":large_blue_diamond: [#{id}](#{link}#{id})")
end

if title_contains_jira_id then
  jira_message(jira_link, title_contains_jira_id.captures.first)
elsif branch_contains_jira_id then
  jira_message(jira_link, branch_contains_jira_id.captures[1])
end

# Check commit messages
commit_lint.check warn: :all, disable: [:subject_length]

# Lint Swift files if possible
if File.file?(swiftlint_binary_path) then
  swiftlint.binary_path = './Pods/SwiftLint/swiftlint'
  swiftlint.max_num_violations = 20
  swiftlint.lint_files inline_mode: true
end

# Send iOS build results if possible
if File.file?(build_report_file) then
  xcode_summary.ignored_files = '**/Pods/**'
  xcode_summary.inline_mode = true
  xcode_summary.report build_report_file
end
