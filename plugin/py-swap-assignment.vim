" This is growing to become a refactoring plugin
command! -range -bar SwapAssignment   call python_refactorings#swap_assignment()
command! -range -bar SwapTupleMembers call python_refactorings#swap_tuple_members()
command!        -bar InlineValue      call python_refactorings#inline_value()
