{% if menu %}
    <ul id="{{ id_prefix }}navigation" class="clearfix at-menu do_superfish">
    {% for mid,depth,is_first,is_last in menu %}
        {% if is_first and not forloop.first %}
            <ul {% if mid|member:path %}class="onpath"{% endif %}>
        {% endif %}
        <li id="{{ id_prefix }}nav-item-{{forloop.counter|format_number}}" 
            class="{% if is_first %}first {% endif %}{% if is_last %}last{% endif %}">
            <a href="{{ m.rsc[mid].page_url }}" 
               class="{{ m.rsc[mid].name }}{% if mid == id %} current{% else %}{% if mid|member:path %} onpath{% endif %}{% endif %}">{{ m.rsc[mid].short_title|default:m.rsc[mid].title }}</a>
        </li>
        {% if is_last %}
            {% include "_menu_extra.tpl" %}
            </ul>
        {% endif %}
    {% endfor %}
{% endif %}