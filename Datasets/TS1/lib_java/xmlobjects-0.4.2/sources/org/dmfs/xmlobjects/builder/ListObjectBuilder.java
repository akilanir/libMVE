package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/ListObjectBuilder.class */
public class ListObjectBuilder<T> extends AbstractObjectBuilder<List<T>> {
    private static final int DEFAULT_INITIAL_CAPACITY = 16;
    private final ElementDescriptor<T> mListElementDescriptor;
    private final IObjectBuilder<T> mListElementBuilder;
    private final int mInitialCapacity;
    private final boolean mStoreNull;

    public ListObjectBuilder(ElementDescriptor<T> elementDescriptor) {
        this((ElementDescriptor) elementDescriptor, 16, true);
    }

    public ListObjectBuilder(ElementDescriptor<T> elementDescriptor, boolean z) {
        this(elementDescriptor, 16, z);
    }

    public ListObjectBuilder(ElementDescriptor<T> elementDescriptor, int i) {
        this((ElementDescriptor) elementDescriptor, i, true);
    }

    public ListObjectBuilder(ElementDescriptor<T> elementDescriptor, int i, boolean z) {
        this.mListElementDescriptor = elementDescriptor;
        this.mListElementBuilder = null;
        this.mInitialCapacity = i;
        this.mStoreNull = z;
    }

    public ListObjectBuilder(IObjectBuilder<T> iObjectBuilder) {
        this((IObjectBuilder) iObjectBuilder, 16, true);
    }

    public ListObjectBuilder(IObjectBuilder<T> iObjectBuilder, boolean z) {
        this(iObjectBuilder, 16, z);
    }

    public ListObjectBuilder(IObjectBuilder<T> iObjectBuilder, int i) {
        this((IObjectBuilder) iObjectBuilder, i, true);
    }

    public ListObjectBuilder(IObjectBuilder<T> iObjectBuilder, int i, boolean z) {
        this.mListElementDescriptor = null;
        this.mListElementBuilder = iObjectBuilder;
        this.mInitialCapacity = i;
        this.mStoreNull = z;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public List<T> get(ElementDescriptor<List<T>> elementDescriptor, List<T> list, ParserContext parserContext) {
        if (list == null) {
            return new ArrayList(this.mInitialCapacity);
        }
        list.clear();
        return list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> List<T> update(ElementDescriptor<List<T>> elementDescriptor, List<T> list, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if ((elementDescriptor2 == this.mListElementDescriptor || (this.mListElementDescriptor == null && elementDescriptor2 != null && this.mListElementBuilder == elementDescriptor2.builder)) && (v != 0 || this.mStoreNull)) {
            list.add(v);
        }
        return list;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<List<T>> elementDescriptor, List<T> list, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (list != null) {
            XmlContext xmlContext = serializerContext.getXmlContext();
            for (T t : list) {
                if (this.mListElementDescriptor == null && (t instanceof QualifiedName)) {
                    iXmlChildWriter.writeChild(ElementDescriptor.get((QualifiedName) t, elementDescriptor, xmlContext), t, serializerContext);
                } else {
                    iXmlChildWriter.writeChild(this.mListElementDescriptor, t, serializerContext);
                }
            }
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update(elementDescriptor, (List) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }
}
