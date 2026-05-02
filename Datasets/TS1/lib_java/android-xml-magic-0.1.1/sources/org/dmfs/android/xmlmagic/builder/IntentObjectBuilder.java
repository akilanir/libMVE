package org.dmfs.android.xmlmagic.builder;

import android.annotation.TargetApi;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/IntentObjectBuilder.class */
public class IntentObjectBuilder extends BaseAndroidObjectBuilder<Intent> {
    public static final IntentObjectBuilder INSTANCE = new IntentObjectBuilder();
    private static final ElementDescriptor<String> ACTION = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "action"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> PACKAGE = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "package"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> CLASS = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "class"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<Uri> DATA = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "data"), AndroidUriObjectBuilder.INSTANCE);
    private static final ElementDescriptor<Bundle> EXTRAS = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "extras"), BundleObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> CONTENT_TYPE = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "content-type"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> CATEGORY = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "category"), AndroidStringObjectBuilder.INSTANCE);

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags.class */
    private enum Flags {
        activity_brought_to_front { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.1
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 4194304;
            }
        },
        activity_clear_task { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.2
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            @TargetApi(11)
            public int get() {
                return Build.VERSION.SDK_INT < 11 ? 0 : 32768;
            }
        },
        activity_clear_top { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.3
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 67108864;
            }
        },
        activity_clear_when_task_reset { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.4
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 524288;
            }
        },
        grant_read_uri_permission { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.5
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 1;
            }
        },
        grant_write_uri_permission { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.6
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 2;
            }
        },
        grant_persistable_uri_permission { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.7
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            @TargetApi(19)
            public int get() {
                return Build.VERSION.SDK_INT < 19 ? 0 : 64;
            }
        },
        grant_prefix_uri_permission { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.8
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            @TargetApi(21)
            public int get() {
                return 128;
            }
        },
        debug_log_resolution { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.9
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 8;
            }
        },
        from_background { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.10
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 4;
            }
        },
        activity_exclude_from_recents { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.11
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 8388608;
            }
        },
        activity_forward_result { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.12
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 33554432;
            }
        },
        activity_launched_from_history { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.13
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 1048576;
            }
        },
        activity_multiple_task { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.14
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 134217728;
            }
        },
        activity_new_document { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.15
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            @TargetApi(21)
            public int get() {
                return Build.VERSION.SDK_INT < 21 ? 0 : 524288;
            }
        },
        activity_new_task { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.16
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 268435456;
            }
        },
        activity_no_animation { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.17
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 65536;
            }
        },
        activity_no_history { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.18
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 1073741824;
            }
        },
        activity_no_user_action { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.19
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 262144;
            }
        },
        activity_previous_is_top { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.20
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 16777216;
            }
        },
        activity_reset_task_if_needed { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.21
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 2097152;
            }
        },
        activity_reorder_to_front { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.22
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 131072;
            }
        },
        activity_single_top { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.23
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 536870912;
            }
        },
        activity_task_on_home { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.24
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            @TargetApi(11)
            public int get() {
                return Build.VERSION.SDK_INT < 11 ? 0 : 16384;
            }
        },
        receiver_registered_only { // from class: org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags.25
            @Override // org.dmfs.android.xmlmagic.builder.IntentObjectBuilder.Flags
            public int get() {
                return 1073741824;
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

    public Intent get(ElementDescriptor<Intent> elementDescriptor, Intent intent, ParserContext parserContext) throws XmlObjectPullParserException {
        return new Intent();
    }

    public Intent update(ElementDescriptor<Intent> elementDescriptor, Intent intent, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        Flags flags;
        if (Model.NAMESPACE.equals(qualifiedName.namespace) && (flags = Flags.get(qualifiedName.name)) != null) {
            intent.setFlags(getBooleanAttr(qualifiedName, parserContext) ? intent.getFlags() | flags.get() : intent.getFlags() & (flags.get() ^ (-1)));
        }
        return intent;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> Intent update(ElementDescriptor<Intent> elementDescriptor, Intent intent, ElementDescriptor<T> elementDescriptor2, T t, ParserContext parserContext) throws XmlObjectPullParserException {
        if (intent == null) {
            intent = new Intent();
        }
        if (elementDescriptor2 == ACTION) {
            intent.setAction((String) t);
        } else if (elementDescriptor2 == PACKAGE) {
            intent.setPackage((String) t);
        } else if (elementDescriptor2 == CLASS) {
            intent.setClassName(intent.getPackage(), (String) t);
        } else if (elementDescriptor2 == DATA) {
            intent.setData((Uri) t);
        } else if (elementDescriptor2 == EXTRAS) {
            intent.putExtras((Bundle) t);
        } else if (elementDescriptor2 == CONTENT_TYPE) {
            intent.setType((String) t);
        } else if (elementDescriptor2 == CATEGORY) {
            intent.addCategory((String) t);
        }
        return intent;
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Intent>) elementDescriptor, (Intent) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Intent>) elementDescriptor, (Intent) obj, qualifiedName, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Intent>) elementDescriptor, (Intent) obj, parserContext);
    }
}
