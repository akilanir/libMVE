package org.dmfs.android.xmlmagic.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.builder.AbstractObjectBuilder;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/EqualsObjectBuilder.class */
public class EqualsObjectBuilder extends AbstractObjectBuilder<Boolean> {
    public Boolean get(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ParserContext parserContext) throws XmlObjectPullParserException {
        return true;
    }

    public <V> Boolean update(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (!bool.booleanValue()) {
            return bool;
        }
        Object state = parserContext.getState();
        if (state == null) {
            parserContext.setState(v);
            return bool;
        }
        boolean equals = state.equals(v);
        parserContext.setState(v);
        return Boolean.valueOf(equals);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, parserContext);
    }
}
