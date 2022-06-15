@api
Feature: Media
  In order to present media appropriately
  As a site owner
  I want to have image styles for various contexts.

  Scenario: Image styles
    Then exactly the following image styles should exist
      | Style name                         | Machine name                |
      | Component preview                  | dx8_component_preview       |
      | Large (480×480)                    | large                       |
      | Large (W1024)                      | coh_large                   |
      | Large landscape (1024x683)         | coh_large_landscape         |
      | Large super landscape (1024x480)   | coh_large_super_landscape   |
      | Media Library thumbnail (220×220)  | media_library               |
      | Medium (220×220)                   | medium                      |
      | Medium (W768)                      | coh_medium                  |
      | Medium landscape (768x512)         | coh_medium_landscape        |
      | Medium super landscape (768x360)   | coh_medium_super_landscape  |
      | Small (W568)                       | coh_small                   |
      | Small landscape (568x352)          | coh_small_landscape         |
      | Small square (568x568)             | coh_small_square            |
      | Thumbnail (100×100)                | thumbnail                   |
      | Wide (1090)                        | wide                        |
      | X Large (1360)                     | coh_x_large                 |
      | X Large landscape (1360x908)       | coh_x_large_landscape       |
      | X Large super landscape (1360x640) | coh_x_large_super_landscape |
      | X Small (W480)                     | coh_x_small                 |
      | XX Large landscape (1600x1067)     | coh_xx_large_landscape      |
      | XX Small (160)                     | coh_xx_small                |
      | XX Small landscape (160x120)       | coh_xx_small_landscape      |

  Scenario: Image effects
    Then exactly the following image effects should exist
      | Image style                        | Effect                     | Summary                     |
      | Component preview                  | Scale                      | 250×250 (upscaling allowed) |
      | Large (480×480)                    | Scale                      | 480×480                     |
      | Large (W1024)                      | Scale                      | width 1024                  |
      | Large landscape (1024x683)         | Focal Point Scale and Crop | 1024×683                    |
      | Large super landscape (1024x480)   | Focal Point Scale and Crop | 1024×480                    |
      | Media Library thumbnail (220×220)  | Scale                      | 220×220                     |
      | Medium (220×220)                   | Scale                      | 220×220                     |
      | Medium (W768)                      | Scale                      | width 768                   |
      | Medium landscape (768x512)         | Focal Point Scale and Crop | 768×512                     |
      | Medium super landscape (768x360)   | Focal Point Scale and Crop | 768×360                     |
      | Small (W568)                       | Scale                      | width 568                   |
      | Small landscape (568x352)          | Focal Point Scale and Crop | 568×352                     |
      | Small square (568x568)             | Focal Point Scale and Crop | 568×568                     |
      | Thumbnail (100×100)                | Scale                      | 100×100                     |
      | Wide (1090)                        | Scale                      | width 1090                  |
      | X Large (1360)                     | Scale                      | width 1360                  |
      | X Large landscape (1360x908)       | Focal Point Scale and Crop | 1360×908                    |
      | X Large super landscape (1360x640) | Focal Point Scale and Crop | 1360×640                    |
      | X Small (W480)                     | Scale                      | width 480                   |
      | XX Large landscape (1600x1067)     | Focal Point Scale and Crop | 1600×1067                   |
      | XX Small (160)                     | Scale                      | width 160                   |
      | XX Small landscape (160x120)       | Focal Point Scale and Crop | 160×120                     |
