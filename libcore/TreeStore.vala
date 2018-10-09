/***
    Copyright (c) 2018 elementary LLC <https://elementary.io>

    Pantheon Files is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 2 of the
    License, or (at your option) any later version.

    Pantheon Files is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program.  If not, see <http://www.gnu.org/licenses/>.

    Author(s):  Fernando da Silva Sousa <wild.nando@gmail.com>
***/

public class Marlin.TreeStore : Gtk.TreeStore {
    public enum Column {
        NAME,
        URI,
        DRIVE,
        VOLUME,
        MOUNT,
        ROW_TYPE,
        ICON,
        INDEX,
        CAN_EJECT,
        NO_EJECT,
        BOOKMARK,
        IS_CATEGORY,
        NOT_CATEGORY,
        TOOLTIP,
        ACTION_ICON,
        SHOW_SPINNER,
        SHOW_EJECT,
        SPINNER_PULSE,
        FREE_SPACE,
        DISK_SIZE,
        PLUGIN_CALLBACK,
        MENU_MODEL
    }

    public TreeStore () {
        set_column_types ({
            typeof (string),            /* name */
            typeof (string),            /* uri */
            typeof (Drive),
            typeof (Volume),
            typeof (Mount),
            typeof (int),               /* row type*/
            typeof (Icon),              /* Primary icon */
            typeof (uint),              /* index*/
            typeof (bool),              /* can eject */
            typeof (bool),              /* cannot eject */
            typeof (bool),              /* is bookmark */
            typeof (bool),              /* is category */
            typeof (bool),              /* is not category */
            typeof (string),            /* tool tip */
            typeof (Icon),              /* Action icon (e.g. eject button) */
            typeof (bool),              /* Show spinner (not eject button) */
            typeof (bool),              /* Show eject button (not spinner) */
            typeof (uint),              /* Spinner pulse */
            typeof (uint64),            /* Free space */
            typeof (uint64),            /* For disks, total size */
            typeof (Marlin.PluginCallbackFunc),
            typeof (MenuModel)
        });
    }

    public void add_place (TreeItem item, int index, Gtk.TreeIter? parent) {
        Gtk.TreeIter iter;
        append (out iter, parent);

        @set (
            iter,
            Column.ROW_TYPE, item.place_type,
            Column.URI, item.uri,
            Column.DRIVE, item.drive,
            Column.VOLUME, item.volume,
            Column.MOUNT, item.mount,
            Column.NAME, item.name,
            Column.ICON, item.icon,
            Column.INDEX, index,
            Column.CAN_EJECT, item.can_eject,
            Column.NO_EJECT, !item.can_eject,
            Column.BOOKMARK, item.is_bookmark (),
            Column.IS_CATEGORY, item.is_category (),
            Column.NOT_CATEGORY, !item.is_category (),
            Column.TOOLTIP, item.tooltip,
            Column.ACTION_ICON, item.action_icon,
            Column.SHOW_SPINNER, item.show_spinner,
            Column.SHOW_EJECT, item.can_eject,
            Column.SPINNER_PULSE, item.spinner_pulse,
            Column.FREE_SPACE, item.free_space,
            Column.DISK_SIZE, item.disk_size,
            Column.MENU_MODEL, item.menu_model
        );
    }
}