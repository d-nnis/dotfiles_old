config.load_autoconfig()
#c.url.searchengines["DEFAULT"] = "https://www.google.com/search?q={}&pws=0&gl=be&gws_rd=cr"

def bind_search(key, keyword, search_url):
  c.url.searchengines[keyword] = search_url
  config.bind(key, 'set-cmd-text -s :open -t ' + keyword + ' ')

#bind_search('ad', 'amazonde', 'https://www.amazon.de/s/field-keywords={}')
#bind_search('af', 'amazonfr', 'https://www.amazon.fr/s/field-keywords={}')
#bind_search('lG', 'github', 'https://github.com/search?o=desc&q={}&ref=simplesearch&type=Repositories')
#bind_search('ccc', 'googleluckygithub', 'https://www.google.com/search?hl=en&q=github+{}&btnI=Im+Feeling+Lucky')


c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'w': 'https://web6.codeprobe.de/wiki/index.php?title=Spezial%3ASuche&search={}&go=Seite', 'awe': 'https://duckduckgo.com/html?q=site%3Aawesomewm.org%20 {}'}

c.tabs.select_on_remove = "prev"

# ad-blocking
# -----------
# https://filterlists.com/
# https://raw.githubusercontent.com/collinbarrett/FilterLists/master/data/Lists.json
# https://github.com/StevenBlack/hosts
c.content.host_blocking.lists = [
    #'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-social/hosts',
    'https://www.malwaredomainlist.com/hostslist/hosts.txt',
    #'http://winhelp2002.mvps.org/hosts.zip',
    'http://malwaredomains.lehigh.edu/files/justdomains.zip',
    #'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext'
]


# default
c.editor.command = ['gvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']

## colors from https://bitbucket.org/kartikynwa/dotty2hotty/src/1a9ba9b80f07e1f63b740da5e6970dc5a97f1037/qutebrowser.py?at=master
solarized = {
    'base03': '#002b36',
    'base02': '#073642',
    'base002': '#006f6f',
    'base002-bright': '#d8ffd8',
    'base01': '#586e75',
    'base00': '#657b83',
    'base0': '#839496',
    'base1': '#93a1a1',
    'base2': '#eee8d5',
    'base3': '#fdf6e3',
    'yellow': '#b58900',
    'orange': '#cb4b16',
    'red': '#dc322f',
    'magenta': '#d33682',
    'violet': '#6c71c4',
    'blue': '#268bd2',
    'cyan': '#2aa198',
    'green': '#859900'
}

## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
# config.load_autoconfig()

## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
# c.aliases = {'w': 'session-save', 'q': 'close', 'wq': 'quit --save'}

## How often (in milliseconds) to auto-save config/cookies/etc.
## Type: Int
# c.auto_save.interval = 15000

## Always restore open sites when qutebrowser is reopened.
## Type: Bool
# c.auto_save.session = False

## The backend to use to display websites. qutebrowser supports two
## different web rendering engines / backends, QtWebKit and QtWebEngine.
## QtWebKit was discontinued by the Qt project with Qt 5.6, but picked up
## as a well maintained fork: https://github.com/annulen/webkit/wiki -
## qutebrowser only supports the fork. QtWebEngine is Qt's official
## successor to QtWebKit. It's slightly more resource hungry that
## QtWebKit and has a couple of missing features in qutebrowser, but is
## generally the preferred choice. This setting requires a restart.
## Type: String
## Valid values:
##   - webengine: Use QtWebEngine (based on Chromium)
##   - webkit: Use QtWebKit (based on WebKit, similar to Safari)
# c.backend = 'webengine'

