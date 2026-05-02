package org.dmfs.android.xmlmagic.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/AndroidCharSequenceObjectBuilder.class */
public class AndroidCharSequenceObjectBuilder extends BaseAndroidObjectBuilder<CharSequence> {
    public static final AndroidCharSequenceObjectBuilder INSTANCE = new AndroidCharSequenceObjectBuilder();

    public CharSequence update(ElementDescriptor<CharSequence> elementDescriptor, CharSequence charSequence, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return getCharSequenceAttr(qualifiedName, str, parserContext);
    }

    public CharSequence update(ElementDescriptor<CharSequence> elementDescriptor, CharSequence charSequence, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return charSequence == null ? format(str, parserContext) : charSequence;
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<CharSequence>) elementDescriptor, (CharSequence) obj, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<CharSequence>) elementDescriptor, (CharSequence) obj, qualifiedName, str, parserContext);
    }
}
