$(function () {
	var App = {

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
})