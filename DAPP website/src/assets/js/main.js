/*
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	$('#goal').on('input', function() {
		var goal = $('#goal').val();
		if(goal == 0){
			$('#demoGoal').css("opacity","0");
			$('#demoValues').css("opacity","0");
			$('#demoGoalAUD').css("opacity","0");
			if($('#days').val() == 0){
				$('#demoContract').css("opacity","0");
			}
		}else{
			if(!isNaN(goal)){
				$('#demoGoal').css("opacity","100");
				$('#demoValues').css("opacity","100");
				$('#demoGoalAUD').css("opacity","100");
				$('#demoContract').css("opacity","100");
				$('#demoContract').text("Contract Details");
				$('#error').text("");
				$('#demoGoal').text("Goal: "+ (goal).toString()+ " ETH");
				$('#demoValues').text("Funding Values: " + "$"+((262.64*(goal)*1)/(100)).toFixed(2).toString() +', '+"$"+ ((262.64*goal)/(50)).toFixed(2).toString()  +', '+"$"+((262.64*goal)/(20)).toFixed(2).toString()  +', '+"$"+((262.64*goal)/10).toFixed(2).toString()  +', '+"$"+((262.64*goal)/5 ).toFixed(2).toString());
				$('#demoGoalAUD').text("Goal (AUD): $" + (goal*262.64).toFixed(2).toString());
			}else{
				$('#error').text("Please enter only numbers in fields.");
			}
		}
	});
	$('#days').on('input', function() {
		var days = $('#days').val();
		if(days == 0){
			$('#demoTime').css("opacity","0");
			if($('#goal').val() == 0){
				$('#demoContract').css("opacity","0");
			}
		}else{
			if(!isNaN(days)){
				$('#demoTime').css("opacity","100");
				$('#demoContract').css("opacity","100");
				$('#error').text("");
				$('#demoContract').text("Contract Details");
				var currData = new Date();
				var nextDate = new Date(currData.getTime() + (days * 24 *  60 * 60 * 1000));
				var dd = String(nextDate.getDate()).padStart(2, '0');
				var mm = String(nextDate.getMonth() + 1).padStart(2, '0'); //January is 0!
				var yyyy = nextDate.getFullYear();

				var today =  dd+'/' + mm + '/' + yyyy;
				$('#demoTime').text("Finish Date: "+today);
			}else{
				$('#error').text("Please enter numbers in fields.");
			}
		}
	});

	var	$window = $(window),
		$body = $('body'),
		$sidebar = $('#sidebar');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ null,      '480px'  ]
		});

	// Hack: Enable IE flexbox workarounds.
		if (browser.name == 'ie')
			$body.addClass('is-ie');

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Forms.

		// Hack: Activate non-input submits.
			$('form').on('click', '.submit', function(event) {

				// Stop propagation, default.
					event.stopPropagation();
					event.preventDefault();

				// Submit form.
					$(this).parents('form').submit();

			});

	// Sidebar.
		if ($sidebar.length > 0) {

			var $sidebar_a = $sidebar.find('a');

			$sidebar_a
				.addClass('scrolly')
				.on('click', function() {

					var $this = $(this);

					// External link? Bail.
						if ($this.attr('href').charAt(0) != '#')
							return;

					// Deactivate all links.
						$sidebar_a.removeClass('active');

					// Activate link *and* lock it (so Scrollex doesn't try to activate other links as we're scrolling to this one's section).
						$this
							.addClass('active')
							.addClass('active-locked');

				})
				.each(function() {

					var	$this = $(this),
						id = $this.attr('href'),
						$section = $(id);

					// No section for this link? Bail.
						if ($section.length < 1)
							return;

					// Scrollex.
						$section.scrollex({
							mode: 'middle',
							top: '-20vh',
							bottom: '-20vh',
							initialize: function() {

								// Deactivate section.
									$section.addClass('inactive');

							},
							enter: function() {

								// Activate section.
									$section.removeClass('inactive');

								// No locked links? Deactivate all links and activate this section's one.
									if ($sidebar_a.filter('.active-locked').length == 0) {

										$sidebar_a.removeClass('active');
										$this.addClass('active');

									}

								// Otherwise, if this section's link is the one that's locked, unlock it.
									else if ($this.hasClass('active-locked'))
										$this.removeClass('active-locked');

							}
						});

				});

		}

	// Scrolly.
		$('.scrolly').scrolly({
			speed: 1000,
			offset: function() {

				// If <=large, >small, and sidebar is present, use its height as the offset.
					if (breakpoints.active('<=large')
					&&	!breakpoints.active('<=small')
					&&	$sidebar.length > 0)
						return $sidebar.height();

				return 0;

			}
		});

	// Spotlights.
		$('.spotlights > section')
			.scrollex({
				mode: 'middle',
				top: '-10vh',
				bottom: '-10vh',
				initialize: function() {

					// Deactivate section.
						$(this).addClass('inactive');

				},
				enter: function() {

					// Activate section.
						$(this).removeClass('inactive');

				}
			})
			.each(function() {

				var	$this = $(this),
					$image = $this.find('.image'),
					$img = $image.find('img'),
					x;

				// Assign image.
					$image.css('background-image', 'url(' + $img.attr('src') + ')');

				// Set background position.
					if (x = $img.data('position'))
						$image.css('background-position', x);

				// Hide <img>.
					$img.hide();

			});

	// Features.
		$('.features')
			.scrollex({
				mode: 'middle',
				top: '-20vh',
				bottom: '-20vh',
				initialize: function() {

					// Deactivate section.
						$(this).addClass('inactive');

				},
				enter: function() {

					// Activate section.
						$(this).removeClass('inactive');

				}
			});
})(jQuery);