# opennetworkfoundation.org

Main site.

## Architechture

Pages may be created by writing files under the `articles/` directory. The system will react to files with `.html`,  `.txt`,  `.md`, or `.url`.

Each file may have a header that is structured like:

```yml
---
title: Hello, world!
author: Sean Morris
date: 2020-01-13
short_title: Hello
index:
  - name: menu
    weight: -100
  - name: footer
    weight: -100
...
```

**NOTE:** That a header must begin with the `---` line and end with the `...` line. the normal page content can proceed after this point.

### plantext & markdown:

When the system sees a new file of type `.txt`,  `.md` in the `articles/` directory, it will use pandoc to process it into HTML and build it with `fragments/article-layout.frag.html`. The resulting HTML file will have the same name as the original, with is extension changed to `.html`.

`.html`,
