import "jquery"
import "jquery-ui/ui/core"
import "jquery-ui/ui/widgets/sortable"
import "vendor/activerecord-sortable"

document.addEventListener("DOMContentLoaded", function() {
  $('[data-role="activerecord_sortable"]').activerecord_sortable()
})
