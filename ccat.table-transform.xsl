<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>

<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ou="http://omniupdate.com/XSL/Variables"
    xmlns:fn="http://omniupdate.com/XSL/Functions"
    xmlns:ouc="http://omniupdate.com/XSL/Variables"
    exclude-result-prefixes="ou xsl xs fn ouc">
	
	<!-- ========== START COURSE CATALOG ========== -->
	
	<xsl:template match="table[@class='ccat']" mode="copy">

	    <script type="text/javascript">
	    var feed_url = "<xsl:value-of select="tbody/tr/td[@class='ccat-link']"/>";

	    var feed_parts = feed_url.split("#");
	    var tab = "text";
	    if(typeof feed_parts[1] !== 'undefined' && feed_parts[1] != tab)
	      tab = "coursestext";
	    feed_url = feed_parts[0] + "index.xml";

	    function showCourse(obj, course){
	      $.ajax({
		url: "https://catalog.uark.edu/ribbit/index.cgi?page=getcourse.rjs&code="+course,
		success: function(result){
		  if ($(result).find("course").length) {
		    var html = $(result).find("course").text();
		    $(obj).attr("data-content",html).attr("data-original-title",course).popover({html:true}).popover("show");
		  } else {
		    var html = "<p>Course information cannot be found. This course may " +
			    "no longer be offered. If you believe there is an error or " +
			    "require more information, please contact the course " +
			    "department.</p>";
		  }
		},
		error: function(jqXHR, textStatus, errorThrown){
		  alert ("ajax call returns error: " + errorThrown);
		}
	      });
	      return false;
	    }

	    $(function (){
	      $.ajax({
		url: feed_url,
		success: function (req) {
		  if ($(req).find(tab).length){
		    var html = $(req).find(tab).text();
		  } else {
		    var html = "<p>Course information cannot be found. This course may " +
		    "no longer be offered. If you believe there is an error or " +
		    "require more information, please contact the course " +
		    "department.</p>";
		  }
		  var parsedHtml = $.parseHTML( html );
		  $(parsedHtml).find("a").each(function(){
		    var href = "https://catalog.uark.edu" + $(this).attr("href");
		    $(this).attr("href", href);
		  });
		  $(".courseContent").append(parsedHtml);
		  $(".bubblelink").popover({html:true});
		}
	      });
	    });

	    $('html').on('click', function(e) {
	      if (typeof $(e.target).data('original-title') == 'undefined' &&
		!$(e.target).parents().is('.popover.in')) {
		$('[data-original-title]').popover('hide');
	      }
	    });

	    </script>
	    <div class="courseContent"></div>

	</xsl:template>
	
	<!-- ========== END COURSE CATALOG ========== -->

</xsl:stylesheet>
