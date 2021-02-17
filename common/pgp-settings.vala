/*
 * Seahorse
 *
 * Copyright (C) 2018 Niels De Graef
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, see <http://www.gnu.org/licenses/>.
 */

/* This schema is installed by libgcr */
public class Seahorse.PgpSettings : GLib.Settings {
    public bool ascii_armor {
        get { return get_boolean("ascii-armor"); }
        set { set_boolean("ascii-armor", value); }
    }

    public string default_key {
        owned get { return get_string("default-key"); }
        set { set_string("default-key", value); }
    }

    public bool encrypt_to_self {
        get { return get_boolean("encrypt-to-self"); }
        set { set_boolean("encrypt-to-self", value); }
    }

    /**
     * Returns a list of keyservers. Each entry is of either the format "uri"
     * or "uri name", where `name` is a display name of the given keyserver.
     */
    public string[] keyservers {
        owned get { return get_strv("keyservers"); }
        set { set_strv("keyservers", value); }
    }

    public string last_signer {
        owned get { return get_string("last-signer"); }
        set { set_string("last-signer", value); }
    }

    public string sort_recipients_by {
        owned get { return get_string("sort-recipients-by"); }
        set { set_string("sort-recipients-by", value); }
    }

	public PgpSettings () {
        GLib.Object (schema_id: "org.gnome.crypto.pgp");
	}

	private static PgpSettings? _instance = null;
	public static PgpSettings instance() {
		if (_instance == null)
			_instance = new PgpSettings();
		return _instance;
	}

    [CCode (array_null_terminated = true, array_length = false)]
    public string[] get_uris() {
        // The values are 'uri name', remove the name part
        string[] uris = {};
        foreach (string server in this.keyservers)
            uris += server.strip().split(" ", 2)[0];

        return uris;
    }

    [CCode (array_null_terminated = true, array_length = false)]
    public string[] get_names() {
        string[] names = {};
        foreach (string server in this.keyservers) {
            // The values are 'uri' or 'uri name', remove the name part if there
            string[] split = server._strip().split(" ", 2);
            names += (split.length == 1)? split[0] : split[1];
        }

        return names;
    }
}
