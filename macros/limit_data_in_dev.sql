{% macro limit_data_in_dev(column_name, source_name, table_name) %}
{% if target.name == 'dev' %}
where {{ column_name }} >= date_sub((select last_value({{ column_name }}) over(order by {{ column_name }} desc) from {{ source(source_name, table_name) }}  limit 1), interval 10 day)
{% endif %}
{% endmacro %}