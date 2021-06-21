@api
Feature: Views
  In order to present and expose content and configuration
  As a site owner
  I want to have views for various contexts and applications.

  Scenario: Views
    Then exactly the following views should exist
      | Name                                  | Machine name                           | Base table        | Status   | Description                                                                                   |
      | Archive                               | archive                                | Content           | Disabled | All content, by month.                                                                        |
      | Contact messages                      | contact_messages                       | Contact message   | Enabled  | View and manage messages sent through contact forms.                                          |
      | Content                               | content                                | Content           | Enabled  | Find and manage content.                                                                      |
      | Custom block library                  | block_content                          | Custom Block      | Enabled  | Find and manage custom blocks.                                                                |
      | Files                                 | files                                  | Files             | Enabled  | Find and manage files.                                                                        |
      | Frontpage                             | frontpage                              | Content           | Enabled  | All content promoted to the front page.                                                       |
      | Glossary                              | glossary                               | Content           | Disabled | All content, by letter.                                                                       |
      | Image Browser                         | image_browser                          | Media             | Enabled  |                                                                                               |
      | Media                                 | media                                  | Media             | Enabled  | Find and manage media.                                                                        |
      | Media library                         | media_library                          | Media             | Enabled  | Find and manage media.                                                                        |
      | Moderated content                     | moderated_content                      | Content revisions | Enabled  | Find and moderate content.                                                                    |
      | Moderation Dashboard In Review        | content_moderation_dashboard_in_review | Content revisions | Enabled  |                                                                                               |
      | Moderation Dashboard Recent Changes   | moderation_dashboard_recent_changes    | Content revisions | Enabled  |                                                                                               |
      | Moderation Dashboard Recently Created | moderation_dashboard_recently_created  | Content           | Enabled  |                                                                                               |
      | People                                | user_admin_people                      | Users             | Enabled  | Find and manage people interacting with your site.                                            |
      | Recent content                        | content_recent                         | Content           | Enabled  | Recent content.                                                                               |
      | Redirect                              | redirect                               | Redirect          | Enabled  | List of redirects                                                                             |
      | Search                                | search                                 | Index Content     | Enabled  |                                                                                               |
      | Taxonomy term                         | taxonomy_term                          | Content           | Enabled  | Content belonging to a certain taxonomy term.                                                 |
      | Watchdog                              | watchdog                               | Log entries       | Enabled  | Recent log messages                                                                           |
      | Who's new                             | who_s_new                              | Users             | Enabled  | Shows a list of the newest user accounts on the site.                                         |
      | Who's online block                    | who_s_online                           | Users             | Enabled  | Shows the user names of the most recently active users, and the total number of active users. |

  Scenario: Views displays
    Then exactly the following views displays should exist
      | View                                  | Title               | Machine name       | Display plugin |
      | Archive                               | Default             | default            | Default        |
      | Archive                               | Block               | block_1            | Block          |
      | Archive                               | Page                | page_1             | Page           |
      | Contact messages                      | Master              | default            | Default        |
      | Contact messages                      | Page                | page_1             | Page           |
      | Content                               | Default             | default            | Default        |
      | Content                               | Page                | page_1             | Page           |
      | Custom block library                  | Default             | default            | Default        |
      | Custom block library                  | Page                | page_1             | Page           |
      | Files                                 | Default             | default            | Default        |
      | Files                                 | Files overview      | page_1             | Page           |
      | Files                                 | File usage          | page_2             | Page           |
      | Frontpage                             | Default             | default            | Default        |
      | Frontpage                             | Feed                | feed_1             | Feed           |
      | Frontpage                             | Page                | page_1             | Page           |
      | Glossary                              | Default             | default            | Default        |
      | Glossary                              | Attachment          | attachment_1       | Attachment     |
      | Glossary                              | Page                | page_1             | Page           |
      | Image Browser                         | Master              | default            | Default        |
      | Image Browser                         | Entity browser      | entity_browser     | Entity browser |
      | Media                                 | Default             | default            | Default        |
      | Media                                 | Media               | media_page_list    | Page           |
      | Media library                         | Default             | default            | Default        |
      | Media library                         | Page                | page               | Page           |
      | Media library                         | Widget              | widget             | Page           |
      | Media library                         | Widget (table)      | widget_table       | Page           |
      | Moderated content                     | Default             | default            | Default        |
      | Moderated content                     | Moderated content   | moderated_content  | Page           |
      | Moderation Dashboard In Review        | In draft            | block_2            | Block          |
      | Moderation Dashboard In Review        | In review           | block_1            | Block          |
      | Moderation Dashboard In Review        | Master              | default            | Default        |
      | Moderation Dashboard In Review        | Your drafts         | block_3            | Block          |
      | Moderation Dashboard Recent Changes   | Master              | default            | Default        |
      | Moderation Dashboard Recent Changes   | Recent Changes      | block_1            | Block          |
      | Moderation Dashboard Recent Changes   | Your activity       | block_2            | Block          |
      | Moderation Dashboard Recently Created | Content you created | block_2            | Block          |
      | Moderation Dashboard Recently Created | Master              | default            | Default        |
      | Moderation Dashboard Recently Created | Recently created    | block_1            | Block          |
      | People                                | Default             | default            | Default        |
      | People                                | Page                | page_1             | Page           |
      | Recent content                        | Default             | default            | Default        |
      | Recent content                        | Block               | block_1            | Block          |
      | Redirect                              | Master              | default            | Default        |
      | Redirect                              | Page                | page_1             | Page           |
      | Search                                | Master              | default            | Default        |
      | Search                                | Page                | page               | Page           |
      | Taxonomy term                         | Default             | default            | Default        |
      | Taxonomy term                         | Feed                | feed_1             | Feed           |
      | Taxonomy term                         | Page                | page_1             | Page           |
      | Watchdog                              | Default             | default            | Default        |
      | Watchdog                              | Page                | page               | Page           |
      | Who's new                             | Default             | default            | Default        |
      | Who's new                             | Who's new           | block_1            | Block          |
      | Who's online block                    | Default             | default            | Default        |
      | Who's online block                    | Who's online        | who_s_online_block | Block          |
