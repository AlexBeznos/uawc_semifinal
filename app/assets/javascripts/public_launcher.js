$(document).ready(function() {
    $('.nav_list').dropit();

    $('#sort').change(function() {
        window.location.replace(window.location.href + '&sort=' + $('#sort').val())
    });
});

$(function () {
	var App = {

	}

	App.Dropdown = {
		open: false,
		init: function () {
			$("[data-dropdown-toggle]").click(function () {
				if (App.Dropdown.open) {
					$(this).removeClass("active");

					$(".dropdown_content").fadeOut();
					App.Dropdown.open = false;
				}
				else {
					$(this).addClass("active");

					$(".dropdown_content").fadeIn();
					App.Dropdown.open = true;
				}
			});
		}
	}

	App.Popup = {
		el: $(".popup-content"),
		overlay: $(".popup-overlay"),
		init: function () {
			$("[data-feedback-popup]").click(function () {
				App.Popup.overlay.fadeIn("fast", function () {
					App.Popup.el.fadeIn("fast");
					App.Popup.center();
				});
			});

			$("[data-popup-close]").click(function () {
				App.Popup.close();
			});

			$(window).resize(function () {
				App.Popup.center();
			});
		},
		center: function () {
			this.el.css({
				'margin-left': - this.el.outerWidth()/2
			});
		},
		close: function () {
			App.Popup.overlay.fadeOut();
			App.Popup.el.fadeOut();
		}
	}

	App.Popup.init();
	App.Dropdown.init();
})
