function! MW_MakeTwitterReferenceLink()
  let searchRegex = '@\([^ .]*\)'
  let searchReplace = '[&](http://twitter.com/\1)'

  let oldLine = getline('.')
  let newLine = substitute(oldLine, searchRegex, searchReplace, 'g')
  call setline('.', newLine)
endfunction

function! MW_ConvertFencedToIndent()
  let fenceBlock = '\`\`\`'
  let [startLine, startCol] = searchpos(fenceBlock)
  execute "normal! j"
  let [endLine, endCol] = searchpos(fenceBlock)
  execute "normal! ".startLine."GV".endLine."G"
  execute "normal! >"
  execute "normal! ".startLine."G\"_dd"
  execute "normal! ".endLine."G\"_dd"
endfunction

function! MW_YamlFrontMatter()
  execute "normal! ggO\<ESC>"
  execute "normal! I---\<CR>\<ESC>"
  let finished = 0
  while finished < 1
    let key = input("Enter key (or 'end' to finish): ")
    if(key ==? "end")
      let finished = 1
    else
      let value = input("Enter value: ")
      execute "normal! I".key.": ".value."\<CR>\<ESC>"
    endif
  endwhile
  execute "normal! I---\<CR>\<ESC>"

endfunction

function! MW_Heading(count)
  let headings = repeat("#", a:count)
  execute "normal! I".headings." \<ESC>"
  execute "normal! $"
  startinsert!
endfunction

function! MW_MakeWordLink()
  let wordUnderCursor = expand("<cword>")
  let currentLine = getline(".")
  let url = input("URL (no need for http://): ")
  let replacement = '['.wordUnderCursor.']'
  if(url =~ 'https\?://')
    let replacement .= '('.url.')'
  else
    let replacement .= '(http://'.url.')'
  endif

  let newLine = substitute(currentLine, wordUnderCursor, replacement, '')
  call setline('.', newLine)
  execute "normal! f)"
  echo ""
endfunction


