/*
 * Seahorse
 *
 * Copyright (C) 2004,2005 Stefan Walter
 * Copyright (C) 2011 Collabora Ltd.
 * Copyright (C) 2013 Stef Walter
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation; either version 2 of the licence or (at
 * your option) any later version.
 *
 * See the included COPYING file for more information.
 */

namespace Seahorse {

public interface Place : Gcr.Collection {
	public abstract string label { owned get; }
	public abstract string description { owned get; }
	public abstract string uri { owned get; }
	public abstract GLib.Icon icon { owned get; }
	public abstract Gtk.ActionGroup actions { owned get; }

	public abstract async bool load(GLib.Cancellable? cancellable) throws GLib.Error;
}

}
