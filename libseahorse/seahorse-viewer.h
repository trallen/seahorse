/*
 * Seahorse
 *
 * Copyright (C) 2008 Stefan Walter
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
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 */

#ifndef __SEAHORSE_VIEWER_H__
#define __SEAHORSE_VIEWER_H__

#include <glib-object.h>

#include "seahorse-object.h"
#include "seahorse-view.h"
#include "seahorse-widget.h"

#define SEAHORSE_TYPE_VIEWER               (seahorse_viewer_get_type ())
#define SEAHORSE_VIEWER(obj)               (G_TYPE_CHECK_INSTANCE_CAST ((obj), SEAHORSE_TYPE_VIEWER, SeahorseViewer))
#define SEAHORSE_VIEWER_CLASS(klass)       (G_TYPE_CHECK_CLASS_CAST ((klass), SEAHORSE_TYPE_VIEWER, SeahorseViewerClass))
#define SEAHORSE_IS_VIEWER(obj)            (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SEAHORSE_TYPE_VIEWER))
#define SEAHORSE_IS_VIEWER_CLASS(klass)    (G_TYPE_CHECK_CLASS_TYPE ((klass), SEAHORSE_TYPE_VIEWER))
#define SEAHORSE_VIEWER_GET_CLASS(obj)     (G_TYPE_INSTANCE_GET_CLASS ((obj), SEAHORSE_TYPE_VIEWER, SeahorseViewerClass))

typedef struct _SeahorseViewer SeahorseViewer;
typedef struct _SeahorseViewerClass SeahorseViewerClass;
typedef struct _SeahorseViewerPrivate SeahorseViewerPrivate;

struct _SeahorseViewer {
	SeahorseWidget parent;
};

struct _SeahorseViewerClass {
	SeahorseWidgetClass parent;

	/* virtual -------------------------------------------------------- */

	GList *          (*get_selected_objects)          (SeahorseViewer *self);

	void             (*set_selected_objects)          (SeahorseViewer *self,
	                                                   GList *objects);

	GObject *        (*get_selected_object_and_uid)   (SeahorseViewer* self,
	                                                   guint *uid);

	GObject *        (*get_selected)                  (SeahorseViewer* self);

	void             (*set_selected)                  (SeahorseViewer* self,
	                                                   GObject* value);

	/* signals --------------------------------------------------------- */

	void             (*signal)                        (SeahorseViewer *viewer);
};

GType               seahorse_viewer_get_type                        (void);

void                seahorse_viewer_ensure_updated                  (SeahorseViewer* self);

void                seahorse_viewer_include_actions                 (SeahorseViewer* self,
                                                                     GtkActionGroup* actions);

GList*              seahorse_viewer_get_selected_objects            (SeahorseViewer* self);

void                seahorse_viewer_set_selected_objects            (SeahorseViewer* self,
                                                                     GList* objects);

GObject *           seahorse_viewer_get_selected_object_and_uid     (SeahorseViewer *self,
                                                                     guint *uid);

void                seahorse_viewer_show_context_menu               (SeahorseViewer* self,
                                                                     guint button,
                                                                     guint time);

void                seahorse_viewer_show_properties                 (SeahorseViewer* self,
                                                                     GObject* obj);

void                seahorse_viewer_set_status                      (SeahorseViewer* self,
                                                                     const char* text);

void                seahorse_viewer_set_numbered_status             (SeahorseViewer* self,
                                                                     const char* text,
                                                                     gint num);

GObject *           seahorse_viewer_get_selected                    (SeahorseViewer *self);

void                seahorse_viewer_set_selected                    (SeahorseViewer *self,
                                                                     GObject *value);

GtkWindow*          seahorse_viewer_get_window                      (SeahorseViewer* self);

void                seahorse_viewer_register_ui                     (SeahorseViewer *self,
                                                                     SeahorsePredicate *pred,
                                                                     const gchar *uidef,
                                                                     GtkActionGroup *actions);

void                seahorse_viewer_register_commands               (SeahorseViewer *self,
                                                                     SeahorsePredicate *pred,
                                                                     SeahorseCommands *commands);

#endif /* __SEAHORSE_VIEWER_H__ */