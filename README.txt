This directory contains APLAWS themes for Magpie clients
______________________________________________________________________

** MGRID **
Middlesbrough Grid for Learning

Portlets:

Left Pane:

 - Content Item List. 
   Base Object Type - Article
   Output Attributes - title,lead,imageAttachments.image.id
   Sort Ordering - id desc
   Max Items - 3

Center Pane:

- 1 Freform html portlet containing:
<h3>ICT Conference 2009</h3>
<img src="/ccm-ldn-theme/__ccm__/themes-dev/m_grid/images/ict-conference.jpg" alt="ICT Conference will be held on 25 September 2009" />

Right Pane:

- freeform html portlet containing:
<h3>Key Links</h3>
<ul>
    <li><a href="/">Middlesbrough Council homepage</a></li> 
    <li><a href="/">Children and Young People Plan 2007/2008</a></li>
    <li><a href="/">Free Video and Audio</a></li>
    <li><a href="/">Family Service Directory</a></li>
    <li><a href="/">Professional Development</a></li>
    <li><a href="/">School Admissions</a></li>
    <li><a href="/">Grants</a></li>
    <li><a href="/">Education Jobs in Middlesbrough</a></li>
    <li><a href="/">Education Visits</a></li>
</ul>

- freeform html portlet containing:
<h3>Resources</h3>
<ul>
    <li><a href="/">Freedom of Information</a></li>
    <li><a href="/">Fixed term contracts</a></li>
    <li><a href="/">Sure Start timetables</a></li>
    <li><a href="/">Program Resources from Priory Woods</a></li>
</ul>

Navigation:

2 level Nav of the form:

Parents/Carers
        School Admissions
        School Term Dates
        Schools and Centres
        Common Assessment Framework ¬
        Fair Processing Notice
        Fair Processing Notice Links
        Education Acronyms
        Child Protection (external link)
        Notices
        Useful Links
        FAQs
        Key Documents
Learners
        Foundation Stage
        Key Stage 1
        Key Stage 2
        Key Stage 3
        Key Stage 4
        14 to 19 (External)
        Youth Service
        Games
        Kid Grid 
School Staff
        Children Families & Learning
        CPD Courses
        Performance Manage'
        Teacher Resources
        Teacher Assistants
        Key Documents
CFL Staff
        sub nav items tbc
Governers
        Meet the Development Team
        Prospective Governors
        Training
        Comments
        Links
        Key Documents

You also need to do some theme work to get the header working correctly. Edit: m_grid/xsl/bebop/topNav.xsl and change the parameters starting on line 16. These can't be generated from the XML because of the AtoZ and Search Results pages.


______________________________________________________________________

**STEM **
Stronger Together in East Middlesbrough

Portlets:
Left Column - 1 content Directory portlet.
Right Column - Content Item List. 
                 Base Object Type - Article
                 Output Attributes - title,lead,imageAttachments.image.id
                 Sort Ordering - id desc
                 Max Items - 2

Navigation:
* Home
* About STEM
* Contact Us
* The Team
* Volunteering
* STEM Themes
* Image Galleries

