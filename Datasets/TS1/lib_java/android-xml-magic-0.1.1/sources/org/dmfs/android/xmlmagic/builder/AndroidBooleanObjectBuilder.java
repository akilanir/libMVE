package org.dmfs.android.xmlmagic.builder;

import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.StringFormatter;
import org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder.class */
public class AndroidBooleanObjectBuilder extends BaseAndroidObjectBuilder<Boolean> {
    public static final AndroidBooleanObjectBuilder INSTANCE = new AndroidBooleanObjectBuilder();

    public Boolean update(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return Boolean.valueOf(getBooleanAttr(qualifiedName, parserContext));
    }

    public Boolean update(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        ITokenResolver resolver;
        if (bool != null) {
            return bool;
        }
        if (str == null || str.length() == 0) {
            return false;
        }
        if ((parserContext instanceof AndroidParserContext) && (resolver = ((AndroidParserContext) parserContext).getResolver()) != null) {
            str = StringFormatter.format(str, resolver, 5).toString();
        }
        return Boolean.valueOf("true".equalsIgnoreCase(str) || "1".equals(str));
    }

    public Boolean finish(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ParserContext parserContext) throws XmlObjectPullParserException {
        if (bool == null) {
            return false;
        }
        return bool;
    }

    public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return finish((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, qualifiedName, str, parserContext);
    }
}
