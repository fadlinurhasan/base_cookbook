# Barito Log Base Cookbook
This is the base cookbook that would be applied before any of the other cookbooks with the BaritoLog product.

## Requirements
- Refer to **Berksfile**, **Gemfile** for the dependencies
- Refer to **.kitchen.yml** for platform and version information

## Setup Instructions
Please refer to the `Berksfile` and `Gemfile` for the requirements.

```
$ rbenv install --skip-existing     # installs ruby
$ gem install bundler -v '1.167.1'  # installs bundler
$ bundle install                    # installs ruby dependencies
$ bundle exec berks install         # installs chef dependencies
$ bundle exec kitchen converge      # runs base cookbook on a VM
```

## Usage
TBD

## Contributors
- [Siddarth](mailto:sid@go-jek.com)

## Changelog
### Unreleased
### [0.0.01] - 2018-05-11
- Initial Commit
- Opensource stepping stones
- Base cookbook structure

## Contributing
We appreciate all pull requests, here are our guidelines
- **File an Issue**: File an issue, if there isn't one already. If your patch is going to be large, it might be a good idea to get the discussion started early. We are happy to discuss it in a new issue before hand. You can always email us at [<baritolog@go-jek.com>](mailto:baritlog@go-jek.com)
- Please use [Chef Cookbook Guide](https://github.com/chef-partners/cookbook-guide) and [Chef Style Guide](https://docs.chef.io/ruby.html)
- We ask that you squash all the commits together before pushing and that your commit message references the bug.

### Issue Reporting
- Check that the issue has not already been reported
- Be clear, concise and precise in your description of the problem.
- Open an issue with a descriptive title and a summary in grammatically correct, complete sentences.
- Include any relevant code to the issue summary.

### Pull Requests
- Please read this [How to Github](http://gun.io/blog/how-to-github-fork-branch-and-pull-request) blog post.
- Use a topic branch to easily amend a pull request later, if necessary
- Write [good commit messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
- Use the same coding conventions as the rest of the project.
- Open a [pull request](https://help.github.com/articles/using-pull-requests) that relates to **only** one subject with a clear title and description in grammatically correct, complete sentences.

## License
The MIT License (MIT)

Copyright (c) 2018 barito-log

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
