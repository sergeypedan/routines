module ButtonHelper

	def delete_btn(record, **options)
		link_to "Удалить", record,
						method: :delete,
						data: { confirm: 'Точно удаляем?' },
						class: ["btn", "btn-outline-danger"] + (options[:class] || []),
						style: options[:style]
	end

end
