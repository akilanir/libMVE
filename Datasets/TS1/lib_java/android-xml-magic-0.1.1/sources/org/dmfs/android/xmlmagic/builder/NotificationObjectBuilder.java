package org.dmfs.android.xmlmagic.builder;

import android.app.Notification;
import android.app.PendingIntent;
import android.graphics.Color;
import android.net.Uri;
import android.support.v4.app.NotificationCompat;
import android.widget.RemoteViews;
import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/NotificationObjectBuilder.class */
public class NotificationObjectBuilder extends BaseAndroidObjectBuilder<Notification> {
    public static final NotificationObjectBuilder INSTANCE = new NotificationObjectBuilder();
    private static final QualifiedName ATTR_ICON = QualifiedName.get("icon");
    private static final QualifiedName ATTR_TICKER = QualifiedName.get("ticker");
    private static final QualifiedName ATTR_TITLE = QualifiedName.get("title");
    private static final QualifiedName ATTR_SUB_TEXT = QualifiedName.get("sub-text");
    private static final QualifiedName ATTR_ONGOING = QualifiedName.get("ongoing");
    private static final QualifiedName ATTR_AUTO_CANCEL = QualifiedName.get("auto-cancel");
    private static final QualifiedName ATTR_CONTENT = QualifiedName.get("content");
    private static final QualifiedName ATTR_NUMBER = QualifiedName.get("number");
    private static final QualifiedName ATTR_ALERT_ONLY_ONCE = QualifiedName.get("alert-only-once");
    private static final QualifiedName ATTR_SHOW_WHEN = QualifiedName.get("show-when");
    private static final QualifiedName ATTR_SORT_KEY = QualifiedName.get("sort-key");
    private static final QualifiedName ATTR_COLOR = QualifiedName.get("color");
    private static final QualifiedName ATTR_ON_MS = QualifiedName.get("on-ms");
    private static final QualifiedName ATTR_OFF_MS = QualifiedName.get("off-ms");
    private static final QualifiedName ATTR_SOUND = QualifiedName.get("sound");
    private static final QualifiedName ATTR_MAX = QualifiedName.get("max");
    private static final QualifiedName ATTR_PROGRESS = QualifiedName.get("progress");
    private static final QualifiedName ATTR_VISIBLE = QualifiedName.get("visible");
    private static final QualifiedName ATTR_INDETERMINANTE = QualifiedName.get("indeterminante");
    private static final QualifiedName ATTR_SMALL_ICON = QualifiedName.get("small-icon");
    private static final ElementDescriptor<NotificationCompat.Action> ADD_ACTION = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "add-action"), new BaseAndroidObjectBuilder<NotificationCompat.Action>() { // from class: org.dmfs.android.xmlmagic.builder.NotificationObjectBuilder.1
        public NotificationCompat.Action get(ElementDescriptor<NotificationCompat.Action> elementDescriptor, NotificationCompat.Action action, ParserContext parserContext) throws XmlObjectPullParserException {
            if (!(parserContext instanceof AndroidParserContext)) {
                throw new IllegalArgumentException("ParserContext must be an AndroidParserContext to build a Notification");
            }
            parserContext.setState(new Action());
            return null;
        }

        public NotificationCompat.Action update(ElementDescriptor<NotificationCompat.Action> elementDescriptor, NotificationCompat.Action action, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (NotificationObjectBuilder.ATTR_ICON == qualifiedName) {
                ((Action) parserContext.getState()).icon = getIntegerAttr(qualifiedName, false, parserContext).intValue();
            } else if (NotificationObjectBuilder.ATTR_TITLE == qualifiedName) {
                ((Action) parserContext.getState()).title = getCharSequenceAttr(qualifiedName, str, parserContext);
            }
            return action;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public <V> NotificationCompat.Action update(ElementDescriptor<NotificationCompat.Action> elementDescriptor, NotificationCompat.Action action, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
            if (elementDescriptor2 == Model.PENDING_INTENT) {
                ((Action) parserContext.getState()).intent = (PendingIntent) v;
            }
            return action;
        }

        public NotificationCompat.Action finish(ElementDescriptor<NotificationCompat.Action> elementDescriptor, NotificationCompat.Action action, ParserContext parserContext) throws XmlObjectPullParserException {
            Action action2 = (Action) parserContext.getState();
            if (action2.intent == null) {
                return null;
            }
            return new NotificationCompat.Action(action2.icon, action2.title, action2.intent);
        }

        public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return finish((ElementDescriptor<NotificationCompat.Action>) elementDescriptor, (NotificationCompat.Action) obj, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<NotificationCompat.Action>) elementDescriptor, (NotificationCompat.Action) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<NotificationCompat.Action>) elementDescriptor, (NotificationCompat.Action) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<NotificationCompat.Action>) elementDescriptor, (NotificationCompat.Action) obj, parserContext);
        }
    });
    private static final ElementDescriptor<PendingIntent> CONTENT_ACTION = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "content-intent"), PendingIntentObjectBuilder.INSTANCE);
    private static final ElementDescriptor<PendingIntent> DELETE_ACTION = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "delete-intent"), PendingIntentObjectBuilder.INSTANCE);
    private static final ElementDescriptor<Lights> LIGHTS = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "lights"), new BaseAndroidObjectBuilder<Lights>() { // from class: org.dmfs.android.xmlmagic.builder.NotificationObjectBuilder.2
        public Lights get(ElementDescriptor<Lights> elementDescriptor, Lights lights, ParserContext parserContext) throws XmlObjectPullParserException {
            if (lights == null) {
                return new Lights();
            }
            lights.color = -16711936;
            lights.off = 500;
            lights.on = 500;
            return lights;
        }

        public Lights update(ElementDescriptor<Lights> elementDescriptor, Lights lights, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (qualifiedName == NotificationObjectBuilder.ATTR_COLOR) {
                lights.color = Color.parseColor(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
            } else if (qualifiedName == NotificationObjectBuilder.ATTR_ON_MS) {
                lights.on = getIntegerAttr(qualifiedName, true, parserContext).intValue();
            } else if (qualifiedName == NotificationObjectBuilder.ATTR_OFF_MS) {
                lights.off = getIntegerAttr(qualifiedName, true, parserContext).intValue();
            }
            return lights;
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<Lights>) elementDescriptor, (Lights) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<Lights>) elementDescriptor, (Lights) obj, parserContext);
        }
    });
    private static final ElementDescriptor<Progress> PROGRESS = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "progress"), new BaseAndroidObjectBuilder<Progress>() { // from class: org.dmfs.android.xmlmagic.builder.NotificationObjectBuilder.3
        public Progress get(ElementDescriptor<Progress> elementDescriptor, Progress progress, ParserContext parserContext) throws XmlObjectPullParserException {
            if (progress == null) {
                return new Progress();
            }
            progress.max = 100;
            progress.progress = 0;
            progress.visible = true;
            return progress;
        }

        public Progress update(ElementDescriptor<Progress> elementDescriptor, Progress progress, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (qualifiedName == NotificationObjectBuilder.ATTR_MAX) {
                progress.max = getIntegerAttr(qualifiedName, true, parserContext).intValue();
            } else if (qualifiedName == NotificationObjectBuilder.ATTR_PROGRESS) {
                progress.progress = getIntegerAttr(qualifiedName, true, parserContext).intValue();
            } else if (qualifiedName == NotificationObjectBuilder.ATTR_VISIBLE) {
                progress.visible = getBooleanAttr(qualifiedName, parserContext);
            } else if (qualifiedName == NotificationObjectBuilder.ATTR_INDETERMINANTE) {
                progress.indeterminante = getBooleanAttr(qualifiedName, parserContext);
            }
            return progress;
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<Progress>) elementDescriptor, (Progress) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<Progress>) elementDescriptor, (Progress) obj, parserContext);
        }
    });

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action.class */
    private static class Action {
        int icon;
        CharSequence title;
        PendingIntent intent;

        private Action() {
        }
    }

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights.class */
    private static class Lights {
        int color;
        int on;
        int off;

        private Lights() {
            this.color = -16711936;
            this.on = 500;
            this.off = 500;
        }
    }

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress.class */
    private static class Progress {
        int max;
        int progress;
        boolean visible;
        boolean indeterminante;

        private Progress() {
            this.max = 100;
            this.progress = 0;
            this.visible = true;
            this.indeterminante = false;
        }
    }

    private NotificationCompat.Builder getBuilder(ParserContext parserContext) {
        NotificationCompat.Builder builder = (NotificationCompat.Builder) parserContext.getState();
        if (builder == null) {
            builder = new NotificationCompat.Builder(((AndroidParserContext) parserContext).getAppContext());
            parserContext.setState(builder);
        }
        return builder;
    }

    public Notification get(ElementDescriptor<Notification> elementDescriptor, Notification notification, ParserContext parserContext) throws XmlObjectPullParserException {
        if (!(parserContext instanceof AndroidParserContext)) {
            throw new IllegalArgumentException("ParserContext must be an AndroidParserContext to build a Notification");
        }
        parserContext.setState(new NotificationCompat.Builder(((AndroidParserContext) parserContext).getAppContext()));
        return null;
    }

    public Notification update(ElementDescriptor<Notification> elementDescriptor, Notification notification, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (qualifiedName == ATTR_TICKER) {
            getBuilder(parserContext).setTicker(getCharSequenceAttr(qualifiedName, str, parserContext));
        } else if (qualifiedName == ATTR_TITLE) {
            getBuilder(parserContext).setContentTitle(getCharSequenceAttr(qualifiedName, str, parserContext));
        } else if (qualifiedName == ATTR_CONTENT) {
            getBuilder(parserContext).setContentText(getCharSequenceAttr(qualifiedName, str, parserContext));
        } else if (qualifiedName == ATTR_SUB_TEXT) {
            getBuilder(parserContext).setSubText(getCharSequenceAttr(qualifiedName, str, parserContext));
        } else if (qualifiedName == ATTR_SMALL_ICON) {
            getBuilder(parserContext).setSmallIcon(getIntegerAttr(qualifiedName, false, parserContext).intValue());
        } else if (qualifiedName == ATTR_ONGOING) {
            getBuilder(parserContext).setOngoing(getBooleanAttr(qualifiedName, parserContext));
        } else if (qualifiedName == ATTR_AUTO_CANCEL) {
            getBuilder(parserContext).setAutoCancel(getBooleanAttr(qualifiedName, parserContext));
        } else if (qualifiedName == ATTR_SHOW_WHEN) {
            getBuilder(parserContext).setShowWhen(getBooleanAttr(qualifiedName, parserContext));
        } else if (qualifiedName == ATTR_SORT_KEY) {
            getBuilder(parserContext).setSortKey(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
        } else if (qualifiedName == ATTR_NUMBER) {
            getBuilder(parserContext).setNumber(getIntegerAttr(qualifiedName, true, parserContext).intValue());
        } else if (qualifiedName == ATTR_ALERT_ONLY_ONCE) {
            getBuilder(parserContext).setOnlyAlertOnce(getBooleanAttr(qualifiedName, parserContext));
        } else if (qualifiedName == ATTR_SOUND) {
            getBuilder(parserContext).setSound(Uri.parse(getCharSequenceAttr(qualifiedName, str, parserContext).toString()));
        }
        return notification;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Notification update(ElementDescriptor<Notification> elementDescriptor, Notification notification, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (v == 0) {
            return notification;
        }
        if (elementDescriptor2 == ADD_ACTION) {
            getBuilder(parserContext).addAction((NotificationCompat.Action) v);
        } else if (elementDescriptor2 == CONTENT_ACTION) {
            getBuilder(parserContext).setContentIntent((PendingIntent) v);
        } else if (elementDescriptor2 == DELETE_ACTION) {
            getBuilder(parserContext).setDeleteIntent((PendingIntent) v);
        } else if (elementDescriptor2 == Model.REMOTE_VIEWS) {
            getBuilder(parserContext).setContent((RemoteViews) v);
        } else if (elementDescriptor2 == LIGHTS) {
            Lights lights = (Lights) v;
            getBuilder(parserContext).setLights(lights.color, lights.on, lights.off);
        } else if (elementDescriptor2 == PROGRESS) {
            Progress progress = (Progress) v;
            if (progress.visible) {
                getBuilder(parserContext).setProgress(progress.max, progress.progress, progress.indeterminante);
            }
        }
        return notification;
    }

    public Notification finish(ElementDescriptor<Notification> elementDescriptor, Notification notification, ParserContext parserContext) throws XmlObjectPullParserException {
        return getBuilder(parserContext).build();
    }

    public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return finish((ElementDescriptor<Notification>) elementDescriptor, (Notification) obj, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Notification>) elementDescriptor, (Notification) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Notification>) elementDescriptor, (Notification) obj, qualifiedName, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Notification>) elementDescriptor, (Notification) obj, parserContext);
    }
}
