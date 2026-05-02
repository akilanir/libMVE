package com.google.android.exoplayer.smoothstreaming;

import android.util.Base64;
import android.util.Pair;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.extractor.mp4.PsshAtomUtil;
import com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifest;
import com.google.android.exoplayer.upstream.UriLoadable;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser.class */
public class SmoothStreamingManifestParser implements UriLoadable.Parser<SmoothStreamingManifest> {
    private final XmlPullParserFactory xmlParserFactory;

    public SmoothStreamingManifestParser() {
        try {
            this.xmlParserFactory = XmlPullParserFactory.newInstance();
        } catch (XmlPullParserException e) {
            throw new RuntimeException("Couldn't create XmlPullParserFactory instance", e);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.exoplayer.upstream.UriLoadable.Parser
    public SmoothStreamingManifest parse(String connectionUrl, InputStream inputStream) throws IOException, ParserException {
        try {
            XmlPullParser xmlParser = this.xmlParserFactory.newPullParser();
            xmlParser.setInput(inputStream, null);
            SmoothStreamMediaParser smoothStreamMediaParser = new SmoothStreamMediaParser(null, connectionUrl);
            return (SmoothStreamingManifest) smoothStreamMediaParser.parse(xmlParser);
        } catch (XmlPullParserException e) {
            throw new ParserException(e);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$MissingFieldException.class */
    public static class MissingFieldException extends ParserException {
        public MissingFieldException(String fieldName) {
            super("Missing required field: " + fieldName);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser.class */
    private static abstract class ElementParser {
        private final String baseUri;
        private final String tag;
        private final ElementParser parent;
        private final List<Pair<String, Object>> normalizedAttributes = new LinkedList();

        protected abstract Object build();

        public ElementParser(ElementParser parent, String baseUri, String tag) {
            this.parent = parent;
            this.baseUri = baseUri;
            this.tag = tag;
        }

        public final Object parse(XmlPullParser xmlParser) throws XmlPullParserException, IOException, ParserException {
            boolean foundStartTag = false;
            int skippingElementDepth = 0;
            while (true) {
                int eventType = xmlParser.getEventType();
                switch (eventType) {
                    case 1:
                        return null;
                    case 2:
                        String tagName = xmlParser.getName();
                        if (this.tag.equals(tagName)) {
                            foundStartTag = true;
                            parseStartTag(xmlParser);
                            break;
                        } else if (!foundStartTag) {
                            break;
                        } else if (skippingElementDepth > 0) {
                            skippingElementDepth++;
                            break;
                        } else if (handleChildInline(tagName)) {
                            parseStartTag(xmlParser);
                            break;
                        } else {
                            ElementParser childElementParser = newChildParser(this, tagName, this.baseUri);
                            if (childElementParser == null) {
                                skippingElementDepth = 1;
                                break;
                            } else {
                                addChild(childElementParser.parse(xmlParser));
                                break;
                            }
                        }
                    case 3:
                        if (!foundStartTag) {
                            continue;
                        } else if (skippingElementDepth > 0) {
                            skippingElementDepth--;
                            break;
                        } else {
                            String tagName2 = xmlParser.getName();
                            parseEndTag(xmlParser);
                            if (!handleChildInline(tagName2)) {
                                return build();
                            }
                            break;
                        }
                    case 4:
                        if (!foundStartTag || skippingElementDepth != 0) {
                            break;
                        } else {
                            parseText(xmlParser);
                            break;
                        }
                        break;
                }
                xmlParser.next();
            }
        }

        private ElementParser newChildParser(ElementParser parent, String name, String baseUri) {
            if (TrackElementParser.TAG.equals(name)) {
                return new TrackElementParser(parent, baseUri);
            }
            if (ProtectionElementParser.TAG.equals(name)) {
                return new ProtectionElementParser(parent, baseUri);
            }
            if (StreamElementParser.TAG.equals(name)) {
                return new StreamElementParser(parent, baseUri);
            }
            return null;
        }

        protected final void putNormalizedAttribute(String key, Object value) {
            this.normalizedAttributes.add(Pair.create(key, value));
        }

        protected final Object getNormalizedAttribute(String key) {
            for (int i = 0; i < this.normalizedAttributes.size(); i++) {
                Pair<String, Object> pair = this.normalizedAttributes.get(i);
                if (((String) pair.first).equals(key)) {
                    return pair.second;
                }
            }
            if (this.parent == null) {
                return null;
            }
            return this.parent.getNormalizedAttribute(key);
        }

        protected boolean handleChildInline(String tagName) {
            return false;
        }

        protected void parseStartTag(XmlPullParser xmlParser) throws ParserException {
        }

        protected void parseText(XmlPullParser xmlParser) throws ParserException {
        }

        protected void parseEndTag(XmlPullParser xmlParser) throws ParserException {
        }

        protected void addChild(Object parsedChild) {
        }

        protected final String parseRequiredString(XmlPullParser parser, String key) throws MissingFieldException {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                return value;
            }
            throw new MissingFieldException(key);
        }

        protected final int parseInt(XmlPullParser parser, String key, int defaultValue) throws ParserException {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                try {
                    return Integer.parseInt(value);
                } catch (NumberFormatException e) {
                    throw new ParserException(e);
                }
            }
            return defaultValue;
        }

        protected final int parseRequiredInt(XmlPullParser parser, String key) throws ParserException {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                try {
                    return Integer.parseInt(value);
                } catch (NumberFormatException e) {
                    throw new ParserException(e);
                }
            }
            throw new MissingFieldException(key);
        }

        protected final long parseLong(XmlPullParser parser, String key, long defaultValue) throws ParserException {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                try {
                    return Long.parseLong(value);
                } catch (NumberFormatException e) {
                    throw new ParserException(e);
                }
            }
            return defaultValue;
        }

        protected final long parseRequiredLong(XmlPullParser parser, String key) throws ParserException {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                try {
                    return Long.parseLong(value);
                } catch (NumberFormatException e) {
                    throw new ParserException(e);
                }
            }
            throw new MissingFieldException(key);
        }

        protected final boolean parseBoolean(XmlPullParser parser, String key, boolean defaultValue) {
            String value = parser.getAttributeValue(null, key);
            if (value != null) {
                return Boolean.parseBoolean(value);
            }
            return defaultValue;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser.class */
    private static class SmoothStreamMediaParser extends ElementParser {
        public static final String TAG = "SmoothStreamingMedia";
        private static final String KEY_MAJOR_VERSION = "MajorVersion";
        private static final String KEY_MINOR_VERSION = "MinorVersion";
        private static final String KEY_TIME_SCALE = "TimeScale";
        private static final String KEY_DVR_WINDOW_LENGTH = "DVRWindowLength";
        private static final String KEY_DURATION = "Duration";
        private static final String KEY_LOOKAHEAD_COUNT = "LookaheadCount";
        private static final String KEY_IS_LIVE = "IsLive";
        private int majorVersion;
        private int minorVersion;
        private long timescale;
        private long duration;
        private long dvrWindowLength;
        private int lookAheadCount;
        private boolean isLive;
        private SmoothStreamingManifest.ProtectionElement protectionElement;
        private List<SmoothStreamingManifest.StreamElement> streamElements;

        public SmoothStreamMediaParser(ElementParser parent, String baseUri) {
            super(parent, baseUri, TAG);
            this.lookAheadCount = -1;
            this.protectionElement = null;
            this.streamElements = new LinkedList();
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseStartTag(XmlPullParser parser) throws ParserException {
            this.majorVersion = parseRequiredInt(parser, KEY_MAJOR_VERSION);
            this.minorVersion = parseRequiredInt(parser, KEY_MINOR_VERSION);
            this.timescale = parseLong(parser, KEY_TIME_SCALE, 10000000L);
            this.duration = parseRequiredLong(parser, KEY_DURATION);
            this.dvrWindowLength = parseLong(parser, KEY_DVR_WINDOW_LENGTH, 0L);
            this.lookAheadCount = parseInt(parser, KEY_LOOKAHEAD_COUNT, -1);
            this.isLive = parseBoolean(parser, KEY_IS_LIVE, false);
            putNormalizedAttribute(KEY_TIME_SCALE, Long.valueOf(this.timescale));
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void addChild(Object child) {
            if (child instanceof SmoothStreamingManifest.StreamElement) {
                this.streamElements.add((SmoothStreamingManifest.StreamElement) child);
            } else if (child instanceof SmoothStreamingManifest.ProtectionElement) {
                Assertions.checkState(this.protectionElement == null);
                this.protectionElement = (SmoothStreamingManifest.ProtectionElement) child;
            }
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public Object build() {
            SmoothStreamingManifest.StreamElement[] streamElementArray = new SmoothStreamingManifest.StreamElement[this.streamElements.size()];
            this.streamElements.toArray(streamElementArray);
            return new SmoothStreamingManifest(this.majorVersion, this.minorVersion, this.timescale, this.duration, this.dvrWindowLength, this.lookAheadCount, this.isLive, this.protectionElement, streamElementArray);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ProtectionElementParser.class */
    private static class ProtectionElementParser extends ElementParser {
        public static final String TAG = "Protection";
        public static final String TAG_PROTECTION_HEADER = "ProtectionHeader";
        public static final String KEY_SYSTEM_ID = "SystemID";
        private boolean inProtectionHeader;
        private UUID uuid;
        private byte[] initData;

        public ProtectionElementParser(ElementParser parent, String baseUri) {
            super(parent, baseUri, TAG);
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public boolean handleChildInline(String tag) {
            return TAG_PROTECTION_HEADER.equals(tag);
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseStartTag(XmlPullParser parser) {
            if (TAG_PROTECTION_HEADER.equals(parser.getName())) {
                this.inProtectionHeader = true;
                String uuidString = parser.getAttributeValue(null, KEY_SYSTEM_ID);
                this.uuid = UUID.fromString(stripCurlyBraces(uuidString));
            }
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseText(XmlPullParser parser) {
            if (this.inProtectionHeader) {
                this.initData = Base64.decode(parser.getText(), 0);
            }
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseEndTag(XmlPullParser parser) {
            if (TAG_PROTECTION_HEADER.equals(parser.getName())) {
                this.inProtectionHeader = false;
            }
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public Object build() {
            return new SmoothStreamingManifest.ProtectionElement(this.uuid, PsshAtomUtil.buildPsshAtom(this.uuid, this.initData));
        }

        private static String stripCurlyBraces(String uuidString) {
            if (uuidString.charAt(0) == '{' && uuidString.charAt(uuidString.length() - 1) == '}') {
                uuidString = uuidString.substring(1, uuidString.length() - 1);
            }
            return uuidString;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$StreamElementParser.class */
    private static class StreamElementParser extends ElementParser {
        public static final String TAG = "StreamIndex";
        private static final String TAG_STREAM_FRAGMENT = "c";
        private static final String KEY_TYPE = "Type";
        private static final String KEY_TYPE_AUDIO = "audio";
        private static final String KEY_TYPE_VIDEO = "video";
        private static final String KEY_TYPE_TEXT = "text";
        private static final String KEY_SUB_TYPE = "Subtype";
        private static final String KEY_NAME = "Name";
        private static final String KEY_QUALITY_LEVELS = "QualityLevels";
        private static final String KEY_URL = "Url";
        private static final String KEY_MAX_WIDTH = "MaxWidth";
        private static final String KEY_MAX_HEIGHT = "MaxHeight";
        private static final String KEY_DISPLAY_WIDTH = "DisplayWidth";
        private static final String KEY_DISPLAY_HEIGHT = "DisplayHeight";
        private static final String KEY_LANGUAGE = "Language";
        private static final String KEY_TIME_SCALE = "TimeScale";
        private static final String KEY_FRAGMENT_DURATION = "d";
        private static final String KEY_FRAGMENT_START_TIME = "t";
        private static final String KEY_FRAGMENT_REPEAT_COUNT = "r";
        private final String baseUri;
        private final List<SmoothStreamingManifest.TrackElement> tracks;
        private int type;
        private String subType;
        private long timescale;
        private String name;
        private int qualityLevels;
        private String url;
        private int maxWidth;
        private int maxHeight;
        private int displayWidth;
        private int displayHeight;
        private String language;
        private ArrayList<Long> startTimes;
        private long lastChunkDuration;

        public StreamElementParser(ElementParser parent, String baseUri) {
            super(parent, baseUri, TAG);
            this.baseUri = baseUri;
            this.tracks = new LinkedList();
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public boolean handleChildInline(String tag) {
            return TAG_STREAM_FRAGMENT.equals(tag);
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseStartTag(XmlPullParser parser) throws ParserException {
            if (TAG_STREAM_FRAGMENT.equals(parser.getName())) {
                parseStreamFragmentStartTag(parser);
            } else {
                parseStreamElementStartTag(parser);
            }
        }

        private void parseStreamFragmentStartTag(XmlPullParser parser) throws ParserException {
            int chunkIndex = this.startTimes.size();
            long startTime = parseLong(parser, KEY_FRAGMENT_START_TIME, -1L);
            if (startTime == -1) {
                if (chunkIndex == 0) {
                    startTime = 0;
                } else if (this.lastChunkDuration != -1) {
                    startTime = this.startTimes.get(chunkIndex - 1).longValue() + this.lastChunkDuration;
                } else {
                    throw new ParserException("Unable to infer start time");
                }
            }
            int chunkIndex2 = chunkIndex + 1;
            this.startTimes.add(Long.valueOf(startTime));
            this.lastChunkDuration = parseLong(parser, KEY_FRAGMENT_DURATION, -1L);
            long repeatCount = parseLong(parser, KEY_FRAGMENT_REPEAT_COUNT, 1L);
            if (repeatCount > 1 && this.lastChunkDuration == -1) {
                throw new ParserException("Repeated chunk with unspecified duration");
            }
            for (int i = 1; i < repeatCount; i++) {
                chunkIndex2++;
                this.startTimes.add(Long.valueOf(startTime + (this.lastChunkDuration * i)));
            }
        }

        private void parseStreamElementStartTag(XmlPullParser parser) throws ParserException {
            this.type = parseType(parser);
            putNormalizedAttribute(KEY_TYPE, Integer.valueOf(this.type));
            if (this.type == 2) {
                this.subType = parseRequiredString(parser, KEY_SUB_TYPE);
            } else {
                this.subType = parser.getAttributeValue(null, KEY_SUB_TYPE);
            }
            this.name = parser.getAttributeValue(null, KEY_NAME);
            this.qualityLevels = parseInt(parser, KEY_QUALITY_LEVELS, -1);
            this.url = parseRequiredString(parser, KEY_URL);
            this.maxWidth = parseInt(parser, KEY_MAX_WIDTH, -1);
            this.maxHeight = parseInt(parser, KEY_MAX_HEIGHT, -1);
            this.displayWidth = parseInt(parser, KEY_DISPLAY_WIDTH, -1);
            this.displayHeight = parseInt(parser, KEY_DISPLAY_HEIGHT, -1);
            this.language = parser.getAttributeValue(null, KEY_LANGUAGE);
            putNormalizedAttribute(KEY_LANGUAGE, this.language);
            this.timescale = parseInt(parser, KEY_TIME_SCALE, -1);
            if (this.timescale == -1) {
                this.timescale = ((Long) getNormalizedAttribute(KEY_TIME_SCALE)).longValue();
            }
            this.startTimes = new ArrayList<>();
        }

        private int parseType(XmlPullParser parser) throws ParserException {
            String value = parser.getAttributeValue(null, KEY_TYPE);
            if (value != null) {
                if ("audio".equalsIgnoreCase(value)) {
                    return 0;
                }
                if ("video".equalsIgnoreCase(value)) {
                    return 1;
                }
                if ("text".equalsIgnoreCase(value)) {
                    return 2;
                }
                throw new ParserException("Invalid key value[" + value + "]");
            }
            throw new MissingFieldException(KEY_TYPE);
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void addChild(Object child) {
            if (child instanceof SmoothStreamingManifest.TrackElement) {
                this.tracks.add((SmoothStreamingManifest.TrackElement) child);
            }
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public Object build() {
            SmoothStreamingManifest.TrackElement[] trackElements = new SmoothStreamingManifest.TrackElement[this.tracks.size()];
            this.tracks.toArray(trackElements);
            return new SmoothStreamingManifest.StreamElement(this.baseUri, this.url, this.type, this.subType, this.timescale, this.name, this.qualityLevels, this.maxWidth, this.maxHeight, this.displayWidth, this.displayHeight, this.language, trackElements, this.startTimes, this.lastChunkDuration);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser.class */
    private static class TrackElementParser extends ElementParser {
        public static final String TAG = "QualityLevel";
        private static final String KEY_INDEX = "Index";
        private static final String KEY_BITRATE = "Bitrate";
        private static final String KEY_CODEC_PRIVATE_DATA = "CodecPrivateData";
        private static final String KEY_SAMPLING_RATE = "SamplingRate";
        private static final String KEY_CHANNELS = "Channels";
        private static final String KEY_FOUR_CC = "FourCC";
        private static final String KEY_TYPE = "Type";
        private static final String KEY_LANGUAGE = "Language";
        private static final String KEY_MAX_WIDTH = "MaxWidth";
        private static final String KEY_MAX_HEIGHT = "MaxHeight";
        private final List<byte[]> csd;
        private int index;
        private int bitrate;
        private String mimeType;
        private int maxWidth;
        private int maxHeight;
        private int samplingRate;
        private int channels;
        private String language;

        public TrackElementParser(ElementParser parent, String baseUri) {
            super(parent, baseUri, TAG);
            this.csd = new LinkedList();
        }

        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public void parseStartTag(XmlPullParser parser) throws ParserException {
            int type = ((Integer) getNormalizedAttribute(KEY_TYPE)).intValue();
            this.index = parseInt(parser, KEY_INDEX, -1);
            this.bitrate = parseRequiredInt(parser, KEY_BITRATE);
            this.language = (String) getNormalizedAttribute(KEY_LANGUAGE);
            if (type == 1) {
                this.maxHeight = parseRequiredInt(parser, KEY_MAX_HEIGHT);
                this.maxWidth = parseRequiredInt(parser, KEY_MAX_WIDTH);
                this.mimeType = fourCCToMimeType(parseRequiredString(parser, KEY_FOUR_CC));
            } else {
                this.maxHeight = -1;
                this.maxWidth = -1;
                String fourCC = parser.getAttributeValue(null, KEY_FOUR_CC);
                this.mimeType = fourCC != null ? fourCCToMimeType(fourCC) : type == 0 ? MimeTypes.AUDIO_AAC : null;
            }
            if (type == 0) {
                this.samplingRate = parseRequiredInt(parser, KEY_SAMPLING_RATE);
                this.channels = parseRequiredInt(parser, KEY_CHANNELS);
            } else {
                this.samplingRate = -1;
                this.channels = -1;
            }
            String value = parser.getAttributeValue(null, KEY_CODEC_PRIVATE_DATA);
            if (value != null && value.length() > 0) {
                byte[] codecPrivateData = Util.getBytesFromHexString(value);
                byte[][] split = CodecSpecificDataUtil.splitNalUnits(codecPrivateData);
                if (split == null) {
                    this.csd.add(codecPrivateData);
                    return;
                }
                for (byte[] bArr : split) {
                    this.csd.add(bArr);
                }
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v9, types: [byte[]] */
        @Override // com.google.android.exoplayer.smoothstreaming.SmoothStreamingManifestParser.ElementParser
        public Object build() {
            byte[][] csdArray = (byte[][]) null;
            if (!this.csd.isEmpty()) {
                csdArray = new byte[this.csd.size()];
                this.csd.toArray(csdArray);
            }
            return new SmoothStreamingManifest.TrackElement(this.index, this.bitrate, this.mimeType, csdArray, this.maxWidth, this.maxHeight, this.samplingRate, this.channels, this.language);
        }

        private static String fourCCToMimeType(String fourCC) {
            if (fourCC.equalsIgnoreCase("H264") || fourCC.equalsIgnoreCase("X264") || fourCC.equalsIgnoreCase("AVC1") || fourCC.equalsIgnoreCase("DAVC")) {
                return MimeTypes.VIDEO_H264;
            }
            if (fourCC.equalsIgnoreCase("AAC") || fourCC.equalsIgnoreCase("AACL") || fourCC.equalsIgnoreCase("AACH") || fourCC.equalsIgnoreCase("AACP")) {
                return MimeTypes.AUDIO_AAC;
            }
            if (fourCC.equalsIgnoreCase("TTML")) {
                return MimeTypes.APPLICATION_TTML;
            }
            if (fourCC.equalsIgnoreCase("ac-3") || fourCC.equalsIgnoreCase("dac3")) {
                return MimeTypes.AUDIO_AC3;
            }
            if (fourCC.equalsIgnoreCase("ec-3") || fourCC.equalsIgnoreCase("dec3")) {
                return MimeTypes.AUDIO_E_AC3;
            }
            if (fourCC.equalsIgnoreCase("dtsc")) {
                return MimeTypes.AUDIO_DTS;
            }
            if (fourCC.equalsIgnoreCase("dtsh") || fourCC.equalsIgnoreCase("dtsl")) {
                return MimeTypes.AUDIO_DTS_HD;
            }
            if (fourCC.equalsIgnoreCase("dtse")) {
                return MimeTypes.AUDIO_DTS_EXPRESS;
            }
            if (fourCC.equalsIgnoreCase("opus")) {
                return MimeTypes.AUDIO_OPUS;
            }
            return null;
        }
    }
}
