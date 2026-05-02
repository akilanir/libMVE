package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Xml;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.DataFormatException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/EarlParser.class */
public class EarlParser {
    private static final String TAG = "Earl.EarlParser";

    @Nullable
    public static Feed parse(@NonNull InputStream inputStream, int maxItems) {
        try {
            return parseOrThrow(inputStream, maxItems);
        } catch (Exception e) {
            return null;
        }
    }

    @NonNull
    public static Feed parseOrThrow(@NonNull InputStream inputStream, int maxItems) throws XmlPullParserException, IOException, DataFormatException {
        try {
            XmlPullParser parser = Xml.newPullParser();
            parser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", true);
            parser.setInput(inputStream, null);
            while (parser.next() != 1) {
                if (parser.getEventType() == 2) {
                    switch (parser.getName()) {
                        case "channel":
                            RSSFeed read = RSSFeed.read(parser, maxItems);
                            inputStream.close();
                            return read;
                        case "feed":
                            AtomFeed read2 = AtomFeed.read(parser, maxItems);
                            inputStream.close();
                            return read2;
                    }
                }
            }
            throw new DataFormatException("No syndication feeds found in given stream");
        } finally {
            inputStream.close();
        }
    }
}
