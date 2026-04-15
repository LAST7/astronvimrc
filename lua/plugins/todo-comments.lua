return {
    "folke/todo-comments.nvim",
    opts = {
        keywords = {
            TODO = { icon = " ", color = "info", alt = { "REFACTOR" } },
            SHIT = { icon = " ", color = "shit", alt = { "UGLY", "TRASH", "GARBAGE" } },
            QUESTION = { icon = " ", color = "question", alt = { "Q", "WTF", "WHAT" } },
        },
        colors = {
            shit = "#db3b49",
            question = "#74e060",
        },
    },
}
