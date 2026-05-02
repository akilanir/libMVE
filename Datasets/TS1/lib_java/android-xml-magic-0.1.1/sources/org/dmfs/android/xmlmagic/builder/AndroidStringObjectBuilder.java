package org.dmfs.android.xmlmagic.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder.class */
public class AndroidStringObjectBuilder extends BaseAndroidObjectBuilder<String> {
    public static final AndroidStringObjectBuilder INSTANCE = new AndroidStringObjectBuilder();

    public String update(ElementDescriptor<String> elementDescriptor, String str, QualifiedName qualifiedName, String str2, ParserContext parserContext) throws XmlObjectPullParserException {
        return getCharSequenceAttr(qualifiedName, str2, parserContext).toString();
    }

    public String update(ElementDescriptor<String> elementDescriptor, String str, String str2, ParserContext parserContext) throws XmlObjectPullParserException {
        return str == null ? format(str2, parserContext).toString() : str;
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<String>) elementDescriptor, (String) obj, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<String>) elementDescriptor, (String) obj, qualifiedName, str, parserContext);
    }
}
