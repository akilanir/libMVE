package org.dmfs.android.xmlmagic.builder;

import android.content.res.Resources;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Xml;
import java.lang.reflect.Field;
import java.net.URI;
import org.dmfs.android.xmlmagic.AndroidParserContext;
import org.dmfs.android.xmlmagic.StringFormatter;
import org.dmfs.android.xmlmagic.annotations.ResolveInt;
import org.dmfs.android.xmlmagic.annotations.ResolveTokens;
import org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder.class */
public class ReflectionObjectBuilder<T> extends org.dmfs.xmlobjects.builder.reflection.ReflectionObjectBuilder<T> {
    public ReflectionObjectBuilder(Class<T> cls) {
        super(cls);
    }

    public T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        ResolveInt resolveInt;
        ResolveTokens resolveTokens;
        ResolveTokens resolveTokens2;
        Resources resources = null;
        ITokenResolver iTokenResolver = null;
        if (parserContext instanceof AndroidParserContext) {
            resources = ((AndroidParserContext) parserContext).getResources();
            iTokenResolver = ((AndroidParserContext) parserContext).getResolver();
        }
        AttributeSet asAttributeSet = Xml.asAttributeSet(parserContext.getXmlPullParser());
        Field field = (Field) this.mAttributeMap.get(qualifiedName);
        if (field != null) {
            String str2 = qualifiedName.name;
            String str3 = qualifiedName.namespace;
            Object obj = null;
            int attributeResourceValue = asAttributeSet.getAttributeResourceValue(str3, str2, 0);
            if (field.getType() == String.class) {
                if (attributeResourceValue == 0) {
                    obj = asAttributeSet.getAttributeValue(str3, str2);
                } else if (resources != null) {
                    obj = resources.getString(attributeResourceValue);
                }
                if (iTokenResolver != null && (resolveTokens2 = (ResolveTokens) field.getAnnotation(ResolveTokens.class)) != null && resolveTokens2.value()) {
                    obj = StringFormatter.format((String) obj, iTokenResolver, 5);
                }
            }
            if (field.getType() == CharSequence.class) {
                if (attributeResourceValue == 0) {
                    obj = asAttributeSet.getAttributeValue(str3, str2);
                } else if (resources != null) {
                    obj = resources.getText(attributeResourceValue);
                }
                if (iTokenResolver != null && (resolveTokens = (ResolveTokens) field.getAnnotation(ResolveTokens.class)) != null && resolveTokens.value()) {
                    obj = StringFormatter.format((CharSequence) obj, iTokenResolver, 5);
                }
            } else if (field.getType() == Integer.TYPE || field.getType() == Integer.class) {
                if (attributeResourceValue == 0) {
                    obj = Integer.valueOf(asAttributeSet.getAttributeIntValue(str3, str2, 0));
                } else if (resources == null || (resolveInt = (ResolveInt) field.getAnnotation(ResolveInt.class)) == null || !resolveInt.value()) {
                    obj = Integer.valueOf(attributeResourceValue);
                } else {
                    try {
                        obj = Integer.valueOf(resources.getInteger(attributeResourceValue));
                    } catch (Resources.NotFoundException e) {
                        obj = Integer.valueOf(attributeResourceValue);
                    }
                }
            } else if (field.getType() == Float.TYPE || field.getType() == Float.class) {
                obj = Float.valueOf(asAttributeSet.getAttributeFloatValue(str3, str2, 0.0f));
            } else if (field.getType() == Boolean.TYPE || field.getType() == Boolean.class) {
                if (attributeResourceValue == 0) {
                    obj = Boolean.valueOf(asAttributeSet.getAttributeBooleanValue(str3, str2, false));
                } else if (resources != null) {
                    obj = Boolean.valueOf(resources.getBoolean(attributeResourceValue));
                }
            } else if (field.getType() == URI.class) {
                String str4 = null;
                if (attributeResourceValue == 0) {
                    str4 = asAttributeSet.getAttributeValue(str3, str2);
                } else if (resources != null) {
                    str4 = resources.getString(attributeResourceValue);
                }
                if (str4 != null) {
                    obj = URI.create(str4);
                }
            } else if (field.getType() == Uri.class) {
                String str5 = null;
                if (attributeResourceValue == 0) {
                    str5 = asAttributeSet.getAttributeValue(str3, str2);
                } else if (resources != null) {
                    str5 = resources.getString(attributeResourceValue);
                }
                if (str5 != null) {
                    obj = Uri.parse(str5);
                }
            } else if (field.getType() == Class.class) {
                String str6 = null;
                if (attributeResourceValue == 0) {
                    str6 = asAttributeSet.getAttributeValue(str3, str2);
                } else if (resources != null) {
                    str6 = resources.getString(attributeResourceValue);
                }
                if (str6 != null) {
                    try {
                        obj = Class.forName(str6);
                    } catch (ClassNotFoundException e2) {
                        obj = null;
                    }
                }
            }
            if (obj == null) {
                return (T) super.update(elementDescriptor, t, qualifiedName, str, parserContext);
            }
            field.setAccessible(true);
            try {
                field.set(t, obj);
            } catch (IllegalAccessException e3) {
            } catch (IllegalArgumentException e4) {
            }
        }
        return t;
    }
}
