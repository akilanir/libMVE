package org.dmfs.android.xmlmagic.builder;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.widget.RemoteViews;
import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.builder.IObjectBuilder;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder.class */
public class RemoteViewsObjectBuilder extends BaseAndroidObjectBuilder<RemoteViews> {
    public static final RemoteViewsObjectBuilder INSTANCE = new RemoteViewsObjectBuilder();
    private static final QualifiedName ATTR_LAYOUT = QualifiedName.get("layout");
    private static final QualifiedName ATTR_ID = QualifiedName.get("id");
    private static final QualifiedName ATTR_METHOD = QualifiedName.get("method");
    private static final IObjectBuilder<RemoteBinding> BUILDER = new BaseAndroidObjectBuilder<RemoteBinding>() { // from class: org.dmfs.android.xmlmagic.builder.RemoteViewsObjectBuilder.1
        public RemoteBinding get(ElementDescriptor<RemoteBinding> elementDescriptor, RemoteBinding remoteBinding, ParserContext parserContext) throws XmlObjectPullParserException {
            return new RemoteBinding();
        }

        public RemoteBinding update(ElementDescriptor<RemoteBinding> elementDescriptor, RemoteBinding remoteBinding, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (qualifiedName == RemoteViewsObjectBuilder.ATTR_ID) {
                remoteBinding.viewId = getIntegerAttr(qualifiedName, false, parserContext).intValue();
            } else if (qualifiedName == RemoteViewsObjectBuilder.ATTR_METHOD) {
                remoteBinding.methodName = str;
            }
            return remoteBinding;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public <V> RemoteBinding update(ElementDescriptor<RemoteBinding> elementDescriptor, RemoteBinding remoteBinding, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
            remoteBinding.descriptor = elementDescriptor2;
            remoteBinding.value = v;
            return remoteBinding;
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<RemoteBinding>) elementDescriptor, (RemoteBinding) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<RemoteBinding>) elementDescriptor, (RemoteBinding) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<RemoteBinding>) elementDescriptor, (RemoteBinding) obj, parserContext);
        }
    };
    private static final ElementDescriptor<RemoteBinding> REMOTE_ONCLICK = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "remote-onclick"), BUILDER);
    private static final ElementDescriptor<RemoteBinding> REMOTE_SET_TEXT = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "remote-set-text"), BUILDER);

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding.class */
    private static class RemoteBinding {
        ElementDescriptor<?> descriptor;
        int viewId;
        String methodName;
        Object value;

        private RemoteBinding() {
        }
    }

    public RemoteViews update(ElementDescriptor<RemoteViews> elementDescriptor, RemoteViews remoteViews, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return qualifiedName == ATTR_LAYOUT ? new RemoteViews(((AndroidParserContext) parserContext).getAppContext().getPackageName(), getIntegerAttr(qualifiedName, false, parserContext).intValue()) : remoteViews;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @TargetApi(11)
    public <V> RemoteViews update(ElementDescriptor<RemoteViews> elementDescriptor, RemoteViews remoteViews, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (elementDescriptor2.builder != BUILDER) {
            return remoteViews;
        }
        RemoteBinding remoteBinding = (RemoteBinding) v;
        if (elementDescriptor2 == REMOTE_ONCLICK) {
            if (remoteBinding.descriptor == Model.PENDING_INTENT) {
                remoteViews.setOnClickPendingIntent(remoteBinding.viewId, (PendingIntent) remoteBinding.value);
            } else if (Build.VERSION.SDK_INT > 11 && remoteBinding.descriptor == Model.INTENT) {
                remoteViews.setOnClickFillInIntent(remoteBinding.viewId, (Intent) remoteBinding.value);
            }
        } else if (elementDescriptor2 == REMOTE_SET_TEXT && (remoteBinding.value instanceof CharSequence)) {
            remoteViews.setTextViewText(remoteBinding.viewId, (CharSequence) remoteBinding.value);
        }
        return remoteViews;
    }

    @TargetApi(11)
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<RemoteViews>) elementDescriptor, (RemoteViews) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<RemoteViews>) elementDescriptor, (RemoteViews) obj, qualifiedName, str, parserContext);
    }
}
