module ButtonHelper

	# New

	def add_record_button(klass)
		link_to t("helpers.submit.create", model: klass.model_name.human.downcase),
						[:new, klass.to_s.tableize.singularize.to_sym],
						class: "btn btn-primary"
	end

	def add_record_button_navbar(klass)
		link_to fa_icon("plus-circle"),
						[:new, klass.to_s.tableize.singularize.to_sym],
						class: "btn-navbar-create",
						aria: { label: t("helpers.submit.create", model: klass.model_name.human.downcase) }
	end


	# Save

	def save_btn(f)
		f.button fa_icon("cloud-upload", text: t("helpers.submit.save")), class: "btn btn-success"
	end


	# Edit

	def edit_btn(record, **options)
		link_to (options[:text] || t("helpers.edit")),
						[:edit, record],
						class: (options[:class].presence || ["btn", "btn-outline-secondary", "btn-sm"]),
						style: options[:style]
	end

	# Delete

	def delete_btn(record, **options)
		link_to (options[:text] || t("helpers.remove.button")), record,
						method: :delete,
						data: { confirm: t("helpers.remove.delete") },
						class: (options[:class].presence || ["btn", "btn-outline-danger", "btn-sm"]),
						style: options[:style]
	end

end
