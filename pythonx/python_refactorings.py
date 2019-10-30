import ast
import vim


def sort_list():
    line = vim.current.line
    indent = line[:-len(line.lstrip())]
    try:
        values = ast.literal_eval(line.strip())
        if not isinstance(values, (list, tuple)):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python list literal")
        return
    new_line = indent + repr(sorted(values))
    vim.current.line = new_line


def sort_dict():
    line = vim.current.line
    indent = line[:-len(line.lstrip())]
    try:
        values = ast.literal_eval(line.strip())
        if not isinstance(values, dict):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python dict literal")
        return
    new_line = indent + repr(dict(sorted(values.items())))
    vim.current.line = new_line


def reverse_list():
    line = vim.current.line
    indent = line[:-len(line.lstrip())]
    try:
        values = ast.literal_eval(line.strip())
        if not isinstance(values, (list, tuple)):
            raise SyntaxError
    except SyntaxError:
        print("Current line does not contain a valid Python list literal")
        return
    new_line = indent + repr(values[::-1])
    vim.current.line = new_line
