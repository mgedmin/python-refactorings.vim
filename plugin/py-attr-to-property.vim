" Convert
"    name: str
" to
"    @property
"    def name(self) -> str:
"        ...
command! -range -bar AttributeToProperty
      \ <line1>,<line2>call python_refactorings#attribute_to_property()
