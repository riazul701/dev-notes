# Work-Git.md

## GitIgnored file committed accidentally <sup>{1}</sup>

* `git rm --cached README` : Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. In other words, you may want to keep the file on your hard drive but not have Git track it anymore. This is particularly useful if you forgot to add something to your `.gitignore` file and accidentally staged it, like a large log file or a bunch of `.a` compiled files. To do this, use the `--cached` option

## Commands From

* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)

# References

* next-sl: {2}

* Tutorials
  * {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
