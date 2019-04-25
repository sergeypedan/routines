module AjaxFormHelper

	# @link_text   `"+ Add answer"`
	# @association `:answers`
	#
	def link_to_insert_new_field(link_text, form_builder, association, html_options = {})
		new_record  = new_associated_record(form_builder, association)
		fields_html = fields_for_new_association(form_builder, association, new_record)

		data_value = {
										action:   "insert-new-field",
										object_id: new_record.object_id,
										fields:    fields_html.gsub("\n", "")
									}

		html_options = html_options.merge({ data: data_value })

		link_to link_text, '#', html_options
	end

	private

	def fields_for_new_association(form_builder, association, new_record)
		form_builder.fields_for(association, new_record, child_index: new_record.object_id) do |builder|
			render association_partial_file_name(association), f: builder
		end
	end

	def association_partial_file_name(association)
		return association.to_s.singularize + "_fields"
	end


	def new_associated_record(form_builder, association)
		association_model = form_builder.object.send(association).klass
		return association_model.new
	end

end
