function python_refactorings#sort_list()
  pythonx import python_refactorings
  pythonx python_refactorings.sort_list()
endf

function python_refactorings#sort_dict()
  pythonx import python_refactorings
  pythonx python_refactorings.sort_dict()
endf

function python_refactorings#reverse_list()
  pythonx import python_refactorings
  pythonx python_refactorings.reverse_list()
endf

function python_refactorings#swap_assignment() range
  exec a:firstline.','.a:lastline.'s/\(^[ \t>.]*\)\(.*\)\( = \)\(.*\)$/\1\4\3\2/'
  noh
endf

function python_refactorings#swap_tuple_members() range
  exec a:firstline.','.a:lastline.'s/\((\)\([^,)]*\)\(,\s*\)\(.*\)\()\)/\1\4\3\2\5/'
  noh
endf

function python_refactorings#inline_value()
  let name = expand('<cword>')
  let pattern = '^\s*' . name . '\s*=\s*'
  let [line, pos] = searchpos(pattern, 'bnW')
  if line != 0
    let value = substitute(getline(line), pattern, '', '')
    exec 'normal ciw' . value . "\<ESC>"
  endif
endf

function python_refactorings#fix_assertions(skip_confirmation) range
  let flags = a:skip_confirmation ? 'ge' : 'gce'
  exec a:firstline.','.a:lastline.'s/self[.]assert\(\|Almost\|Not\|NotAlmost\)Equals(/self.assert\1Equal(/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(\(.*\) in \(.*\))/self.assertIn(\1, \2)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(\(.*\) is None)/self.assertIsNone(\1)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(\(.*\) is not None)/self.assertIsNotNone(\1)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(isinstance(\(.*\), \(.*\)))/self.assertIsInstance(\1, \2)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(isinstance(\(.*\), \(.*\)))/self.assertIsInstance(\1, \2)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(not \(.*\))/self.assertFalse(\1)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]failIf(\(.*\))/self.assertFalse(\1)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]assert_(\(.*\))/self.assertTrue(\1)/'.flags
  exec a:firstline.','.a:lastline.'s/self[.]failUnless(\(.*\))/self.assertTrue(\1)/'.flags
  noh
endf
