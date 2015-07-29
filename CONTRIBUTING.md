# Contributing

Fork the repo:

    git clone git@github.com:thoughtbot/parity.git

Set up your machine:

    ./bin/setup

Make sure the tests pass:

    go test

Make your change. Add tests for your change. Make the tests pass.

Build:

    go build

Install locally:

    go install

Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/thoughtbot/parity/compare/

Wait for feedback. Increase the chance that your pull request is accepted:

* Write tests.
* Follow the [style guide][style].
* Write a [good commit message][commit].

[style]: https://github.com/thoughtbot/guides/tree/master/style
[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

CI
--

In addition to passing the tests, commits must also pass `go fmt` and `go vet`.

To catch any formatting or vet problems before CI, `bin/vet` can be used as a
`pre-commit` hook:

```shell
ln -nsi ../../bin/vet .git/hooks/pre-commit
```

Or added to your existing, local `pre-commit` hooks:

```
[[ -x bin/vet ]] && { bin/vet || exit $?; }
```
