package com.einmalfel.earl;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/MediaContent.class */
public class MediaContent extends MediaCommon {
    static final String XML_TAG = "content";

    @Nullable
    public final URL url;

    @Nullable
    public final Integer fileSize;

    @Nullable
    public final String type;

    @Nullable
    public final String medium;

    @Nullable
    public final Boolean isDefault;

    @Nullable
    public final String expression;

    @Nullable
    public final Integer bitrate;

    @Nullable
    public final Integer framerate;

    @Nullable
    public final Integer samplingrate;

    @Nullable
    public final Integer channels;

    @Nullable
    public final Integer duration;

    @Nullable
    public final Integer height;

    @Nullable
    public final Integer width;

    @Nullable
    public final String lang;

    @NonNull
    static MediaContent read(XmlPullParser parser) throws XmlPullParserException, IOException {
        parser.require(2, null, XML_TAG);
        String url = parser.getAttributeValue(BuildConfig.FLAVOR, "url");
        String fileSize = parser.getAttributeValue(BuildConfig.FLAVOR, "fileSize");
        String isDefault = parser.getAttributeValue(BuildConfig.FLAVOR, "isDefault");
        String bitrate = parser.getAttributeValue(BuildConfig.FLAVOR, "bitrate");
        String framerate = parser.getAttributeValue(BuildConfig.FLAVOR, "framerate");
        String samplingrate = parser.getAttributeValue(BuildConfig.FLAVOR, "samplingrate");
        String channels = parser.getAttributeValue(BuildConfig.FLAVOR, "channels");
        String duration = parser.getAttributeValue(BuildConfig.FLAVOR, "duration");
        String height = parser.getAttributeValue(BuildConfig.FLAVOR, "height");
        String width = parser.getAttributeValue(BuildConfig.FLAVOR, "width");
        return new MediaContent(url == null ? null : Utils.tryParseUrl(url), fileSize == null ? null : Utils.tryParseInt(fileSize), parser.getAttributeValue(BuildConfig.FLAVOR, "type"), parser.getAttributeValue(BuildConfig.FLAVOR, "medium"), isDefault == null ? null : Boolean.valueOf(isDefault), parser.getAttributeValue(BuildConfig.FLAVOR, "expression"), bitrate == null ? null : Utils.tryParseInt(bitrate), framerate == null ? null : Utils.tryParseInt(framerate), samplingrate == null ? null : Utils.tryParseInt(samplingrate), channels == null ? null : Utils.tryParseInt(channels), duration == null ? null : Utils.tryParseInt(duration), height == null ? null : Utils.tryParseInt(height), width == null ? null : Utils.tryParseInt(width), parser.getAttributeValue(BuildConfig.FLAVOR, "lang"), MediaCommon.read(parser));
    }

    public MediaContent(@Nullable URL url, @Nullable Integer fileSize, @Nullable String type, @Nullable String medium, @Nullable Boolean isDefault, @Nullable String expression, @Nullable Integer bitrate, @Nullable Integer framerate, @Nullable Integer samplingrate, @Nullable Integer channels, @Nullable Integer duration, @Nullable Integer height, @Nullable Integer width, @Nullable String lang, @NonNull MediaCommon source) {
        super(source);
        this.url = url;
        this.fileSize = fileSize;
        this.type = type;
        this.medium = medium;
        this.isDefault = isDefault;
        this.expression = expression;
        this.bitrate = bitrate;
        this.framerate = framerate;
        this.samplingrate = samplingrate;
        this.channels = channels;
        this.duration = duration;
        this.height = height;
        this.width = width;
        this.lang = lang;
    }
}
