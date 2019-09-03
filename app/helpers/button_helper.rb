module ButtonHelper

	# New

	def add_record_button(klass)
		link_to t("helpers.submit.create", model: klass.model_name.human.downcase),
						[:new, klass.to_s.tableize.singularize],
						class: "btn btn-primary"
	end


	# Save

	def save_btn(f)
		f.button fa_icon("cloud-upload", text: "Save"), class: "btn btn-success"
	end


	# Edit

	def edit_btn(record, **options)
		link_to "Edit",
						[:edit, record],
						class: ["btn", "btn-outline-secondary", "btn-sm"] + (options[:class] || []),
						style: options[:style]
	end

	# Delete

	def delete_btn(record, **options)
		link_to t("helpers.remove.button"), record,
						method: :delete,
						data: { confirm: t("helpers.remove.delete") },
						class: ["btn", "btn-outline-danger", "btn-sm"] + (options[:class] || []),
						style: options[:style]
	end

end
