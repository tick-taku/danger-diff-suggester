# diff-suggester

It collaborates with formatters to suggest the differences shown by 'git diff' for GitHub Pull Request.

## How to use

1. Install

```zsh
gem install diff-suggester
```

2. Usage

First, run the formatter. Example for Android using spotless and ktlint is:

```
./gradlew spotlessKotlinApply
```

Next, run the suggester. It will comment the suggested changes as a diff on the Pull Request.

```ruby
suggester = DiffSuggester::Suggester.new(
  repo: '<your-name/repo-name>',
  pr_number: 0 # Pull Request number,
  access_token: '<Your PAT>'
)
suggester.suggest
```
