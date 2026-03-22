local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Generate capitalized filename for header guard
local function get_header_guard()
    local filename = vim.fn.expand("%:t"):upper():gsub("[%./\\]", "_")
    return "INCLUDE_" .. filename .. "_"
end

return {

    -- New Line
    s({ trig = "nn", dscr = "Character representing a new line" }, {
        t { "'\\n'" },
    }),

    -- Foreach
    s({ trig = "for", dscr = "Code snippet for range-based for loop (c++11) statement", priority = 2000 }, {
        t "for(",
        i(1, "const"),
        t " ",
        i(2, "auto &"),
        i(3, "item"),
        t " : ",
        i(4, "container"),
        t { ") {", "\t" },
        i(0),
        t { "", "}" },
    }),

    -- IO
    s({ trig = "cout", dscr = "Code snippet for printing to std::cout", priority = 2000 }, {
        t "std::cout << ",
        i(1, "message"),
        t " << '\\n';",
    }),

    -- Try/Catch
    s({ trig = "tc", dscr = "Code snippet for try catch", priority = 2000 }, {
        t { "try {", "\t" },
        i(1),
        t { "", "}", "catch (" },
        i(2, "const std::exception&"),
        t { ") {", "\t" },
        i(0),
        t { "", "}" },
    }),

    -- Switch
    s({ trig = "switch", dscr = "Code snippet for switch statement", priority = 2000 }, {
        t "switch (",
        i(1, "switch_on"),
        t { ") {", "case " },
        i(2),
        t { ":", "\t" },
        i(3),
        t { "", "default:", "\t" },
        i(4),
        t { "", "\tbreak;", "}" },
    }),

    -- Header Guard
    s({ trig = "#guard", dscr = "header guard", priority = 2000 }, {
        t "#ifndef ",
        f(get_header_guard),
        t { "", "#define " },
        f(get_header_guard),
        t { "", "", "" },
        i(0),
        t { "", "", "#endif  // " },
        f(get_header_guard),
    }),

    -- Comment Snippets

    -- Doxygen Comment Block (Full)
    s({
        trig = "/**",
        dscr = "A C++ comment block for functions, including description, param, return, and example.",
    }, {
        t { "/**", " * " },
        i(1, "A one-line summary."),
        t { "", " * ", " * " },
        i(2, "Description."),
        i(0),
        t { "", " * ", " * @param " },
        i(3, "name"),
        t " ",
        i(4, "Type and description of the parameter."),
        t { "", " * @return " },
        i(5, "Type and description of the returned value."),
        t { "", " * ", " * @example", " * // " },
        i(6, "Description of my example."),
        t { "", " * " },
        i(7, "Write me later"),
        t { "", " */" },
    }),

    -- Doxygen Comment Block (Simple)
    s({
        trig = "/*",
        wordTrig = false,
        dscr = "A simple C++ comment block for classes, including short summary, and details.",
    }, {
        t { "/**", " * " },
        i(1, "A one-line summary."),
        t { "", " * ", " * " },
        i(2, "Description."),
        i(0),
        t { "", " */" },
    }),

    -- @param
    s({ trig = "@param", dscr = "Type and description of a function parameter." }, {
        t "@param ",
        i(1, "name"),
        t " ",
        i(2, "Type and description of the parameter."),
        i(0),
    }),

    -- @return
    s({ trig = "@return", dscr = "Type and description of the returned value." }, {
        t "@return ",
        i(1, "Type and description of the returned value."),
        i(0),
    }),

    -- @example
    s({ trig = "@example", dscr = "Example that demonstrates how to use a function." }, {
        t { "@example", "* // " },
        i(1, "Description of my example."),
        i(0),
        t { "", "* " },
        i(2, "Write me later"),
    }),

    -- @throws
    s({ trig = "@throws", dscr = "Indicates the exceptions that can be thrown by a function." }, {
        t "@throws ",
        i(1, "ExceptionName"),
        t " ",
        i(2, "Description."),
        i(0),
    }),

    -- @exception
    s({ trig = "@exception", dscr = "Indicates the exceptions that can be thrown by a function." }, {
        t "@exception ",
        i(1, "ExceptionName"),
        t " ",
        i(2, "Description."),
        i(0),
    }),
}
