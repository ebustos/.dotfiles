"syntax clear javaBraces
"syntax clear javaDocComment
"syntax clear javaComment

"syn region javaBraces start="{" end="}" transparent fold
"syn region javaDocComment start="/\*\*" end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell fold
"syn region javaComment	 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell fold extend

