local ls = require "luasnip"

require "luasnip.loaders.from_vscode".lazy_load()

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local opt = require("luasnip.nodes.optional_arg")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets(nil, {
  all = {
    s({
      trig = "ter",
      namr = "Ternary operator",
    }, {
      i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    })
  },
  typescript = {
    s(
      {
        trig = "spec",
        namr = "Class desc preparation"
      },
      fmt(
      [[
      import {{ TestBed }} from '@angular/core/testing';
      import {{ {a} }} from './';

      describe('{a}', () => {{
        let subject: {a};

        beforeEach(() => {{
          TestBed.runInInjectionContext(() => {{
            subject = new {a}();
          }})
        }})
      }})
      ]],
        {
          a = i(1, 'ClassName'),
        },
        {
          repeat_duplicates = true,
        }
      )
    ),
    s(
      {
        trig = "bfe",
        namr = "beforeEach()",
      },
      fmt(
      [[

      beforeEach(() => {{
        {}
      }})

      ]],
        {
          i(1, 'body')
        }
      )
    ),
    s(
      {
        trig = "afe",
        namr = "afterEach()",
      },
      fmt(
      [[

      afterEach(() => {{
        {}
      }})

      ]],
        {
          i(1, 'body')
        }
      )
    ),
    s(
      {
        trig = "desc",
        namr = "describe()",
      },
      fmt(
      [[
        describe('{when}', () => {{
          {what}
        }})
      ]],
        {
          when = i(1, 'When'),
          what = i(2, 'What'),
        }
      )
    ),
    s(
      {
        trig = "it",
        namr = "it()",
      },
      fmt(
      [[
        it('{should}', () => {{
          expect({expect}).{how}({what});
        }})
      ]],
        {
          should = i(1, 'Should'),
          expect = i(2, 'Expect'),
          how = i(3, 'toBe'),
          what = i(4, 'What'),
        }
      )
    )
  }
})
