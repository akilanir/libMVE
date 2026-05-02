package org.dmfs.android.xmlmagic.builder;

import android.content.res.Resources;
import android.util.AttributeSet;
import android.util.Xml;
import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.StringFormatter;
import org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.builder.AbstractObjectBuilder;
import org.dmfs.xmlobjects.pull.ParserContext;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder.class */
public abstract class BaseAndroidObjectBuilder<T> extends AbstractObjectBuilder<T> {
    protected final Resources getResources(ParserContext parserContext) {
        if (parserContext instanceof AndroidParserContext) {
            return ((AndroidParserContext) parserContext).getResources();
        }
        return null;
    }

    protected final ITokenResolver getTokenResolver(ParserContext parserContext) {
        if (parserContext instanceof AndroidParserContext) {
            return ((AndroidParserContext) parserContext).getResolver();
        }
        return null;
    }

    protected final CharSequence format(CharSequence charSequence, ParserContext parserContext) {
        ITokenResolver tokenResolver = getTokenResolver(parserContext);
        return tokenResolver == null ? charSequence : StringFormatter.format(charSequence, tokenResolver, 5);
    }

    protected CharSequence getCharSequenceAttr(QualifiedName qualifiedName, String str, ParserContext parserContext) {
        Resources resources = getResources(parserContext);
        AttributeSet asAttributeSet = Xml.asAttributeSet(parserContext.getXmlPullParser());
        int attributeResourceValue = asAttributeSet.getAttributeResourceValue(qualifiedName.namespace, qualifiedName.name, 0);
        return attributeResourceValue == 0 ? format(asAttributeSet.getAttributeValue(qualifiedName.namespace, qualifiedName.name), parserContext) : resources != null ? resources.getText(attributeResourceValue) : str;
    }

    protected Integer getIntegerAttr(QualifiedName qualifiedName, boolean z, ParserContext parserContext) {
        Resources resources = getResources(parserContext);
        AttributeSet asAttributeSet = Xml.asAttributeSet(parserContext.getXmlPullParser());
        int attributeResourceValue = asAttributeSet.getAttributeResourceValue(qualifiedName.namespace, qualifiedName.name, 0);
        if (attributeResourceValue == 0) {
            try {
                return Integer.valueOf(Integer.parseInt(format(asAttributeSet.getAttributeValue(qualifiedName.namespace, qualifiedName.name), parserContext).toString()));
            } catch (NumberFormatException e) {
                return 0;
            }
        }
        if (resources != null && z) {
            try {
                return Integer.valueOf(resources.getInteger(attributeResourceValue));
            } catch (Resources.NotFoundException e2) {
            }
        }
        return Integer.valueOf(attributeResourceValue);
    }

    protected boolean getBooleanAttr(QualifiedName qualifiedName, ParserContext parserContext) {
        Resources resources = getResources(parserContext);
        AttributeSet asAttributeSet = Xml.asAttributeSet(parserContext.getXmlPullParser());
        int attributeResourceValue = asAttributeSet.getAttributeResourceValue(qualifiedName.namespace, qualifiedName.name, 0);
        if (attributeResourceValue == 0) {
            String charSequence = format(asAttributeSet.getAttributeValue(qualifiedName.namespace, qualifiedName.name), parserContext).toString();
            return charSequence.equalsIgnoreCase("true") || charSequence.equals("1");
        }
        if (resources != null) {
            return resources.getBoolean(attributeResourceValue);
        }
        return false;
    }
}
