package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/MapObjectBuilder.class */
public class MapObjectBuilder<T, V> extends AbstractObjectBuilder<Map<T, V>> {
    public static final int DEFAULT_INITIAL_MAP_SIZE = 16;
    private final Mapper<T, V> mMapper;
    private final ElementDescriptor<V> mChildElementDescriptor;
    private final int mInitialMapSize;

    /* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper.class */
    public interface Mapper<T, V> {
        T getIndex(ElementDescriptor<V> elementDescriptor, V v);
    }

    public MapObjectBuilder(Mapper<T, V> mapper, ElementDescriptor<V> elementDescriptor) {
        this(mapper, elementDescriptor, 16);
    }

    public MapObjectBuilder(Mapper<T, V> mapper, ElementDescriptor<V> elementDescriptor, int i) {
        this.mMapper = mapper;
        this.mChildElementDescriptor = elementDescriptor;
        this.mInitialMapSize = i;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public Map<T, V> get(ElementDescriptor<Map<T, V>> elementDescriptor, Map<T, V> map, ParserContext parserContext) throws XmlObjectPullParserException {
        if (map == null) {
            return new HashMap(this.mInitialMapSize);
        }
        map.clear();
        return map;
    }

    public <W> Map<T, V> update(ElementDescriptor<Map<T, V>> elementDescriptor, Map<T, V> map, ElementDescriptor<W> elementDescriptor2, W w, ParserContext parserContext) throws XmlObjectPullParserException {
        T index;
        if (elementDescriptor2 == this.mChildElementDescriptor && (index = this.mMapper.getIndex(this.mChildElementDescriptor, w)) != null) {
            map.put(index, w);
        }
        return map;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<Map<T, V>> elementDescriptor, Map<T, V> map, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (map != null) {
            Iterator<V> it = map.values().iterator();
            while (it.hasNext()) {
                iXmlChildWriter.writeChild(this.mChildElementDescriptor, it.next(), serializerContext);
            }
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update(elementDescriptor, (Map) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }
}
