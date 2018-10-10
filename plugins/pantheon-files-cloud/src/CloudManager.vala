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

public class Marlin.Plugins.Cloud.Manager : Object {
    public signal void providers_changed ();
    public signal void accounts_changed ();
    CloudProviders.Collector collector = CloudProviders.Collector.dup_singleton ();

    public Manager () {
        collector.providers_changed.connect (() => {
            providers_changed ();

            foreach (var provider in collector.get_providers ()) {
                provider.accounts_changed.connect (() => {
                    accounts_changed ();
                    foreach (var account in provider.get_accounts ()) {
                        account.notify.connect (() => {
                            accounts_changed ();
                        });
                    }
                });
            }
        });
    }

    /**
     * @return an array with all accounts from all providers in one shot
     */
    public CloudProviders.Account[] get_accounts () {
        CloudProviders.Account[] accounts = {};

        foreach (var provider in collector.get_providers ()) {
            foreach (var account in provider.get_accounts ()) {
                accounts += account;
            }
        }

        return accounts;
    }
}
