Directory Contents:

content_images - images required for initial content items.
coventry recycling - the recycling theme
resources - original psds for all pages plus helvetica neue bold font and some ai files.


How to create the Coventry recycling subsite

1. Install the theme

2. Create the navigation structure as follows:

    Blue Bin
    Brown Bin
    Green Bin

3. Create index articles for each of the categories using the text in resources/Coventry_website_copy.doc

4. Add 2 images to each index article from the content_images directory. The title should have use case "title" and the item image should have use case "items"

5. Create an mpa called contact. Add 4 content sections called main, phone, write and visit with sensible content. Attach the recycling roadshows image with use case "title". Publish in the root category

5. Create demo Coventry Press release items in each category. These go to populate the FAQ section. They only need a title and description. They should be sorted in order of release date.

6. If necessary modify the variables in xsl/top_links.xsl to point to the correct categories. (the defaults should be fine here)

7. Using the Aplaws default theme create freeformHTML portlets on the homepage as follows.

In the top (right) section create the following:

name: main
content:
<h1><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/titles/your_new_recycling_and_wast.png" alt="Your New Recycling &amp; Waste Collection"/></h1>
<h2><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/titles/improved_services.png" alt="Improved Services from October 2009"/></h2>
<p>We are making improvements to your recycling service so that we can all recycle more and help protect our environment. Depending on where you live, the new service will start between October and November 2009. We will provide you with more detailed information to explain how and when to use the new service when we deliver your new recycling bin a few weeks before we make your first collection. You will have three bins for your recycling, garden waste and rubbish.</p>

name: links
content:
<form id="search" action="#">
<fieldset>
<input type="text" class="search" value="search"/>
<input type="submit" class="submit" value="search"/>
</fieldset>
</form>
<h2><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/titles/useful_links.png" alt="Useful Links"/></h2>
<ul>
<li><a href="#">find your nearest recycling bank</a></li>
<li><a href="#">find out about composting and water butts</a></li>
<li><a href="#">find out about real nappies</a></li>
<li><a href="#">bulky waste collections</a></li>
<li><a href="#">Public Waste Recycling Facility (The Tip)</a></li>
<li><a href="#">find out about bicycle recycling</a></li>
</ul>

In the bottom (left) section create the following:

name: bins
content:
<ul class="bins">
<li class="blue_bin">
<a href="/navigation/blue-bin"><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/bins/blue_off.png" alt="blue bin" class="rollover"/></a>
</li>
<li class="brown_bin">
<a href="/navigation/brown-bin"><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/bins/brown_off.png" alt="brown bin" class="rollover"/></a>
</li>
<li class="green_bin">
<a href="/navigation/green-bin"><img src="/ccm-ldn-theme/__ccm__/themes-dev/coventry_recycling/images/bins/green_off.png" alt="green bin" class="rollover"/></a>
</li>
</ul>

