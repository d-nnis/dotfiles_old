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
