package org.dmfs.android.xmlmagic;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.RemoteViews;
import org.dmfs.android.xmlmagic.builder.AndroidBooleanObjectBuilder;
import org.dmfs.android.xmlmagic.builder.AndroidCharSequenceObjectBuilder;
import org.dmfs.android.xmlmagic.builder.AndroidStringObjectBuilder;
import org.dmfs.android.xmlmagic.builder.AndroidUriObjectBuilder;
import org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder;
import org.dmfs.android.xmlmagic.builder.BundleObjectBuilder;
import org.dmfs.android.xmlmagic.builder.EqualsObjectBuilder;
import org.dmfs.android.xmlmagic.builder.IntentObjectBuilder;
import org.dmfs.android.xmlmagic.builder.NotificationObjectBuilder;
import org.dmfs.android.xmlmagic.builder.PendingIntentObjectBuilder;
import org.dmfs.android.xmlmagic.builder.RemoteViewsObjectBuilder;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/Model.class */
public class Model {
    public static final QualifiedName ATTR_KEY = QualifiedName.get("key");
    public static final String NAMESPACE = "http://dmfs.org/ns/android-xml-magic";
    public static final ElementDescriptor<Boolean> AND = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "and"), new BooleanOperationObjectBuilder(BooleanOperationObjectBuilder.BooleanOperation.and));
    public static final ElementDescriptor<Boolean> BOOLEAN = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "boolean"), AndroidBooleanObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Bundle> BUNDLE = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "bundle"), BundleObjectBuilder.INSTANCE);
    public static final ElementDescriptor<CharSequence> CHAR_SEQUENCE = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "charsequence"), AndroidCharSequenceObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Boolean> EQUALS = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "equals"), new EqualsObjectBuilder());
    public static final ElementDescriptor<Intent> INTENT = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "intent"), IntentObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Notification> NOTIFICATION = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "notification"), NotificationObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Boolean> OR = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "or"), new BooleanOperationObjectBuilder(BooleanOperationObjectBuilder.BooleanOperation.or));
    public static final ElementDescriptor<PendingIntent> PENDING_INTENT = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "pending-intent"), PendingIntentObjectBuilder.INSTANCE);
    public static final ElementDescriptor<RemoteViews> REMOTE_VIEWS = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "remote-views"), RemoteViewsObjectBuilder.INSTANCE);
    public static final ElementDescriptor<String> STRING = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "string"), AndroidStringObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Uri> URI = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "uri"), AndroidUriObjectBuilder.INSTANCE);
    public static final ElementDescriptor<Boolean> XOR = ElementDescriptor.register(QualifiedName.get(NAMESPACE, "xor"), new BooleanOperationObjectBuilder(BooleanOperationObjectBuilder.BooleanOperation.xor));
}
