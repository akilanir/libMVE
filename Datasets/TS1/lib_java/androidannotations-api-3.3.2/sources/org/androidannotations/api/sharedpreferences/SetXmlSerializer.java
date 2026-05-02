package org.androidannotations.api.sharedpreferences;

import android.util.Log;
import android.util.Xml;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/SetXmlSerializer.class */
public final class SetXmlSerializer {
    private static final String NAMESPACE = "";
    private static final String STRING_TAG = "AA_string";
    private static final String SET_TAG = "AA_set";

    private SetXmlSerializer() {
    }

    public static String serialize(Set<String> set) {
        if (set == null) {
            set = Collections.emptySet();
        }
        StringWriter writer = new StringWriter();
        XmlSerializer serializer = Xml.newSerializer();
        try {
            serializer.setOutput(writer);
            serializer.startTag(NAMESPACE, SET_TAG);
            for (String string : set) {
                serializer.startTag(NAMESPACE, STRING_TAG).text(string).endTag(NAMESPACE, STRING_TAG);
            }
            serializer.endTag(NAMESPACE, SET_TAG).endDocument();
        } catch (IOException e) {
        } catch (IllegalArgumentException e2) {
        } catch (IllegalStateException e3) {
        }
        return writer.toString();
    }

    public static Set<String> deserialize(String data) {
        Set<String> stringSet = new TreeSet<>();
        XmlPullParser parser = Xml.newPullParser();
        try {
            parser.setInput(new StringReader(data));
            parser.next();
            parser.require(2, NAMESPACE, SET_TAG);
            while (parser.next() != 3) {
                parser.require(2, NAMESPACE, STRING_TAG);
                parser.next();
                parser.require(4, null, null);
                stringSet.add(parser.getText());
                parser.next();
                parser.require(3, null, STRING_TAG);
            }
            return stringSet;
        } catch (IOException e) {
            Log.w("getStringSet", e);
            return null;
        } catch (XmlPullParserException e2) {
            Log.w("getStringSet", e2);
            return null;
        }
    }
}
