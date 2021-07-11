# This example is contributed by Martin Enlund
#import os

from subprocess import call

try:
    from urllib import unquote
except ImportError:
    from urllib.parse import unquote

from gi import require_version
require_version('Nautilus', '3.0')
from gi.repository import GObject, Nautilus

class OpenTerminalExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_terminal(self, file_):
        filename = unquote(file_.get_uri()[7:])
        call('tabbed -c alacritty --working-directory "{0}" --embed &'.format(filename), shell=True)
        
    def menu_activate_cb(self, menu, file_):
        self._open_terminal(file_)
        
    def menu_background_activate_cb(self, menu, file_): 
        self._open_terminal(file_)
       
    def get_file_items(self, window, files):
        if len(files) != 1:
            return
        
        file_ = files[0]
        if not file_.is_directory() or file_.get_uri_scheme() != 'file':
            return
        
        item = Nautilus.MenuItem(name='NautilusPython::open_file_item',
                                 label='Open In Terminal' ,
                                 tip='Open Terminal In %s' % file_.get_name())
        item.connect('activate', self.menu_activate_cb, file_)
        return item,

    def get_background_items(self, window, file_):
        item = Nautilus.MenuItem(name='NautilusPython::open_bg_item',
                                 label='Open Terminal Here',
                                 tip='Open Terminal In %s' % file_.get_name())
        item.connect('activate', self.menu_background_activate_cb, file_)
        return item,
