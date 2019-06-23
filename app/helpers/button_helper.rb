module ButtonHelper

	# New

	def add_record_button(klass)
		link_to t("helpers.submit.create", model: klass.model_name.human.downcase),
						[:new, klass.to_s.tableize.singularize],
						class: "btn btn-primary"
	end

	# Delete

	def delete_btn(record, **options)
		link_to t("helpers.remove.button"), record,
						method: :delete,
						data: { confirm: t("helpers.remove.delete") },
						class: ["btn", "btn-outline-danger"] + (options[:class] || []),
						style: options[:style]
	end

end
