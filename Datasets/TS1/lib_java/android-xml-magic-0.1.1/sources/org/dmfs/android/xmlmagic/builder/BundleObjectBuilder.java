package org.dmfs.android.xmlmagic.builder;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.builder.AbstractObjectBuilder;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/BundleObjectBuilder.class */
public class BundleObjectBuilder extends AbstractObjectBuilder<Bundle> {
    public static final BundleObjectBuilder INSTANCE = new BundleObjectBuilder();
    public static final ElementDescriptor<ValueHolder> VALUE = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "bundle-value"), new BaseAndroidObjectBuilder<ValueHolder>() { // from class: org.dmfs.android.xmlmagic.builder.BundleObjectBuilder.1
        public ValueHolder get(ElementDescriptor<ValueHolder> elementDescriptor, ValueHolder valueHolder, ParserContext parserContext) throws XmlObjectPullParserException {
            if (valueHolder == null) {
                return new ValueHolder();
            }
            valueHolder.key = null;
            valueHolder.value = null;
            return valueHolder;
        }

        public ValueHolder update(ElementDescriptor<ValueHolder> elementDescriptor, ValueHolder valueHolder, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (qualifiedName == Model.ATTR_KEY) {
                valueHolder.key = str;
            }
            return valueHolder;
        }

        public <V> ValueHolder update(ElementDescriptor<ValueHolder> elementDescriptor, ValueHolder valueHolder, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
            if (valueHolder.value != null) {
                throw new IllegalStateException("'bundle-value' can not have more than one child element");
            }
            valueHolder.value = v;
            return valueHolder;
        }

        public ValueHolder update(ElementDescriptor<ValueHolder> elementDescriptor, ValueHolder valueHolder, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (valueHolder.value != null) {
                throw new IllegalStateException("'bundle-value' can not have more than one child element");
            }
            valueHolder.value = format(str, parserContext);
            return valueHolder;
        }

        public ValueHolder finish(ElementDescriptor<ValueHolder> elementDescriptor, ValueHolder valueHolder, ParserContext parserContext) throws XmlObjectPullParserException {
            if (valueHolder.key == null) {
                throw new IllegalArgumentException("'bundle-value' must have a key");
            }
            return valueHolder;
        }

        public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return finish((ElementDescriptor<ValueHolder>) elementDescriptor, (ValueHolder) obj, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<ValueHolder>) elementDescriptor, (ValueHolder) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<ValueHolder>) elementDescriptor, (ValueHolder) obj, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<ValueHolder>) elementDescriptor, (ValueHolder) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<ValueHolder>) elementDescriptor, (ValueHolder) obj, parserContext);
        }
    });

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder.class */
    private static class ValueHolder {
        private String key;
        private Object value;

        private ValueHolder() {
        }
    }

    public Bundle get(ElementDescriptor<Bundle> elementDescriptor, Bundle bundle, ParserContext parserContext) throws XmlObjectPullParserException {
        if (bundle == null) {
            return new Bundle();
        }
        bundle.clear();
        return bundle;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Bundle update(ElementDescriptor<Bundle> elementDescriptor, Bundle bundle, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (v instanceof ValueHolder) {
            ValueHolder valueHolder = (ValueHolder) v;
            if (valueHolder.value instanceof String) {
                bundle.putString(valueHolder.key, (String) valueHolder.value);
            }
            if (valueHolder.value instanceof CharSequence) {
                bundle.putCharSequence(valueHolder.key, (CharSequence) valueHolder.value);
            } else if (valueHolder.value instanceof Integer) {
                bundle.putInt(valueHolder.key, ((Integer) valueHolder.value).intValue());
            } else if (valueHolder.value instanceof Boolean) {
                bundle.putBoolean(valueHolder.key, ((Boolean) valueHolder.value).booleanValue());
            } else if (valueHolder.value instanceof Bundle) {
                bundle.putBundle(valueHolder.key, (Bundle) valueHolder.value);
            } else if (valueHolder.value instanceof Parcelable) {
                bundle.putParcelable(valueHolder.key, (Parcelable) valueHolder.value);
            } else if (valueHolder.value instanceof String[]) {
                bundle.putStringArray(valueHolder.key, (String[]) valueHolder.value);
            }
            if (valueHolder.value instanceof CharSequence[]) {
                bundle.putCharSequenceArray(valueHolder.key, (CharSequence[]) valueHolder.value);
            } else if (valueHolder.value instanceof int[]) {
                bundle.putIntArray(valueHolder.key, (int[]) valueHolder.value);
            } else if (valueHolder.value instanceof boolean[]) {
                bundle.putBooleanArray(valueHolder.key, (boolean[]) valueHolder.value);
            } else if (valueHolder.value instanceof Parcelable[]) {
                bundle.putParcelableArray(valueHolder.key, (Parcelable[]) valueHolder.value);
            } else if (valueHolder.value instanceof ArrayList) {
            }
            parserContext.recycle(elementDescriptor2, v);
        }
        return bundle;
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Bundle>) elementDescriptor, (Bundle) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Bundle>) elementDescriptor, (Bundle) obj, parserContext);
    }
}
