" File: py-sort-list.vim
" Author: Marius Gedminas <marius@gedmin.as>
" Version: 0.4
" Last Modified: 2019-10-30
"
" Overview
" --------
" Defines a :SortPythonList command that sorts a list literal under cursor and
" a :ReversePythonList that reverses it.
"
" Also defines a :SortPythonDict command that sorts a dict literal under
" cursor.
"
" All of the commands currently work only for single-line literals.
"
" Example
" -------
"
" This is the sort of text this plugin can handle:
"
"     def doctest_somefunc():
"         """Test somefunc
"
"             >>> somefunc(bla bla bla)
"             [5, 1, 6, 9]
"
" Now position your cursor on the line that contains [5, 1, 6, 9] and do
" :SortPythonList<cr>.  The text will change to
"
"             >>> somefunc(bla bla bla)
"             [1, 5, 6, 9]
"

command! -bar SortPythonList     call python_refactorings#sort_list()
command! -bar SortPythonDict     call python_refactorings#sort_dict()
command! -bar ReversePythonList  call python_refactorings#reverse_list()
