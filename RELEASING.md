Releasing
=========

Create a [release] for the latest tag:

[release]: https://github.com/thoughtbot/parity/releases

```shell
git tag -a v1.2.1 # Write a good title on the first line,
                  # and a thorough description below.

git push --tags   # or --follow-tags to push a changeset
                  # and its tag at the same time.
```

This will trigger a build on TravisCI.
If the tests pass,
the application will be built for each OS / architecture and
uploaded as release files for the project.

Then, update the [Homebrew formula] to point to the latest OSX package.

[homebrew formula]: https://github.com/thoughtbot/homebrew-formulae/blob/master/Formula/parity.rb
