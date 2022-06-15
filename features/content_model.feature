@api
Feature: Content model
  In order to enter structured content into my site
  As a content editor
  I want to have content entity types that reflect my content model.

  Scenario: Bundles
    Then exactly the following content entity type bundles should exist
      | Name         | Machine name | Type         | Description                                                                                                          |
      | Article      | article      | Content type | A structured content type used for creating various types of articles.                                               |
      | Article Type | article_type | Vocabulary   | Descriptive metadata, for categorizing content and making search engines happy.                                      |
      | Categories   | categories   | Vocabulary   | Descriptive metadata, for categorizing content and making search engines happy.                                      |
      | Document     | document     | Media type   | Locally hosted documents.                                                                                            |
      | Event        | event        | Content type | A structured content type used for creating various types of events.                                                 |
      | Event Type   | event_type   | Vocabulary   |                                                                                                                      |
      | Image        | image        | Media type   | Locally hosted images.                                                                                               |
      | Page         | page         | Content type | An unstructured content type that provides unique landing pages - e.g., a homepage, or marketing event landing page. |
      | Person       | person       | Content type | A structured content type used for creating various types of people.                                                 |
      | Person Type  | person_type  | Vocabulary   | Descriptive metadata, for categorizing content and making search engines happy.                                      |
      | Place        | place        | Content type | A structured content type used for creating various types of places.                                                 |
      | Place Type   | place_type   | Vocabulary   |                                                                                                                      |
      | Tags         | tags         | Vocabulary   | Descriptive metadata, for categorizing content and making search engines happy.                                      |
      | Video        | video        | Media type   | Remotely hosted videos from external sources, e.g. YouTube, Vimeo.                                                   |

  Scenario: Fields
    Then exactly the following fields should exist
      | Bundle                 | Field label        | Machine name             | Field type                             | Required | Cardinality | Form widget               | Translatable | Help text                                                                                                     |
      | Article (Content type) | Article Type       | field_article_type       | Entity reference                       |          | 1           | Select list               | Translatable |                                                                                                               |
      | Article (Content type) | Body               | body                     | Text (formatted, long, with summary)   | Required | 1           | Text area with a summary  | Translatable |                                                                                                               |
      | Article (Content type) | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Article (Content type) | Display Author     | field_display_author     | Entity reference                       |          | 1           | Autocomplete              | Translatable |                                                                                                               |
      | Article (Content type) | Image              | field_article_image      | Entity reference                       |          | 1           | Media library             | Translatable |                                                                                                               |
      | Article (Content type) | Media              | field_article_media      | Entity reference                       |          | Unlimited   | Media library             | Translatable |                                                                                                               |
      | Article (Content type) | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Document (Media type)  | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Document (Media type)  | File               | field_media_file         | File                                   | Required | 1           | File                      | Translatable |                                                                                                               |
      | Document (Media type)  | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Event (Content type)   | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Event (Content type)   | Description        | body                     | Text (formatted, long, with summary)   | Required | 1           | Text area with a summary  | Translatable |                                                                                                               |
      | Event (Content type)   | Start Date         | field_event_start        | Date                                   | Required | 1           | Date and time             | Translatable |                                                                                                               |
      | Event (Content type)   | Door Time          | field_door_time          | Date                                   | Required | 1           | Date and time             | Translatable |                                                                                                               |
      | Event (Content type)   | Duration           | field_event_duration     | Text (plain)                           |          | 1           | Textfield                 | Translatable |                                                                                                               |
      | Event (Content type)   | End Date           | field_event_end          | Date                                   |          | 1           | Date and time             | Translatable |                                                                                                               |
      | Event (Content type)   | Event Type         | field_event_type         | Entity reference                       |          | 1           | Select list               | Translatable |                                                                                                               |
      | Event (Content type)   | Image              | field_event_image        | Entity reference                       |          | 1           | Media library             | Translatable |                                                                                                               |
      | Event (Content type)   | Place              | field_event_place        | Entity reference                       |          | 1           | Select list               | Translatable | If this event is not being held at one of the listed places, include the address/location in the Description. |
      | Event (Content type)   | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Image (Media type)     | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Image (Media type)     | Image              | image                    | Image                                  | Required | 1           | Image (Focal Point)       | Translatable |                                                                                                               |
      | Image (Media type)     | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Page (Content type)    | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Page (Content type)    | Image              | field_page_image         | Entity reference                       |          | 1           | Media library             | Translatable | An image which will be displayed in search results.                                                           |
      | Page (Content type)    | Layout Canvas      | field_layout_canvas      | Site Studio Entity reference revisions |          | 1           | Site Studio layout canvas | Translatable |                                                                                                               |
      | Page (Content type)    | Search Description | body                     | Text (formatted, long, with summary)   |          | 1           | Text area with a summary  | Translatable | A short description or teaser which will be displayed in search results.                                      |
      | Page (Content type)    | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Person (Content type)  | Bio                | body                     | Text (formatted, long, with summary)   | Required | 1           | Text area with a summary  | Translatable |                                                                                                               |
      | Person (Content type)  | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Person (Content type)  | Email              | field_email              | Email                                  |          | 1           | Email                     | Translatable |                                                                                                               |
      | Person (Content type)  | Image              | field_person_image       | Entity reference                       | Required | 1           | Media library             | Translatable |                                                                                                               |
      | Person (Content type)  | Job Title          | field_job_title          | Text (plain)                           |          | 1           | Textfield                 | Translatable |                                                                                                               |
      | Person (Content type)  | Person Type        | field_person_type        | Entity reference                       |          | 1           | Select list               | Translatable |                                                                                                               |
      | Person (Content type)  | Place              | field_place              | Entity reference                       |          | 1           | Select list               | Translatable |                                                                                                               |
      | Person (Content type)  | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Person (Content type)  | Telephone          | field_person_telephone   | Telephone number                       |          | 1           | Telephone number          | Translatable |                                                                                                               |
      | Place (Content type)   | Address            | field_place_address      | Address                                | Required | 1           | Address                   | Translatable |                                                                                                               |
      | Place (Content type)   | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Place (Content type)   | Description        | body                     | Text (formatted, long, with summary)   |          | 1           | Text area with a summary  | Translatable |                                                                                                               |
      | Place (Content type)   | Geofield           | field_geofield           | Geofield                               |          | 1           | Latitude/Longitude        | Translatable |                                                                                                               |
      | Place (Content type)   | Image              | field_place_image        | Entity reference                       | Required | 1           | Media library             | Translatable |                                                                                                               |
      | Place (Content type)   | Place Type         | field_place_type         | Entity reference                       |          | 1           | Select list               | Translatable |                                                                                                               |
      | Place (Content type)   | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
      | Place (Content type)   | Telephone          | field_place_telephone    | Telephone number                       |          | 1           | Telephone number          | Translatable |                                                                                                               |
      | Video (Media type)     | Categories         | field_categories         | Entity reference                       |          | Unlimited   | Select list               | Translatable |                                                                                                               |
      | Video (Media type)     | Remote video URL   | field_media_oembed_video | Text (plain)                           | Required | 1           | oEmbed URL                | Translatable |                                                                                                               |
      | Video (Media type)     | Tags               | field_tags               | Entity reference                       |          | Unlimited   | Autocomplete (Tags style) | Translatable |                                                                                                               |
