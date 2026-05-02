package org.dmfs.android.xmlmagic.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.Recyclable;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder.class */
public class RecyclingReflectionObjectBuilder<T> extends ReflectionObjectBuilder<T> {
    public RecyclingReflectionObjectBuilder(Class<T> cls) {
        super(cls);
    }

    public T get(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException {
        if (t == null) {
            return (T) super.get(elementDescriptor, t, parserContext);
        }
        if (t instanceof Recyclable) {
            ((Recyclable) t).recycle();
        }
        return t;
    }
}
