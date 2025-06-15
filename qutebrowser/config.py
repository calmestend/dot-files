import os
os.environ["QT_QUICK_BACKEND"] = "software"

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

config.load_autoconfig()

# Tabs
c.tabs.position = "top"
c.tabs.title.alignment = "center"
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 10, 'right': 10}

# Privacy
config.set("content.geolocation", False)
config.set("content.canvas_reading", False)
c.content.blocking.enabled = True

# Zenbones Theme
base00 = "#383838"
base01 = "#404040"
base02 = "#606060"
base03 = "#6f6f6f"
base04 = "#808080"
base05 = "#dcdccc"
base06 = "#c0c0c0"
base07 = "#ffffff"
base08 = "#dca3a3"
base09 = "#dfaf8f"
base0A = "#e0cf9f"
base0B = "#5f7f5f"
base0C = "#93e0e3"
base0D = "#7cb8bb"
base0E = "#dc8cc3"
base0F = "#000000"

c.colors.completion.fg = base05
c.colors.completion.odd.bg = base00
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0D
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base05
c.colors.completion.item.selected.bg = base02
c.colors.completion.item.selected.border.top = base02
c.colors.completion.item.selected.border.bottom = base02
c.colors.completion.item.selected.match.fg = base05
c.colors.completion.match.fg = base09
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.contextmenu.disabled.bg = base01
c.colors.contextmenu.disabled.fg = base04
c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg =  base05
c.colors.contextmenu.selected.bg = base02
c.colors.contextmenu.selected.fg = base05
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base02
c.colors.prompts.selected.fg = base05
c.colors.statusbar.normal.fg = base05
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base0C
c.colors.statusbar.insert.bg = base00
c.colors.statusbar.passthrough.fg = base0A
c.colors.statusbar.passthrough.bg = base00
c.colors.statusbar.private.fg = base0E
c.colors.statusbar.private.bg = base00
c.colors.statusbar.command.fg = base04
c.colors.statusbar.command.bg = base01
c.colors.statusbar.command.private.fg = base0E
c.colors.statusbar.command.private.bg = base01
c.colors.statusbar.caret.fg = base0D
c.colors.statusbar.caret.bg = base00
c.colors.statusbar.caret.selection.fg = base0D
c.colors.statusbar.caret.selection.bg = base00
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base09
c.colors.statusbar.url.success.http.fg = base0B
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base0B
c.colors.tabs.pinned.even.fg = base00
c.colors.tabs.pinned.odd.bg = base0B
c.colors.tabs.pinned.odd.fg = base00
c.colors.tabs.pinned.selected.even.bg = base02
c.colors.tabs.pinned.selected.even.fg = base05
c.colors.tabs.pinned.selected.odd.bg = base02
c.colors.tabs.pinned.selected.odd.fg = base05
c.colors.tabs.selected.odd.fg = base05
c.colors.tabs.selected.odd.bg = base02
c.colors.tabs.selected.even.fg = base05
c.colors.tabs.selected.even.bg = base02
c.colors.webpage.bg = base00

