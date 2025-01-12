Overview
--------

.. image:: https://github.com/mgedmin/python-refactorings.vim/actions/workflows/build.yml/badge.svg?branch=master
    :target: https://github.com/mgedmin/python-refactorings.vim/actions


Vim plugin that defines a few random commands to help me work with Python code.

These are all massive hacks that were helpful to me at one time or another.

Needs Vim 8.0.0251 or newer, built with Python support.


Commands
--------

``:SortPythonList``

    Sorts a (single-line) Python list literal under cursor, e.g. ::

        [146, 2, 32, 90, 134]

    after ``:SortPythonList`` becomes ::

        [2, 32, 90, 134, 146]


``:ReversePythonList`` that reverses it.

    Reverses a (single-line) Python list literal under cursor, e.g. ::
    Sorts a (single-line) Python list literal under cursor, e.g. ::

        [2, 32, 90, 134, 146]

    after ``:ReversePythonList`` becomes ::

        [146, 134, 90, 32, 2]


``:SortPythonDict``

    Sorts a (single-line) Python dict literal under cursor, e.g. ::

        {'x': 42, 'z': 15, 'y': 1},

    after ``:SortPythonDict`` becomes ::

        {'x': 42, 'y': 1, 'z': 15},


``:SwapAssignment``

    Swaps the source and target of a Python assignment statement under cursor,
    e.g. ::

        self.old_listdir = os.listdir

    after ``:SwapAssignment`` this becomes ::

        os.listdir = self.old_listdir

    This command supports ranges.


``:SwapTupleMembers``

    Swaps the first and second members of a Python 2-tuple literal under
    cursor, e.g. ::

        ('source', 'target'),

    after ``:SwapTupleMembers`` becomes ::

        ('target', 'source'),

    This command supports ranges, and expects one tuple per line.


``:InlineValue``

    Replaces the name under cursor with its value, e.g. ::

        x = compute_the_x(a, b, c)
        print(x)

    with cursor on top of ``x`` in the print() statement, invoking
    ``:InlineValue`` will result in ::

        x = compute_the_x(a, b, c)
        print(compute_the_x(a, b, c))


``:AttributeToProperty``

    Replaces a variable type annotation with a property declaration, e.g. ::

        class Thing:
            name: str
            color: str

    becomes ::

        class Thing:

            @property
            def name(self) -> str:
                ...

            @property
            def color(self) -> str:
                ...

``:FixAssertions[!]``

    Replaces deprecated old-style unittest assertion method calls with new
    spellings, e.g. ::

        self.assertEquals(a, b)
        self.failUnless(x)
        self.assert_(not y)
        self.assert_(x in y)

    will become ::

        self.assertEqual(a, b)
        self.assertTrue(x)
        self.assertFalse(y)
        self.assertIn(x, y)

    If you don't want to confirm each replacement, you can try your luck
    with :FixAssertions! (but I wouldn't trust my regexes that much).


Installation
------------

I like vim-plug_::

  Plug 'mgedmin/python-refactorings.vim'

.. _vim-plug: https://github.com/junegunn/vim-plug


Tests
-----

Install vader.vim_ and use ``:Vader test/*.vader`` to run the test suite.

.. _vader.vim: https://github.com/junegunn/vader.vim


Copyright
---------

``python-refactorings.vim`` was written by Marius Gedminas <marius@gedmin.as>.
Licence: MIT.
