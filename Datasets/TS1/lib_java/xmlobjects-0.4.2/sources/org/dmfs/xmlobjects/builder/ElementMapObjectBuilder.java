package org.dmfs.xmlobjects.builder;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/ElementMapObjectBuilder.class */
public class ElementMapObjectBuilder extends AbstractObjectBuilder<Map<ElementDescriptor<?>, Object>> {
    public static final ElementMapObjectBuilder INSTANCE = new ElementMapObjectBuilder();
    public static final int DEFAULT_INITIAL_CAPACITY = 16;
    private final int mInitialCapacity;

    public ElementMapObjectBuilder() {
        this.mInitialCapacity = 16;
    }

    public ElementMapObjectBuilder(int i) {
        this.mInitialCapacity = i;
    }

    public Map<ElementDescriptor<?>, Object> get(ElementDescriptor<Map<ElementDescriptor<?>, Object>> elementDescriptor, Map<ElementDescriptor<?>, Object> map, ParserContext parserContext) {
        if (map == null) {
            return new HashMap(this.mInitialCapacity);
        }
        map.clear();
        return map;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Map<ElementDescriptor<?>, Object> update(ElementDescriptor<Map<ElementDescriptor<?>, Object>> elementDescriptor, Map<ElementDescriptor<?>, Object> map, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (elementDescriptor2 != 0) {
            map.put(elementDescriptor2, v);
        }
        return map;
    }

    public void writeChildren(ElementDescriptor<Map<ElementDescriptor<?>, Object>> elementDescriptor, Map<ElementDescriptor<?>, Object> map, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        if (map != null) {
            for (Map.Entry<ElementDescriptor<?>, Object> entry : map.entrySet()) {
                iXmlChildWriter.writeChild(entry.getKey(), entry.getValue(), serializerContext);
            }
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ void writeChildren(ElementDescriptor elementDescriptor, Object obj, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        writeChildren((ElementDescriptor<Map<ElementDescriptor<?>, Object>>) elementDescriptor, (Map<ElementDescriptor<?>, Object>) obj, iXmlChildWriter, serializerContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Map<ElementDescriptor<?>, Object>>) elementDescriptor, (Map<ElementDescriptor<?>, Object>) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Map<ElementDescriptor<?>, Object>>) elementDescriptor, (Map<ElementDescriptor<?>, Object>) obj, parserContext);
    }
}
