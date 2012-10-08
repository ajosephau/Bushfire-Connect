<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<title><?php echo $site_name; ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<?php echo $header_block; ?>
	<?php
	// Action::header_scripts - Additional Inline Scripts from Plugins
	Event::run('ushahidi_action.header_scripts');
	?>
</head>

<body id="page">
	<!-- wrapper -->
	<div id="fb-root"></div>
		<script>(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {return;}
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
				fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>
	<div class="rapidxwpr floatholder">

		<!-- header -->
		<div id="header">

			<!-- searchbox -->
			<div id="searchbox">
				
				<!-- user actions -->
				<div id="loggedin_user_action" class="clearingfix">
					<?php if($loggedin_username != FALSE){ ?>
						<a href="<?php echo url::site().$loggedin_role;?>"><?php //echo $loggedin_username; ?></a> <!-- [<a href="<?php //echo url::site();?>logout/front"><?php //echo Kohana::lang('ui_admin.logout');?></a>] -->
					<?php } else { ?>
						<a href="<?php //echo url::site()."members/";?>"><?php //echo Kohana::lang('ui_main.login'); ?></a>
					<?php } ?>
				</div><br/>
				<!-- / user actions -->
				
				<!-- languages -->
				<?php //echo $languages;?>
				<!-- / languages -->

				<!-- searchform -->
				<?php //echo $search; ?>
				<!-- / searchform -->
				
						

			</div>
			<div class="get-app">
				<div class="get-app-btn"><a href="http://download.ushahidi.com/">Get Application</a></div>
				<div class="get-app-spacer" > </div>
				<div class="fb-like-box" data-href="http://www.facebook.com/bushfireconnect" data-width="292" data-height="55" data-show-faces="false" data-stream="false" data-header="false"></div>
			</div>
			
			<!-- / searchbox -->
			
			<!-- logo -->
			<div id="logo">
				<h1><a href="<?php echo url::site();?>"><?php //echo $site_name; ?></a></h1>
				<div class="site-tagline"><?php echo $site_tagline; ?></div>
			</div>
			<!-- / logo -->
			
			<!-- submit incident -->
			<?php //echo $submit_btn; ?>
			<!-- / submit incident -->
			
		</div>
		<!-- / header -->

		<!-- main body -->
		<div id="middle">
			<div class="background layoutleft">

				<!-- mainmenu -->
				<div id="mainmenu" class="clearingfix">
					<ul>
						<?php nav::main_tabs($this_page); ?>
					</ul>

				</div>
				<!-- / mainmenu -->
