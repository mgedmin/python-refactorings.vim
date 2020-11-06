" File: py-test-assertions.vim
" Author: Marius Gedminas <marius@gedmin.as>
" Version: 0.1
" Last Modified: 2020-11-06
"
" Overview
" --------
" Defines a :FixAssertions command that does a series of search/replace to
" change outdated unittest assertions to modern spellings.
"
" Example
" -------
"
" This is the sort of text this plugin can handle:
"
"     self.assertEquals(a, b) -> self.assertEqual(a, b)
"     self.assert_(xxx) -> self.assertTrue(xxx)
"     self.assert_(not xxx) -> self.assertFalse(xxx)
"

command! -bar -range=% FixAssertions  <line1>,<line2>call python_refactorings#fix_assertions()
