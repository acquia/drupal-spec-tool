@api
Feature: Views
  In order to present and expose content and configuration
  As a site owner
  I want to have views for various contexts and applications.

  Scenario: Views
    Then exactly the following views should exist
      | Name                                  | Machine name                           | Base table        | Status   | Description                                                                                   |
      | Archive                               | archive                                | Content           | Disabled | All content, by month.                                                                        |
      | Article Cards                         | article_cards                          | Content           | Enabled  |                                                                                               |
      | Articles                              | articles                               | Index Content     | Enabled  |                                                                                               |
      | Articles (Fallback)                   | articles_fallback                      | Content           | Enabled  |                                                                                               |
      | Content                               | content                                | Content           | Enabled  | Find and manage content.                                                                      |
      | Event Cards                           | event_cards                            | Content           | Enabled  |                                                                                               |
      | Events                                | events                                 | Index Content     | Enabled  |                                                                                               |
      | Events (Fallback)                     | events_fallback                        | Content           | Enabled  |                                                                                               |
      | Files                                 | files                                  | Files             | Enabled  | Find and manage files.                                                                        |
      | Frontpage                             | frontpage                              | Content           | Enabled  | All content promoted to the front page.                                                       |
      | Glossary                              | glossary                               | Content           | Disabled | All content, by letter.                                                                       |
      | Media                                 | media                                  | Media             | Enabled  | Find and manage media.                                                                        |
      | Media library                         | media_library                          | Media             | Enabled  | Find and manage media.                                                                        |
      | Moderated content                     | moderated_content                      | Content revisions | Enabled  | Find and moderate content.                                                                    |
      | Moderation Dashboard                  | moderation_dashboard                   | Users             | Enabled  |                                                                                               |
      | Moderation Dashboard In Review        | content_moderation_dashboard_in_review | Content revisions | Enabled  |                                                                                               |
      | Moderation Dashboard Recent Changes   | moderation_dashboard_recent_changes    | Content revisions | Enabled  |                                                                                               |
      | Moderation Dashboard Recently Created | moderation_dashboard_recently_created  | Content           | Enabled  |                                                                                               |
      | People                                | people                                 | Index Content     | Enabled  |                                                                                               |
      | People                                | user_admin_people                      | Users             | Enabled  | Find and manage people interacting with your site.                                            |
      | People (Fallback)                     | people_fallback                        | Content           | Enabled  |                                                                                               |
      | Places                                | places                                 | Index Content     | Enabled  |                                                                                               |
      | Places (Fallback)                     | places_fallback                        | Content           | Enabled  |                                                                                               |
      | Recent content                        | content_recent                         | Content           | Enabled  | Recent content.                                                                               |
      | Redirect                              | redirect                               | Redirect          | Enabled  | List of redirects                                                                             |
      | Scheduled Content                     | scheduler_scheduled_content            | Content revisions | Enabled  | Find and manage scheduled content.                                                            |
      | Scheduled Media                       | scheduler_scheduled_media              | Media revisions   | Enabled  | Find and manage scheduled media.                                                              |
      | Scheduled Taxonomy Terms              | scheduler_scheduled_taxonomy_term      | Taxonomy terms    | Enabled  | Find and manage scheduled taxonomy terms.                                                     |
      | Search                                | search                                 | Index Content     | Enabled  |                                                                                               |
      | Search Fallback                       | search_fallback                        | Content           | Enabled  |                                                                                               |
      | Taxonomy term                         | taxonomy_term                          | Content           | Enabled  | Content belonging to a certain taxonomy term.                                                 |
      | Watchdog                              | watchdog                               | Log entries       | Enabled  | Recent log messages                                                                           |
      | Who's new                             | who_s_new                              | Users             | Enabled  | Shows a list of the newest user accounts on the site.                                         |
      | Who's online block                    | who_s_online                           | Users             | Enabled  | Shows the user names of the most recently active users, and the total number of active users. |

  Scenario: Views displays
    Then exactly the following views displays should exist
      | View                                  | Title               | Machine name          | Display plugin |
      | Archive                               | Block               | block_1               | Block          |
      | Archive                               | Default             | default               | Default        |
      | Archive                               | Page                | page_1                | Page           |
      | Article Cards                         | Block               | recent_articles_block | Block          |
      | Article Cards                         | Master              | default               | Default        |
      | Articles                              | Master              | default               | Default        |
      | Articles                              | Page                | page                  | Page           |
      | Articles (Fallback)                   | Master              | default               | Default        |
      | Content                               | Default             | default               | Default        |
      | Content                               | Page                | page_1                | Page           |
      | Event Cards                           | Master              | default               | Default        |
      | Event Cards                           | Past Events         | past_events_block     | Block          |
      | Event Cards                           | Upcoming Events     | upcoming_events_block | Block          |
      | Events                                | Master              | default               | Default        |
      | Events                                | Page                | page                  | Page           |
      | Events (Fallback)                     | Master              | default               | Default        |
      | Files                                 | Default             | default               | Default        |
      | Files                                 | File usage          | page_2                | Page           |
      | Files                                 | Files overview      | page_1                | Page           |
      | Frontpage                             | Default             | default               | Default        |
      | Frontpage                             | Feed                | feed_1                | Feed           |
      | Frontpage                             | Page                | page_1                | Page           |
      | Glossary                              | Attachment          | attachment_1          | Attachment     |
      | Glossary                              | Default             | default               | Default        |
      | Glossary                              | Page                | page_1                | Page           |
      | Media                                 | Master              | default               | Default        |
      | Media                                 | Media               | media_page_list       | Page           |
      | Media library                         | Default             | default               | Default        |
      | Media library                         | Page                | page                  | Page           |
      | Media library                         | Widget              | widget                | Page           |
      | Media library                         | Widget (table)      | widget_table          | Page           |
      | Moderated content                     | Default             | default               | Default        |
      | Moderated content                     | Moderated content   | moderated_content     | Page           |
      | Moderation Dashboard                  | Master              | default               | Default        |
      | Moderation Dashboard                  | Page                | page_1                | Page           |
      | Moderation Dashboard In Review        | In draft            | block_2               | Block          |
      | Moderation Dashboard In Review        | In review           | block_1               | Block          |
      | Moderation Dashboard In Review        | Master              | default               | Default        |
      | Moderation Dashboard In Review        | Your drafts         | block_3               | Block          |
      | Moderation Dashboard Recent Changes   | Master              | default               | Default        |
      | Moderation Dashboard Recent Changes   | Recent Changes      | block_1               | Block          |
      | Moderation Dashboard Recent Changes   | Your activity       | block_2               | Block          |
      | Moderation Dashboard Recently Created | Content you created | block_2               | Block          |
      | Moderation Dashboard Recently Created | Master              | default               | Default        |
      | Moderation Dashboard Recently Created | Recently created    | block_1               | Block          |
      | People                                | Default             | default               | Default        |
      | People                                | Master              | default               | Default        |
      | People                                | Page                | page                  | Page           |
      | People                                | Page                | page_1                | Page           |
      | People (Fallback)                     | Master              | default               | Default        |
      | Places                                | Master              | default               | Default        |
      | Places                                | Page                | page                  | Page           |
      | Places (Fallback)                     | Master              | default               | Default        |
      | Recent content                        | Block               | block_1               | Block          |
      | Recent content                        | Default             | default               | Default        |
      | Redirect                              | Master              | default               | Default        |
      | Redirect                              | Page                | page_1                | Page           |
      | Scheduled Content                     | Content Overview    | overview              | Page           |
      | Scheduled Content                     | Master              | default               | Default        |
      | Scheduled Content                     | User                | user_page             | Page           |
      | Scheduled Media                       | Master              | default               | Default        |
      | Scheduled Media                       | Media Overview      | overview              | Page           |
      | Scheduled Media                       | User                | user_page             | Page           |
      | Scheduled Taxonomy Terms              | Master              | default               | Default        |
      | Scheduled Taxonomy Terms              | Taxonomy Terms      | overview              | Page           |
      | Search                                | Master              | default               | Default        |
      | Search                                | Page                | search                | Page           |
      | Search Fallback                       | Block               | search_fallback_block | Block          |
      | Search Fallback                       | Master              | default               | Default        |
      | Taxonomy term                         | Default             | default               | Default        |
      | Taxonomy term                         | Feed                | feed_1                | Feed           |
      | Taxonomy term                         | Page                | page_1                | Page           |
      | Watchdog                              | Default             | default               | Default        |
      | Watchdog                              | Page                | page                  | Page           |
      | Who's new                             | Default             | default               | Default        |
      | Who's new                             | Who's new           | block_1               | Block          |
      | Who's online block                    | Default             | default               | Default        |
      | Who's online block                    | Who's online        | who_s_online_block    | Block          |
