(call_expression
    function: (selector_expression
        field: (field_identifier) @funcName (#match? @funcName "^QueryRowContext|QueryContext$")
    )
    arguments: (argument_list
        [
            (raw_string_literal)
            (raw_string_literal_content)
            (interpreted_string_literal)
        ] @sql
    )
    (#offset! @sql 0 1 0 -1)
)
