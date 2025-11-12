{% test non_negative_values(model, column_name) %}
-- Fails if any row has a value < 0 in the tested column
select *
from {{ model }}
where {{ column_name }} < 0
{% endtest %}

{% test positive_values(model, column_name) %}
-- Fails if any row has a value <= 0 in the tested column
select *
from {{ model }}
where {{ column_name }} <= 0
{% endtest %}
