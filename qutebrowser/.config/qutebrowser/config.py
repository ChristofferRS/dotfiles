import subprocess

c.url.searchengines={"DEFAULT" : "https://duckduckgo.com/?q={}",
                     "w"       : "https://en.wikipedia.org/w/index.php?search={}",
                     "aw"      : "https://wiki.archlinux.org/index.php?search={}",
                     "bri"     : "https://www.britannica.com/search?query={}",
                     "sch"     : "https://scholar.google.com/scholar?q={}",
                     "yt"      : "https://www.youtube.com/results?search_query={}"
                    }

config.load_autoconfig(False)
c.downloads.remove_finished=5000

c.window.title_format = '{current_url}'
config.bind(",v", 'hint links spawn mpv {hint-url}')
config.bind(",y", 'spawn yankdw {url}')
config.bind(",Y", 'hint links spawn yankdw {hint-url}')

config.bind('<z><l>', 'spawn --userscript qute-pass -d dmenu')
config.bind('<z><u><l>', 'spawn --userscript qute-pass -d dmenu--username-only')
config.bind('<z><p><l>', 'spawn --userscript qute-pass -d dmenu--password-only')
config.bind('<z><o><l>', 'spawn --userscript qute-pass -d dmenu--otp-only')

config.bind('<z><g>', 'spawn genpass "{url:host}"')

c.editor.command=['st', '-e', 'nvim', '{}']
#c.colors.webpage.darkmode.enabled=True

#def read_xresources(prefix):
#    props = {}
#    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
#    lines = x.stdout.decode().split('\n')
#    for line in filter(lambda l : l.startswith(prefix), lines):
#        prop, _, value = line.partition(':\t')
#        props[prop] = value
#    return props
#
#xresources = read_xresources('*')
#
#c.colors.statusbar.normal.bg = xresources["*.background"]
#c.colors.statusbar.command.bg = xresources["*.background"]
#c.colors.statusbar.command.fg = xresources["*.foreground"]
#c.colors.statusbar.normal.fg = xresources["*.foreground"]
#c.statusbar.show = "always"
#
#c.colors.tabs.even.bg = xresources["*.background"]
#c.colors.tabs.odd.bg = xresources["*.background"]
#c.colors.tabs.even.fg = xresources["*.foreground"]
#c.colors.tabs.odd.fg = xresources["*.foreground"]
#c.colors.tabs.selected.even.bg = xresources["*.color8"]
#c.colors.tabs.selected.odd.bg = xresources["*.color8"]
#c.colors.hints.bg = xresources["*.background"]
#c.colors.hints.fg = xresources["*.foreground"]
#
#c.colors.tabs.indicator.stop = xresources["*.color14"]
#c.colors.completion.odd.bg = xresources["*.background"]
#c.colors.completion.even.bg = xresources["*.background"]
#c.colors.completion.fg = xresources["*.foreground"]
#c.colors.completion.category.bg = xresources["*.background"]
#c.colors.completion.category.fg = xresources["*.foreground"]
#c.colors.completion.item.selected.bg = xresources["*.background"]
#c.colors.completion.item.selected.fg = xresources["*.foreground"]

# If not in light theme
#if xresources["*.background"] != "#ffffff":
#    # c.qt.args = ['blink-settings=darkMode=4']
#    # c.colors.webpage.prefers_color_scheme_dark = True
#    c.colors.webpage.darkmode.enabled = True
#    c.hints.border = "1px solid #FFFFFF"