## This setting can be used to map keys to other keys. When the key used
## as dictionary-key is pressed, the binding for the key used as
## dictionary-value is invoked instead. This is useful for global
## remappings of keys, for example to map Ctrl-[ to Escape. Note that
## when a key is bound (via `bindings.default` or `bindings.commands`),
## the mapping is ignored.
## Type: Dict
# c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = solarized['base03']

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = solarized['base03']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = solarized['base03']

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = solarized['base3']

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = solarized['base02']

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = solarized['base1']

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = solarized['violet']

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = solarized['violet']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = solarized['violet']

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = solarized['base3']

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = solarized['base2']

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = solarized['base02']

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = solarized['base1']

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = solarized['base2']

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = solarized['base03']

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = solarized['red']

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = solarized['base3']

## Color gradient start for download backgrounds.
## Type: QtColor
# c.colors.downloads.start.bg = '#0000aa'

## Color gradient start for download text.
## Type: QtColor
c.colors.downloads.start.fg = solarized['base3']

## Color gradient stop for download backgrounds.
## Type: QtColor
# c.colors.downloads.stop.bg = '#00aa00'

## Color gradient end for download text.
## Type: QtColor
# c.colors.downloads.stop.fg = solarized['base3']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'

## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = solarized['violet']

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = solarized['base3']

## Font color for the matched part of hints.
## Type: QssColor
c.colors.hints.match.fg = solarized['base1']

## Background color of the keyhint widget.
## Type: QssColor
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = solarized['base3']

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = solarized['yellow']

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = solarized['red']

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = solarized['red']

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = solarized['base3']

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = solarized['base03']

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = solarized['base03']

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = solarized['base3']

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = solarized['orange']

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = solarized['orange']

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = solarized['base3']

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = solarized['base02']

## Border used around UI elements in prompts.
## Type: String
c.colors.prompts.border = '1px solid ' + solarized['base3']

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = solarized['base3']

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = solarized['base01']

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = solarized['blue']

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = solarized['base1']

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = solarized['violet']

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = solarized['base1']

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = solarized['base03']

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = solarized['base1']

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = solarized['base01']

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = solarized['base3']

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = solarized['base02']

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = solarized['base1']

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = solarized['base03']

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = solarized['base1']

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = solarized['base02']

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = solarized['base1']

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = solarized['base01']

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = solarized['base3']

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = solarized['base1']

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = solarized['red']

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = solarized['base1']

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = solarized['base2']

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = solarized['base1']

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = solarized['base1']

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = solarized['yellow']

## Background color of the tab bar.
## Type: QtColor
# c.colors.tabs.bar.bg = '#555555'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = solarized['base03']

## Foreground color of unselected odd tabs.
## Type: QtColor
#c.colors.tabs.odd.fg = solarized['base1']
c.colors.tabs.odd.fg = 'white'

## Background color of unselected even tabs.
## Type: QtColor
#ORG
c.colors.tabs.even.bg = solarized['base002']
#c.colors.tabs.even.bg = solarized['base01']
#-->  c.colors.tabs.even.bg = solarized['red']

## Foreground color of unselected even tabs.
## Type: QtColor
#c.colors.tabs.even.fg = solarized['base1']
c.colors.tabs.even.fg = 'white'

## Background color of selected even tabs.
## Type: QtColor
#c.colors.tabs.selected.even.bg = solarized['violet']
c.colors.tabs.selected.even.bg = solarized['base002-bright']

## Foreground color of selected even tabs.
## Type: QtColor
#c.colors.tabs.selected.even.fg = solarized['base2']
c.colors.tabs.selected.even.fg = 'black'

## Background color of selected odd tabs.
## Type: QtColor
#c.colors.tabs.selected.odd.bg = solarized['violet']
c.colors.tabs.selected.odd.bg = solarized['base002-bright']

## Foreground color of selected odd tabs.
## Type: QtColor
#c.colors.tabs.selected.odd.fg = solarized['base2']
c.colors.tabs.selected.odd.fg = 'black'

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = solarized['red']

## Color gradient start for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.start = solarized['violet']

## Color gradient end for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.stop = solarized['orange']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.tabs.indicator.system = 'rgb'


## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'
