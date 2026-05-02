package org.dmfs.xmlobjects.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder.class */
public class QualifiedNameObjectBuilder extends AbstractObjectBuilder<QualifiedName> {
    public static final QualifiedNameObjectBuilder INSTANCE = new QualifiedNameObjectBuilder();

    public QualifiedName get(ElementDescriptor<QualifiedName> elementDescriptor, QualifiedName qualifiedName, ParserContext parserContext) throws XmlObjectPullParserException {
        return elementDescriptor.qualifiedName;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<QualifiedName>) elementDescriptor, (QualifiedName) obj, parserContext);
    }
}
