package org.dmfs.android.xmlmagic.builder;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder.class */
public class PendingIntentObjectBuilder extends BaseAndroidObjectBuilder<PendingIntent> {
    public static final PendingIntentObjectBuilder INSTANCE = new PendingIntentObjectBuilder();
    private static final QualifiedName ATTR_INTENT_TYPE = QualifiedName.get("intent-type");
    private static final QualifiedName ATTR_REQUEST_CODE = QualifiedName.get("request-code");

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags.class */
    private enum Flags {
        flag_no_create { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags.1
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags
            public int get() {
                return 536870912;
            }
        },
        flag_one_shot { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags.2
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags
            public int get() {
                return 1073741824;
            }
        },
        flag_cancel_current { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags.3
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags
            public int get() {
                return 268435456;
            }
        },
        flag_update_current { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags.4
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.Flags
            public int get() {
                return 134217728;
            }
        };

        public abstract int get();

        public static Flags get(String str) {
            try {
                return valueOf(str.replace('-', '_'));
            } catch (IllegalArgumentException e) {
                return null;
            }
        }
    }

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType.class */
    private enum IntentType {
        activity { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType.1
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType
            public PendingIntent getPendingIntent(Context context, PendingIntentDescriptor pendingIntentDescriptor) {
                return PendingIntent.getActivity(context, pendingIntentDescriptor.requestCode, pendingIntentDescriptor.intent, pendingIntentDescriptor.flags);
            }
        },
        broadcast { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType.2
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType
            public PendingIntent getPendingIntent(Context context, PendingIntentDescriptor pendingIntentDescriptor) {
                return PendingIntent.getBroadcast(context, pendingIntentDescriptor.requestCode, pendingIntentDescriptor.intent, pendingIntentDescriptor.flags);
            }
        },
        service { // from class: org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType.3
            @Override // org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder.IntentType
            public PendingIntent getPendingIntent(Context context, PendingIntentDescriptor pendingIntentDescriptor) {
                return PendingIntent.getService(context, pendingIntentDescriptor.requestCode, pendingIntentDescriptor.intent, pendingIntentDescriptor.flags);
            }
        };

        public abstract PendingIntent getPendingIntent(Context context, PendingIntentDescriptor pendingIntentDescriptor);
    }

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor.class */
    private static class PendingIntentDescriptor {
        int requestCode;
        int flags;
        Intent intent;
        IntentType intentType;

        private PendingIntentDescriptor() {
            this.requestCode = 1;
            this.flags = 0;
            this.intentType = IntentType.activity;
        }
    }

    private PendingIntentDescriptor getDescriptor(ParserContext parserContext) {
        return (PendingIntentDescriptor) parserContext.getState();
    }

    public PendingIntent get(ElementDescriptor<PendingIntent> elementDescriptor, PendingIntent pendingIntent, ParserContext parserContext) throws XmlObjectPullParserException {
        if (!(parserContext instanceof AndroidParserContext)) {
            throw new IllegalArgumentException("ParserContext must be an AndroidParserContext to build a PendingIntent");
        }
        parserContext.setState(new PendingIntentDescriptor());
        return null;
    }

    public PendingIntent update(ElementDescriptor<PendingIntent> elementDescriptor, PendingIntent pendingIntent, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        Flags flags;
        if (ATTR_REQUEST_CODE == qualifiedName) {
            getDescriptor(parserContext).requestCode = getIntegerAttr(qualifiedName, true, parserContext).intValue();
        } else if (ATTR_INTENT_TYPE == qualifiedName) {
            getDescriptor(parserContext).intentType = IntentType.valueOf(str);
        } else if (Model.NAMESPACE.equals(qualifiedName.namespace) && (flags = Flags.get(qualifiedName.name)) != null) {
            if (getBooleanAttr(qualifiedName, parserContext)) {
                getDescriptor(parserContext).flags |= flags.get();
            } else {
                getDescriptor(parserContext).flags &= flags.get() ^ (-1);
            }
        }
        return pendingIntent;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> PendingIntent update(ElementDescriptor<PendingIntent> elementDescriptor, PendingIntent pendingIntent, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (elementDescriptor2 == Model.INTENT) {
            getDescriptor(parserContext).intent = (Intent) v;
        }
        return pendingIntent;
    }

    public PendingIntent finish(ElementDescriptor<PendingIntent> elementDescriptor, PendingIntent pendingIntent, ParserContext parserContext) throws XmlObjectPullParserException {
        return getDescriptor(parserContext).intentType.getPendingIntent(((AndroidParserContext) parserContext).getAppContext(), getDescriptor(parserContext));
    }

    public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return finish((ElementDescriptor<PendingIntent>) elementDescriptor, (PendingIntent) obj, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<PendingIntent>) elementDescriptor, (PendingIntent) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<PendingIntent>) elementDescriptor, (PendingIntent) obj, qualifiedName, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<PendingIntent>) elementDescriptor, (PendingIntent) obj, parserContext);
    }
}
