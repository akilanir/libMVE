package org.dmfs.android.xmlmagic.builder;

import android.net.Uri;
import org.dmfs.android.xmlmagic.Model;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder.class */
public class AndroidUriObjectBuilder extends BaseAndroidObjectBuilder<Uri> {
    public static final AndroidUriObjectBuilder INSTANCE = new AndroidUriObjectBuilder();
    private static final QualifiedName ATTR_SCHEME = QualifiedName.get("scheme");
    private static final QualifiedName ATTR_AUTHORITY = QualifiedName.get("authority");
    private static final QualifiedName ATTR_PATH = QualifiedName.get("path");
    private static final QualifiedName ATTR_FRAGMENT = QualifiedName.get("fragment");
    private static final ElementDescriptor<String> SCHEME = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "scheme"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> AUTHORITY = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "authority"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> PATH = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "path"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> APPEND_PATH = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "append-path"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<String> FRAGMENT = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "fragment"), AndroidStringObjectBuilder.INSTANCE);
    private static final ElementDescriptor<QueryParameter> PARAMETER = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "query-parameter"), new BaseAndroidObjectBuilder<QueryParameter>() { // from class: org.dmfs.android.xmlmagic.builder.AndroidUriObjectBuilder.1
        public QueryParameter get(ElementDescriptor<QueryParameter> elementDescriptor, QueryParameter queryParameter, ParserContext parserContext) throws XmlObjectPullParserException {
            return new QueryParameter();
        }

        public QueryParameter update(ElementDescriptor<QueryParameter> elementDescriptor, QueryParameter queryParameter, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            if (qualifiedName == Model.ATTR_KEY) {
                queryParameter.key = str;
            }
            return queryParameter;
        }

        public QueryParameter update(ElementDescriptor<QueryParameter> elementDescriptor, QueryParameter queryParameter, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            queryParameter.value = str;
            return queryParameter;
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<QueryParameter>) elementDescriptor, (QueryParameter) obj, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
            return update((ElementDescriptor<QueryParameter>) elementDescriptor, (QueryParameter) obj, qualifiedName, str, parserContext);
        }

        public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
            return get((ElementDescriptor<QueryParameter>) elementDescriptor, (QueryParameter) obj, parserContext);
        }
    });

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter.class */
    private static class QueryParameter {
        private String key;
        private String value;

        private QueryParameter() {
        }
    }

    private Uri.Builder getBuilder(ParserContext parserContext) {
        Uri.Builder builder = (Uri.Builder) parserContext.getState();
        if (builder == null) {
            builder = new Uri.Builder();
            parserContext.setState(builder);
        }
        return builder;
    }

    public Uri update(ElementDescriptor<Uri> elementDescriptor, Uri uri, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (qualifiedName == ATTR_SCHEME) {
            getBuilder(parserContext).scheme(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
        }
        if (qualifiedName == ATTR_AUTHORITY) {
            getBuilder(parserContext).authority(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
        }
        if (qualifiedName == ATTR_PATH) {
            getBuilder(parserContext).path(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
        }
        if (qualifiedName == ATTR_FRAGMENT) {
            getBuilder(parserContext).fragment(getCharSequenceAttr(qualifiedName, str, parserContext).toString());
        }
        return uri;
    }

    public Uri update(ElementDescriptor<Uri> elementDescriptor, Uri uri, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        try {
            return Uri.parse(format(str.trim(), parserContext).toString());
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Uri update(ElementDescriptor<Uri> elementDescriptor, Uri uri, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        if (uri != null) {
            parserContext.setState(uri.buildUpon());
            uri = null;
        }
        if ((v instanceof String) || v == 0) {
            String charSequence = v == 0 ? null : format((CharSequence) v, parserContext).toString();
            if (elementDescriptor2 == SCHEME) {
                if (v != 0) {
                    getBuilder(parserContext).scheme(charSequence);
                }
            } else if (elementDescriptor2 == AUTHORITY) {
                if (v != 0) {
                    getBuilder(parserContext).authority(charSequence);
                }
            } else if (elementDescriptor2 == PATH) {
                if (v == 0) {
                    getBuilder(parserContext).path("");
                } else {
                    getBuilder(parserContext).path(charSequence);
                }
            } else if (elementDescriptor2 == FRAGMENT) {
                if (v != 0) {
                    getBuilder(parserContext).fragment(charSequence);
                }
            } else if (elementDescriptor2 == APPEND_PATH) {
                if (v == 0) {
                    getBuilder(parserContext).appendPath("");
                } else {
                    getBuilder(parserContext).appendPath(charSequence);
                }
            }
        } else if (elementDescriptor2 == PARAMETER) {
            QueryParameter queryParameter = (QueryParameter) v;
            getBuilder(parserContext).appendQueryParameter(format(queryParameter.key, parserContext).toString(), format(queryParameter.value, parserContext).toString());
        }
        return uri;
    }

    public Uri finish(ElementDescriptor<Uri> elementDescriptor, Uri uri, ParserContext parserContext) throws XmlObjectPullParserException {
        if (uri == null) {
            uri = getBuilder(parserContext).build();
        }
        parserContext.setState((Object) null);
        return uri;
    }

    public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return finish((ElementDescriptor<Uri>) elementDescriptor, (Uri) obj, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Uri>) elementDescriptor, (Uri) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Uri>) elementDescriptor, (Uri) obj, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Uri>) elementDescriptor, (Uri) obj, qualifiedName, str, parserContext);
    }
}
