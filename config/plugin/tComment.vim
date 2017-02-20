" tComment-specific settings

map <Leader>c :TComment<CR>

" Key bindings~
"
" Most of the time the default toggle keys will do what you want (or to be
" more precise: what I think you want it to do ;-).
"
"                                                     *tcomment-operator*
" As operator (the prefix can be customized via |g:tcommentMapLeaderOp1|
" and |g:tcommentMapLeaderOp2|):
"
"     gc{motion}   :: Toggle comments (for small comments within one line
"                     the &filetype_inline style will be used, if
"                     defined)
"     gc<Count>c{motion} :: Toggle comment text with count argument
"                     (see |tcomment#Comment()|)
"     gcc          :: Toggle comment for the current line
"
" Explicit commenting/uncommenting:
"
"     g<{motion}   :: Uncomment region
"     g<c          :: Uncomment the current line
"     g<b          :: Uncomment the current region as block
"
"     g>{motion}   :: Comment region
"     g>c          :: Comment the current line
"     g>b          :: Comment the current region as block
"
" In visual mode:
"
"     gc           :: Toggle comments
"     g>           :: Comment selected text
"
" CAVEAT: If you visually select text within a line, the visual mode map will
" comment out the selected text. If you selected text across several lines, the
" visual mode map will assume though that you wanted to comment out lines --
" since this is how many vim maps work. In order to make tcomment use e.g. inline
" comments anyway, use the <c-_>i map -- see below.
"
" By default the cursor stays put. If you want the cursor to the end of
" the commented text, set |g:tcommentOpModeExtra| to '>' (but this may not
" work properly with exclusive motions).
"
" Primary key maps for normal and insert mode:
"
"     <c-_><c-_>   :: :TComment
"     <c-_><space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"     <c-_>b       :: :TCommentBlock
"                     In insert mode, the cursor will be positioned inside
"                     the comment. In normal mode, the cursor will stay
"                     put.
"     <c-_>a       :: :TCommentAs <QUERY COMMENT TYPE>
"     <c-_>n       :: :TCommentAs &filetype <QUERY COUNT>
"     <c-_>s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"     <c-_>i       :: :TCommentInline (in normal and insert mode, this map will
"                     create an empty inline comment, which isn't suitable for
"                     all filetypes though)
"                     In insert mode, the cursor will be positioned inside
"                     the comment. In normal mode, the cursor will stay
"                     put.
"     <c-_>r       :: :TCommentRight
"     <c-_>p       :: Comment the current inner paragraph
"     <c-_><Count> :: Set the count argument (a number from 1 to 9) for use with
"                     the subsequent tcomment map/command (see
"                     |tcomment#Comment()|)
"                     E.g. in JavaScript, in order to get an empty /** */
"                     comment for documentation purposes, in insert mode type
"                     <c-_>2<c-_>i
"                     In order to get an empty block comment like >
"                       /**
"                        *
"                        */
" <                   type <c-_>2<c-_>b
"
" Most of the above maps are also available in visual mode.
"
" A secondary set of key maps is defined for normal and insert mode:
"
"     <Leader>__       :: :TComment
"     <Leader>_p       :: Comment the current inner paragraph
"     <Leader>_<space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"     <Leader>_i       :: :TCommentInline
"     <Leader>_r       :: :TCommentRight
"     <Leader>_b       :: :TCommentBlock
"     <Leader>_a       :: :TCommentAs <QUERY COMMENT TYPE>
"     <Leader>_n       :: :TCommentAs &filetype <QUERY COUNT>
"     <Leader>_s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"
" ... and for select mode:
"
"     <Leader>__       :: :TComment
"     <Leader>_i       :: :TCommentInline
"
