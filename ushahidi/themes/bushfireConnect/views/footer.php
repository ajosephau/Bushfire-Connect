			</div>
		</div>
		<!-- / main body -->

	</div>
	<!-- / wrapper -->
	
	<!-- footer -->
	<div id="footer" class="clearingfix">
 
		<div id="underfooter"></div>
				
		<!-- footer content -->
		<div class="rapidxwpr floatholder">
 
			<!-- footer credits -->
			
			<!-- / footer credits -->
		
			<!-- footer menu -->
			<div class="footermenu">
			
				<img id="emergency-number" src="<?php echo url::file_loc('img'); ?>themes/bushfireConnect/images/emergency_number.png" >
				</img>
				<ul class="clearingfix">
				<table class="footer-links" >
				  <tr>
					<td class="site-links">
						Site Links
					</td>
					<td class="official-info">
						Official Information Sources
					</td>
					
				  </tr>
				  <tr>
					<td>
						<li><a class="item1" href="<?php echo url::site(); ?>"><?php echo Kohana::lang('ui_main.home'); ?></a></li>
					</td>
					<td>
						<li><a href="http://www.cfa.vic.gov.au"><?php echo "Country Fire Authority (Victoria)"; ?></a></li>
					</td>
				  </tr>
				  <tr>
					<td>
						<li><a href="<?php echo url::site()."reports/submit"; ?>"><?php echo Kohana::lang('ui_main.submit'); ?></a></li>
					</td>
					<td>
						<li><a href="http://esa.act.gov.au/community-information/incidents-map/"><?php echo "ACT Rural Fire Service"; ?></a></li>
					</td>
					
					
				  </tr>
				  <tr>
						<td>
							<li><a href="<?php echo url::site()."alerts"; ?>"><?php echo Kohana::lang('ui_main.alerts'); ?></a></li>
						</td>
						<td>
							<li><a href="http://www.cfs.sa.gov.au/site/home.jsp"><?php echo "Country Fire Service (South Australia)"; ?></a></li>
						</td>
				  </tr>
				  <tr>
					<td>
							<li><a href="<?php echo url::site()."contact"; ?>"><?php echo "About Us"; ?></a></li>
					</td>
					<td>
						<li><a href="http://www.fesa.wa.gov.au/Pages/default.aspx"><?php echo "Fire And Emergency Services Authority of WA (FESA)"; ?></a></li>
					</td>
				  </tr>
				  <tr>
						<td>
							<li><a href="<?php echo url::site()."contact"; ?>"><?php echo Kohana::lang('ui_main.contact'); ?></a></li>
						</td>
						<td>
							<li><a href="http://www.rfs.nsw.gov.au/"><?php echo "NSW Rural Fire Service"; ?></a></li>
						</td>
				  </tr>
					<tr>
						<td>
							<li><a href="<?php echo url::site()."page/index/1"; ?>"><?php echo "Volunteer"; ?></a></li>
						</td>
						<td>
							<li><a href="http://www.pfes.nt.gov.au/Fire-and-Rescue.aspx"><?php echo "Northern Territory Fire and Rescue Service (NTFRS)"; ?></a></li>
						</td>
				  </tr>
					
						<tr>
						<td>
							<li><a href="<?php echo url::site()."blog"; ?>"><?php echo "Blog"; ?></a></li>
						</td>
						<td>
							<li><a href="http://www.fire.qld.gov.au/"><?php echo "Rural Fire Service (Queensland)"; ?></a></li>
						</td>
				  </tr>
						<tr>
						<td>
							<li><a href="<?php echo url::site()."contact"; ?>"><?php echo "Help"; ?></a></li>
						</td>
						<td>
							<li><a href="http://www.fire.tas.gov.au/"><?php echo "Tasmania Fire Service"; ?></a></li>
						</td>
				  </tr>
					<tr>
						<td>
							<li><a href="<?php echo "http://www.paypal.com"; ?>"><?php echo "Donate"; ?></a></li>
						</td>
						
				  </tr>
					
					
				</table>	 
					
					<?php
					// Action::nav_main_bottom - Add items to the bottom links
					Event::run('ushahidi_action.nav_main_bottom');
					?>
				
				</ul>
				<div class="site-copyright">
					<?php if($site_copyright_statement != '') { ?>
						<p><?php echo $site_copyright_statement; ?></p>
					<?php } ?>
				</div>
					<div class="footer-credits">
				Powered by the &nbsp;<a href="http://www.ushahidi.com/"><img src="<?php echo url::file_loc('img'); ?>media/img/footer-logo.png" alt="Ushahidi" style="vertical-align:middle" /></a>&nbsp; Platform
			</div>
			</div>
			<!-- / footer menu -->
				
			
			<!--<h2 class="feedback_title" style="clear:both">
				<a href="http://feedback.ushahidi.com/fillsurvey.php?sid=2"><?php echo Kohana::lang('ui_main.feedback'); ?></a>
			</h2> -->
			
 
		</div>
		<!-- / footer content -->
 
	</div>
	<!-- / footer -->
 
	<?php echo $ushahidi_stats; ?>
	<?php echo $google_analytics; ?>
	
	<!-- Task Scheduler --><script type="text/javascript">$(document).ready(function(){$('#schedulerholder').html('<img src="<?php echo url::base(); ?>scheduler" />');});</script><div id="schedulerholder"></div><!-- End Task Scheduler -->
 
	<?php
	// Action::main_footer - Add items before the </body> tag
	Event::run('ushahidi_action.main_footer');
	?>
</body>
</html>
