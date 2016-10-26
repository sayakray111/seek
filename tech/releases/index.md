---
title: SEEK releases
layout: page
---

# SEEK Releases

Latest version - {{ site.current_seek_version }}

## Version 1.1.2

Release date: _September 30th 2016_

Fixes and small improvements, in particular:

  * A new My Items page, available from the account menu, which gives quick access to your own items
  * Fix to browsing text files, which was a particular problem for CSV and TSV files
  * Models simulation page can now be shared as a URL by copying from the browser.
  * Fix to include creators of Investigations, Studies and Assays in related items page

Small fixes and minor improvements - for full details see [SEEK v1.1.2 release notes](release-notes-1.1.2.html)

## Version 1.1.1

Release date: _June 21st 2016_

Small fixes and minor improvements - for full details see [SEEK v1.1.1 release notes](release-notes-1.1.1.html)

## Version 1.1.0

Release date: _June 15th 2016_

  * New icons and front page changes - in particular
      * New and improved SEEK logo - [http://goo.gl/NeALVA](http://goo.gl/NeALVA)
      * New default avatars for Project and Institution
      * New logos for Investigation, Study and Assays
      * New logos badges for the different roles
  * Support for Programmes to define funding codes
  * Licensing of assets. Existing assets will default to 'No License'. For more information please visit [Licenses](/help/user-guide/licenses.html)
  * Ability to publish and create Research Object snapshots for Studies and Assays, along with assigning a DOI. Previously only the larger Investigation package was supported
  * Display storage usage information for Programmes and Projects, visible to administrators.

A full list of changes included in this release can be found in the [SEEK v1.1.0 release notes](release-notes-1.1.0.html).


## Version 1.0.3

Release date: _April 1st 2016_

Upgrade fix that avoids a possible error in some cases when upgrading from a fresh 0.23.0 version of SEEK.

## Version 1.0.2

Release date: _February 9th 2016_

Patch release with some minor improvements and bug fixes, in particular

  * Corrected the information sent to project administrators when a new person signs up
  * Removed some redundant pages
  * Fix to application status report page for monitoring
  * ORCiD only mandatory during registration, not when creating profiles (if this configuration is turned on)

A full list of changes included in this release can be found in the [SEEK v1.0.2 release notes](release-notes-1.0.2.html).

## Version 1.0.1

Release date: _December 15th 2015_

Patch release with a couple of bugfixes.

  * Fixed the back-button after search
  * Prevent email password being auto filled by browser

Also added support to start easily and safely adding links to help pages in user guide.

A full list of changes included in this release can be found in the [SEEK v1.0.1 release notes](release-notes-1.0.1.html).

## Version 1.0.0

Release date: _December 8th 2015_

### Self management of Programmes and Projects

* Standard users can create their own Programmes.
  * This feature can be turned off by a SEEK administrator if not required.
  * An administrator is required to approve the created Programme.
* The creator of Programme can administer it, or allow somebody else to administer it.
* A programme administrator can create Organisms.
* Improvement to roles
  * Project manager becomes Project administrator.
  * Asset manager becomes Asset Housekeeper - and can now only manage assets for those who have been flagged as leaving a project.
  * Gatekeeper now becomes Asset Gatekeeper.
  * Introduced Programme administrator, who can create and projects and become their administrator or assign somebody else as an administrator.
  * _Roles will be fully documented in more detail in the near future_.
* A project administrator can flag somebody as having left a project.
* Better and easier management of project members and roles.

### Investigation Snapshots and publication

* Support for creating a [Research Object](http://www.researchobject.org/) for an Investigation to form a *Snapshot*.
  * This allows an Investigation to be frozen in time for publication, whilst allowing it to continue to change in the future.
  * Support for easily and quickly making a full Investigation publically available.
* A DOI can be generated and associated with an Investigation Snapshot.
* If configured, a snapshot can easily be pushed to [Zenodo](https://zenodo.org/).

### Improved support for remote and large content

* Presentations added as Slide share or Youtube links will now be rendered within SEEK.
  * This introduces a rendering framework that makes it easier to add new renderers and in the future make it easier for 3rd party developers to contribute renderers.
* Improved handling of remote and of large content.

### Biosamples

* Biosample support has been deprecated and disabled.
* Biosamples will be improved and reimplemented as our next major feature change.
* Biosamples can be re-enabled by an administrator.
* If you currently use the Biosamples that was available in SEEK please [contact us](/contacting-us.html).

### Help pages link

* Help pages can now be hosted externally and an administrator can point to the source of them.
* From past experience, we find it much easier to maintain and update our own Help pages and documentation outside of SEEK, allowing us to expand and improve on them between releases.
* Our documentation will now be published and maintained using GitHub pages making it easier to maintain between versions and receive [Contributions](/contributing.html).
* Internal help pages are currently still available, but could be deprecated in a future release. If you edit your own internal pages please [contact us](/contacting-us.html).

### Miscellaneous

* Improvements to ISA graph rendering.
* Better reporting of the source of error, if an error occurs with a 3rd party service integration.
* [ORCiD](http://orcid.org/) field can be made mandatory during registration.
* File extensions and urls are indexed for search.
* [Imprint/Impressum](https://en.wikipedia.org/wiki/Impressum) support.



A full detailed list of changes included in this release can be found in the [SEEK v1.0.0 release notes](release-notes-1.0.0.html).

## Previous releases

For previous releases please visit our [Earlier Changelogs](http://seek4science.org/changes).