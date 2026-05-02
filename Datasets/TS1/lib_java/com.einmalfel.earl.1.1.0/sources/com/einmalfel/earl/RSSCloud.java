package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/RSSCloud.class */
public class RSSCloud {
    static final String XML_TAG = "cloud";

    @Nullable
    public final String domain;

    @Nullable
    public final Integer port;

    @Nullable
    public final String path;

    @Nullable
    public final String registerProcedure;

    @Nullable
    public final String protocol;

    @NonNull
    static RSSCloud read(@NonNull XmlPullParser parser) throws IOException, XmlPullParserException {
        parser.require(2, BuildConfig.FLAVOR, XML_TAG);
        String port = parser.getAttributeValue(BuildConfig.FLAVOR, "port");
        String domain = parser.getAttributeValue(BuildConfig.FLAVOR, "domain");
        String path = parser.getAttributeValue(BuildConfig.FLAVOR, "path");
        String procedure = parser.getAttributeValue(BuildConfig.FLAVOR, "registerProcedure");
        String protocol = parser.getAttributeValue(BuildConfig.FLAVOR, "protocol");
        parser.next();
        return new RSSCloud(domain, port == null ? null : Utils.tryParseInt(port), path, procedure, protocol);
    }

    public RSSCloud(@Nullable String domain, @Nullable Integer port, @Nullable String path, @Nullable String registerProcedure, @Nullable String protocol) {
        this.domain = domain;
        this.port = port;
        this.path = path;
        this.registerProcedure = registerProcedure;
        this.protocol = protocol;
    }
}
