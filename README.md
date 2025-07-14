# Brave-appimage
Unofficial AppImages for Brave Web Browser x86_64/AMD64 and aarch64/ARM64

## History
I have created all the releases of the major Chromium-based browsers:
- [Chromium](https://github.com/ivan-hc/Chromium-Web-Browser-appimage) Stable/Candidate/Beta/Edge
- [Chrome](https://github.com/ivan-hc/Chrome-appimage) Stable/Beta/Unstable 	DEB, upstream 	
- [Microsoft Edge](https://github.com/ivan-hc/MS-Edge-appimage) Stable/Beta/Dev 	DEB, upstream 	
- [Opera](https://github.com/ivan-hc/Opera-appimage) Stable/Beta/Dev 	DEB, upstream 	
- [Vivaldi](https://github.com/ivan-hc/Vivaldi-appimage) Stable/Snapshot 	DEB, upstream 	
- [Yandex Browser](https://github.com/ivan-hc/Yandex-Browser-appimage) Stable/Beta/Corporate 	DEB, upstream 	

...but Brave was missing from my collection... so I created this repository for consistency.

I have always admired and respected the work done at https://github.com/srevinsaju/Brave-AppImage that provides daily builds every day, for many years. It is not and was not my intention to compete with him... so much so that in my "AM" package manager I have always given priority to his builds rather than publishing mine.

Personally I'm not interested in taking away work from colleagues... I had my own method for building the AppImage and wanted to publish it.

Since March 23, 2025 I have decided to replace his scripts in the "AM" database using my builds (see https://github.com/ivan-hc/AM/commit/a4d4cc02f891bcc58ceb54ea204baa905ec229bb), but for three simple reasons:
- The historical repository https://github.com/srevinsaju/Brave-AppImage is not actively maintained, to the point that the [v1.76.73](https://github.com/srevinsaju/Brave-AppImage/releases/tag/v1.76.73) stable release has not been fixed for 2 weeks and was empty, despite a pull request opened for the same amount of time (see https://github.com/srevinsaju/Brave-AppImage/pull/16 and https://github.com/srevinsaju/Brave-AppImage/issues/17 for more context). 
- My repository contains only one release, in order to speed up the download of others that are not "nightly", which on the contrary fill the "releases" section in https://github.com/srevinsaju/Brave-AppImage every day. This has always caused a slowdown when trying to install (for example) the "beta" build which gets buried in hundreds of pages.
- My repository also contains builds for aarch64/ARM64, so it is better to show only one reference repository instead of 3, to avoid confusion.

In my workflows, all six releases (three for each architecture) are complementary: if one fails, the others are not produced. And usually this risk is due to the burial of some "beta" among hundreds of pages where "nightly" reigns supreme, in the upstream repository.

On the other hand, I have made my own a battle that he started: to push the upstream developers to create an official one.

I don't know if I will succeed in my intent... in the meantime I participated in the discussion too https://github.com/brave/brave-browser/issues/1060#issuecomment-2736231749, and I am waiting for an answer.

I am not a user of Brave browser, or any Chromium-based browser... but I am an AppImage user and I want to support this packaging format. I do it for you. So help me put pressure on upstream and spread the word!

------------------------------------------------------------------------

## Install and update them with ease

### *"*AM*" Application Manager* 
#### *Package manager, database & solutions for all AppImages and portable apps for GNU/Linux!*

[![Istantanea_2024-06-26_17-00-46 png](https://github.com/ivan-hc/AM/assets/88724353/671f5eb0-6fb6-4392-b45e-af0ea9271d9b)](https://github.com/ivan-hc/AM)

[![Readme](https://img.shields.io/github/stars/ivan-hc/AM?label=%E2%AD%90&style=for-the-badge)](https://github.com/ivan-hc/AM/stargazers) [![Readme](https://img.shields.io/github/license/ivan-hc/AM?label=&style=for-the-badge)](https://github.com/ivan-hc/AM/blob/main/LICENSE)

*"AM"/"AppMan" is a set of scripts and modules for installing, updating, and managing AppImage packages and other portable formats, in the same way that APT manages DEBs packages, DNF the RPMs, and so on... using a large database of Shell scripts inspired by the Arch User Repository, each dedicated to an app or set of applications.*

*The engine of "AM"/"AppMan" is the "APP-MANAGER" script which, depending on how you install or rename it, allows you to install apps system-wide (for a single system administrator) or locally (for each user).*

*"AM"/"AppMan" aims to be the default package manager for all AppImage packages, giving them a home to stay.*

*You can consult the entire **list of managed apps** at [**portable-linux-apps.github.io/apps**](https://portable-linux-apps.github.io/apps).*

## *Go to *https://github.com/ivan-hc/AM* for more!*

------------------------------------------------------------------------

| [***Install "AM"***](https://github.com/ivan-hc/AM) | [***See all available apps***](https://portable-linux-apps.github.io) | [***Support me on ko-fi.com***](https://ko-fi.com/IvanAlexHC) | [***Support me on PayPal.me***](https://paypal.me/IvanAlexHC) |
| - | - | - | - |

------------------------------------------------------------------------
