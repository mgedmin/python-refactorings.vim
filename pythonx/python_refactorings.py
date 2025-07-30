import ast
import vim


def _parse_line(line):
    lstripped = line.lstrip()
    indent = line[:-len(lstripped)]
    stripped = lstripped.rstrip()
    trail = ''
    if stripped.endswith(','):
        trail = ','
        stripped = stripped[:-1]
    value = ast.literal_eval(stripped)
    return indent, value, trail


def sort_list():
    try:
        indent, values, trail = _parse_line(vim.current.line)
        if not isinstance(values, (list, tuple)):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python list literal")
        return
    new_line = indent + repr(sorted(values)) + trail
    vim.current.line = new_line


def sort_dict():
    try:
        indent, values, trail = _parse_line(vim.current.line)
        if not isinstance(values, dict):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python dict literal")
        return
    new_line = indent + repr(dict(sorted(values.items()))) + trail
    vim.current.line = new_line


def reverse_list():
    try:
        indent, values, trail = _parse_line(vim.current.line)
        if not isinstance(values, (list, tuple)):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python list literal")
        return
    new_line = indent + repr(values[::-1]) + trail
    vim.current.line = new_line
