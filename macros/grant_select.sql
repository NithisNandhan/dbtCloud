{% macro grant_select(role=target.role,schema=target.schema) %}

    {% set sql %}
        grant usage on schema {{schema}} to role {{role}};
        grant select on all tables in schema {{schema}} to role {{role}};
        grant select on all views in schema {{schema}} to role {{role}};
    {% endset %}

    {{ log('Granting user access to all tables and views in' ~ schema, info=True) }}
    {% do run_query(sql) %}
    {{ log('Access granted to the user for' ~ schema, info=True) }}

{% endmacro %}