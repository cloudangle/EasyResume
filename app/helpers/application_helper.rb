module ApplicationHelper
  def button_to_remove_fields(name, f, type)
    f.hidden_field(:_destroy) + button_tag(name,
                                           class: 'btn waves-effect waves-light',
                                           onclick: "remove_fields(this, '" + type + "')",
                                           type: 'button')
  end

  def button_to_add_fields(name, f, association, type)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render association.to_s.singularize + '_fields', f: builder
    end
    button_tag(name.html_safe,
               onclick: "add_fields(this, '#{association}', '#{escape_javascript(fields)}', '" + type + "')",
               class: "btn waves-effect waves-light",
               type: 'button')
  end

  def tooltip_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, '#',
                                        class: 'btn tooltipped',
                                        onclick: 'remove_fields(this)',
                                        data: { position: 'bottom', delay: '50', tooltip: 'Remove' })
  end

  def tooltip_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render association.to_s.singularize + '_fields', f: builder
    end
    link_to(name.html_safe, '#',
            onclick: "add_fields(this, '#{association}', '#{escape_javascript(fields)}')",
            class: "btn tooltipped",
            data: { position: 'bottom', delay: '50', tooltip: 'Add a new Entry' })
  end
end
