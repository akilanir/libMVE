package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/SetObjectBuilder.class */
public class SetObjectBuilder<T> extends AbstractObjectBuilder<Set<T>> {
    private static final int DEFAULT_INITIAL_CAPACITY = 16;
    private final ElementDescriptor<T> mSetElementDescriptor;
    private final IObjectBuilder<T> mSetElementBuilder;
    private final int mInitialCapacity;
    private final boolean mStoreNull;

    public SetObjectBuilder(ElementDescriptor<T> elementDescriptor) {
        this((ElementDescriptor) elementDescriptor, 16, true);
    }

    public SetObjectBuilder(ElementDescriptor<T> elementDescriptor, boolean z) {
        this(elementDescriptor, 16, z);
    }

    public SetObjectBuilder(ElementDescriptor<T> elementDescriptor, int i) {
        this((ElementDescriptor) elementDescriptor, i, true);
    }

    public SetObjectBuilder(ElementDescriptor<T> elementDescriptor, int i, boolean z) {
        this.mSetElementDescriptor = elementDescriptor;
        this.mSetElementBuilder = null;
        this.mInitialCapacity = i;
        this.mStoreNull = z;
    }

    public SetObjectBuilder(IObjectBuilder<T> iObjectBuilder) {
        this((IObjectBuilder) iObjectBuilder, 16, true);
    }

    public SetObjectBuilder(IObjectBuilder<T> iObjectBuilder, boolean z) {
        this(iObjectBuilder, 16, z);
    }

    public SetObjectBuilder(IObjectBuilder<T> iObjectBuilder, int i) {
        this((IObjectBuilder) iObjectBuilder, i, true);
    }

    public SetObjectBuilder(IObjectBuilder<T> iObjectBuilder, int i, boolean z) {
        this.mSetElementDescriptor = null;
        this.mSetElementBuilder = iObjectBuilder;
        this.mInitialCapacity = i;
        this.mStoreNull = z;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public Set<T> get(ElementDescriptor<Set<T>> elementDescriptor, Set<T> set, ParserContext parserContext) {
        if (set == null) {
            return new HashSet(this.mInitialCapacity);
        }
        set.clear();
        return set;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Set<T> update(ElementDescriptor<Set<T>> elementDescriptor, Set<T> set, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if ((elementDescriptor2 == this.mSetElementDescriptor || (this.mSetElementDescriptor == null && elementDescriptor2 != null && this.mSetElementBuilder == elementDescriptor2.builder)) && (v != 0 || this.mStoreNull)) {
            set.add(v);
        }
        return set;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<Set<T>> elementDescriptor, Set<T> set, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (set != null) {
            XmlContext xmlContext = serializerContext.getXmlContext();
            for (T t : set) {
                if (this.mSetElementDescriptor == null && (t instanceof QualifiedName)) {
                    iXmlChildWriter.writeChild(ElementDescriptor.get((QualifiedName) t, elementDescriptor, xmlContext), t, serializerContext);
                } else {
                    iXmlChildWriter.writeChild(this.mSetElementDescriptor, t, serializerContext);
                }
            }
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update(elementDescriptor, (Set) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }
}
