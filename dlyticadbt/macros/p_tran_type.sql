{% macro tran_type(column_name) %}
    case
        when {{ column_name }} = 'C' then 'Credit'
        when {{ column_name }} = 'D' then 'Debit'
        else {{ column_name }}
    end
{% endmacro %}