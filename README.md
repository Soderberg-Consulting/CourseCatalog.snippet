# CourseCatalog.snippet
jQuery ajax call to University of Arkansas course catalog snippet for OmniUpdate Campus CMS

## In Editor:  
![snippet screenshot](https://raw.githubusercontent.com/admonkey/CourseCatalog.snippet/master/snippet.screenshot.png)

## Published Page:  
![popover screenshot](https://raw.githubusercontent.com/admonkey/CourseCatalog.snippet/master/published.screenshot.png)

## getting started
* browse the **undergraduate or graduate catalog** pages at https://catalog.uark.edu/
* when you find a page you like, such as [https://catalog.uark.edu/undergraduatecatalog/collegesandschools/sammwaltoncollegeofbusiness/supplychainmanagement/](https://catalog.uark.edu/undergraduatecatalog/collegesandschools/sammwaltoncollegeofbusiness/supplychainmanagement/), then put it in the URL field.
* currently, we only support the "overview" and "courses" tabs, but it's possible to get more, such as [https://catalog.uark.edu/undergraduatecatalog/collegesandschools/sammwaltoncollegeofbusiness/supplychainmanagement/#courseinventory](https://catalog.uark.edu/undergraduatecatalog/collegesandschools/sammwaltoncollegeofbusiness/supplychainmanagement/#courseinventory).

## installation
* snippets are site-specific, so you will need to repeat this process for each site. 
  [more info](http://support.omniupdate.com/oucampus10/reusable-content/snippets/snippets-setup.html)
* upload `ccat.inc` to your snippets folder, this is usually in `/_resources/snippets`
* upload `ccat.table-transform.xsl` to your folder with `interior.xsl`, usually found in `/_resources/xsl`
  * keep in mind this may only need to be uploaded to one site if you are pulling common xsl files for all sites. 
    You can see if this is the case at the top of the source in one of your .pcf files and note the `site` attribute.
    For instance, `<?pcf-stylesheet path="/xsl/interior.xsl" site="templates" title="Interior Page" extension="php"?>`
    shows that this .pcf file is pulling `interior.xsl` from the site called "templates"
* edit your `interior.xsl`, after the opening `<xsl:stylesheet>` tag, then
  * **add this line** `<xsl:import href="ccat.table-transform.xsl"/>`
* then goto content > snippets
* choose a snippet category, or create a new one
* click "+new"
* give it a name, like "Course Catalog"
* browse to the file location where the snippet is stored
  * remember snippets must be loaded in the staging (OU Campus) server's file system for each and every site, even if you are including the xsl from a common site. I'm have no idea why it allows you to browse and select snippets from other sites, since it won't work when you try to load and actually use them - this seems like a bug in OU Campus to me, but maybe it's just a bug with our particular configuration.
* save, and now the snippet is available in the WYSIWYG toolbar or gadget sidebar
