" tpl as html
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.tpl		setfiletype html
	au! BufRead,BufNewFile *.mjml		setfiletype html
augroup END


