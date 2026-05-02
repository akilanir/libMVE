package de.psdev.licensesdialog;

import android.util.Xml;
import de.psdev.licensesdialog.licenses.License;
import de.psdev.licensesdialog.model.Notice;
import de.psdev.licensesdialog.model.Notices;
import java.io.IOException;
import java.io.InputStream;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/NoticesXmlParser.class */
public final class NoticesXmlParser {
    private NoticesXmlParser() {
    }

    public static Notices parse(InputStream inputStream) throws Exception {
        try {
            XmlPullParser parser = Xml.newPullParser();
            parser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
            parser.setInput(inputStream, null);
            parser.nextTag();
            return parse(parser);
        } finally {
            inputStream.close();
        }
    }

    private static Notices parse(XmlPullParser parser) throws IOException, XmlPullParserException {
        Notices notices = new Notices();
        parser.require(2, null, "notices");
        while (parser.next() != 3) {
            if (parser.getEventType() == 2) {
                String name = parser.getName();
                if ("notice".equals(name)) {
                    notices.addNotice(readNotice(parser));
                } else {
                    skip(parser);
                }
            }
        }
        return notices;
    }

    private static Notice readNotice(XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, null, "notice");
        String name = null;
        String url = null;
        String copyright = null;
        License license = null;
        while (parser.next() != 3) {
            if (parser.getEventType() == 2) {
                String element = parser.getName();
                if ("name".equals(element)) {
                    name = readName(parser);
                } else if ("url".equals(element)) {
                    url = readUrl(parser);
                } else if ("copyright".equals(element)) {
                    copyright = readCopyright(parser);
                } else if ("license".equals(element)) {
                    license = readLicense(parser);
                } else {
                    skip(parser);
                }
            }
        }
        return new Notice(name, url, copyright, license);
    }

    private static String readName(XmlPullParser parser) throws IOException, XmlPullParserException {
        return readTag(parser, "name");
    }

    private static String readUrl(XmlPullParser parser) throws IOException, XmlPullParserException {
        return readTag(parser, "url");
    }

    private static String readCopyright(XmlPullParser parser) throws IOException, XmlPullParserException {
        return readTag(parser, "copyright");
    }

    private static License readLicense(XmlPullParser parser) throws IOException, XmlPullParserException {
        String license = readTag(parser, "license");
        return LicenseResolver.read(license);
    }

    private static String readTag(XmlPullParser parser, String tag) throws IOException, XmlPullParserException {
        parser.require(2, null, tag);
        String title = readText(parser);
        parser.require(3, null, tag);
        return title;
    }

    private static String readText(XmlPullParser parser) throws IOException, XmlPullParserException {
        String result = "";
        if (parser.next() == 4) {
            result = parser.getText();
            parser.nextTag();
        }
        return result;
    }

    private static void skip(XmlPullParser parser) {
    }
}
