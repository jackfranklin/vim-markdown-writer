#vim-markdown-writer

A plugin containing some Vimscript functions for writing Markdown blog posts, with a particular emphasis on those containing code.

## Installation

If you don't have a preferred installation method, I recommend installing pathogen.vim, and then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/jackfranklin/vim-markdown-writer.git

## Available Functions

No mappings are provided, you are expected to add those to your own vimrc, mapping them to suit.

#### `MW_MakeTwitterReferenceLink`
Will replace any reference to what looks like a Twitter username with a link to it. For example:

    Thanks to @phuunet with his help.

Running `:call MW_MakeTwitterReferenceLink()` (or a suitable mapping) will leave you with:

    Thanks to [@phuunet](http://twitter.com/phuunet) for his help.

#### `MW_ConvertFencedToIndent`
Useful for if you're working on a system that doesn't support GitHub style Markdown.

If you have this:

    Some sample code here:

    ```
    something()
    somethingElse()
    ```

Running `:call MW_ConvertFencedToIndent()` on the top line will change the fences into indents:

    Some sample code here:

        something()
        somethingElse()

Note that your cursor must be on or above the first fence block.

#### `MW_YamlFrontMatter`
Will ask you to input keys and values, and add them to the top of your file in the form of YAML front matter. 

Enter `end` to stop inputting. Best shown via a [screencast](http://quick.as/8wesomb).

#### `MW_Heading(count)`
Will insert as many hashes as passed in, and leave you in insert mode, ready to enter your heading.

For example:

    ```
    {cursor is here}

    Lorem ipsum dolor sit amet, consetetur sadipscing elitr.
    ```

Running `:call MW_Heading(5)` will do this:

    ```
    ##### {cursor here, in insert mode}

    Lorem ipsum dolor sit amet, consetetur sadipscing elitr.
    ```

#### `MW_MakeWordLink()`
Will make the current word under the cursor a link, after asking you for the URL. There is no need to enter `http://` in the URL, although if you do, the plugin will not add `http://` in again. Again, [shown best in a screencast](http://quick.as/2kwfpwp).

## How to Map

```
nnoremap <leader>mt :call MW_MakeTwitterReferenceLink()<CR>
nnoremap <leader>mfi :call MW_ConvertFencedToIndent()<CR>
nnoremap <leader>my :call MW_YamlFrontMatter()<CR>
nnoremap <leader>ml :call MW_MakeWordLink()<CR>
nnoremap <leader>mh1 :call MW_Heading(1)<CR>
nnoremap <leader>mh2 :call MW_Heading(2)<CR>
nnoremap <leader>mh3 :call MW_Heading(3)<CR>
nnoremap <leader>mh4 :call MW_Heading(4)<CR>
nnoremap <leader>mh5 :call MW_Heading(5)<CR>
```

Of course, some of those heading mappings end up taking more characters than just typing the text itself, but you get the point.

Or, you might want to map `MW_MakeTwitterReferenceLink()` function to perform its work on the entire document:

```
nnoremap <leader>mt ggVG:call MW_MakeTwitterReferenceLink()<CR>
```

## Issues / Requests
This is my first Vim plugin so any feedback is more than welcome. Please open an issue.

## TODO
Add a proper Vim doc file.

## Changelog

__0.0.3__
- added `MW_MakeWorldLink`

__0.0.2__
- added `MW_Heading` method

__0.0.1__
- initial release
