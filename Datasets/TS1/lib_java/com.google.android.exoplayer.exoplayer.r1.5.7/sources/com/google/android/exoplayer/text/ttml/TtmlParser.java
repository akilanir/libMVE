package com.google.android.exoplayer.text.ttml;

import android.text.Layout;
import android.util.Log;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.text.SubtitleParser;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.ParserUtil;
import com.google.android.exoplayer.util.Util;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/ttml/TtmlParser.class */
public final class TtmlParser implements SubtitleParser {
    private static final String TAG = "TtmlParser";
    private static final String ATTR_BEGIN = "begin";
    private static final String ATTR_DURATION = "dur";
    private static final String ATTR_END = "end";
    private static final String ATTR_STYLE = "style";
    private static final Pattern CLOCK_TIME = Pattern.compile("^([0-9][0-9]+):([0-9][0-9]):([0-9][0-9])(?:(\\.[0-9]+)|:([0-9][0-9])(?:\\.([0-9]+))?)?$");
    private static final Pattern OFFSET_TIME = Pattern.compile("^([0-9]+(?:\\.[0-9]+)?)(h|m|s|ms|f|t)$");
    private static final Pattern FONT_SIZE = Pattern.compile("^(([0-9]*.)?[0-9]+)(px|em|%)$");
    private static final int DEFAULT_FRAMERATE = 30;
    private static final int DEFAULT_SUBFRAMERATE = 1;
    private static final int DEFAULT_TICKRATE = 1;
    private final XmlPullParserFactory xmlParserFactory;

    public TtmlParser() {
        try {
            this.xmlParserFactory = XmlPullParserFactory.newInstance();
        } catch (XmlPullParserException e) {
            throw new RuntimeException("Couldn't create XmlPullParserFactory instance", e);
        }
    }

    @Override // com.google.android.exoplayer.text.SubtitleParser
    public boolean canParse(String mimeType) {
        return MimeTypes.APPLICATION_TTML.equals(mimeType);
    }

    @Override // com.google.android.exoplayer.text.SubtitleParser
    public TtmlSubtitle parse(byte[] bytes, int offset, int length) throws ParserException {
        try {
            XmlPullParser xmlParser = this.xmlParserFactory.newPullParser();
            Map<String, TtmlStyle> globalStyles = new HashMap<>();
            ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes, offset, length);
            xmlParser.setInput(inputStream, null);
            TtmlSubtitle ttmlSubtitle = null;
            LinkedList<TtmlNode> nodeStack = new LinkedList<>();
            int unsupportedNodeDepth = 0;
            for (int eventType = xmlParser.getEventType(); eventType != 1; eventType = xmlParser.getEventType()) {
                TtmlNode parent = nodeStack.peekLast();
                if (unsupportedNodeDepth == 0) {
                    String name = xmlParser.getName();
                    if (eventType == 2) {
                        if (!isSupportedTag(name)) {
                            Log.i(TAG, "Ignoring unsupported tag: " + xmlParser.getName());
                            unsupportedNodeDepth++;
                        } else if (TtmlNode.TAG_HEAD.equals(name)) {
                            parseHeader(xmlParser, globalStyles);
                        } else {
                            try {
                                TtmlNode node = parseNode(xmlParser, parent);
                                nodeStack.addLast(node);
                                if (parent != null) {
                                    parent.addChild(node);
                                }
                            } catch (ParserException e) {
                                Log.w(TAG, "Suppressing parser error", e);
                                unsupportedNodeDepth++;
                            }
                        }
                    } else if (eventType == 4) {
                        parent.addChild(TtmlNode.buildTextNode(xmlParser.getText()));
                    } else if (eventType == 3) {
                        if (xmlParser.getName().equals(TtmlNode.TAG_TT)) {
                            ttmlSubtitle = new TtmlSubtitle(nodeStack.getLast(), globalStyles);
                        }
                        nodeStack.removeLast();
                    }
                } else if (eventType == 2) {
                    unsupportedNodeDepth++;
                } else if (eventType == 3) {
                    unsupportedNodeDepth--;
                }
                xmlParser.next();
            }
            return ttmlSubtitle;
        } catch (IOException e2) {
            throw new IllegalStateException("Unexpected error when reading input.", e2);
        } catch (XmlPullParserException xppe) {
            throw new ParserException("Unable to parse source", xppe);
        }
    }

    private Map<String, TtmlStyle> parseHeader(XmlPullParser xmlParser, Map<String, TtmlStyle> globalStyles) throws IOException, XmlPullParserException {
        do {
            xmlParser.next();
            if (ParserUtil.isStartTag(xmlParser, "style")) {
                String parentStyleId = xmlParser.getAttributeValue(null, "style");
                TtmlStyle style = parseStyleAttributes(xmlParser, new TtmlStyle());
                if (parentStyleId != null) {
                    String[] ids = parseStyleIds(parentStyleId);
                    for (String str : ids) {
                        style.chain(globalStyles.get(str));
                    }
                }
                if (style.getId() != null) {
                    globalStyles.put(style.getId(), style);
                }
            }
        } while (!ParserUtil.isEndTag(xmlParser, TtmlNode.TAG_HEAD));
        return globalStyles;
    }

    private String[] parseStyleIds(String parentStyleIds) {
        return parentStyleIds.split("\\s+");
    }

    private TtmlStyle parseStyleAttributes(XmlPullParser parser, TtmlStyle style) {
        String attributeValue;
        int attributeCount = parser.getAttributeCount();
        for (int i = 0; i < attributeCount; i++) {
            String attributeName = parser.getAttributeName(i);
            attributeValue = parser.getAttributeValue(i);
            switch (ParserUtil.removeNamespacePrefix(attributeName)) {
                case "id":
                    if ("style".equals(parser.getName())) {
                        style = createIfNull(style).setId(attributeValue);
                        break;
                    } else {
                        break;
                    }
                case "backgroundColor":
                    style = createIfNull(style);
                    try {
                        style.setBackgroundColor(TtmlColorParser.parseColor(attributeValue));
                        break;
                    } catch (IllegalArgumentException e) {
                        Log.w(TAG, "failed parsing background value: '" + attributeValue + "'");
                        break;
                    }
                case "color":
                    style = createIfNull(style);
                    try {
                        style.setColor(TtmlColorParser.parseColor(attributeValue));
                        break;
                    } catch (IllegalArgumentException e2) {
                        Log.w(TAG, "failed parsing color value: '" + attributeValue + "'");
                        break;
                    }
                case "fontFamily":
                    style = createIfNull(style).setFontFamily(attributeValue);
                    break;
                case "fontSize":
                    try {
                        style = createIfNull(style);
                        parseFontSize(attributeValue, style);
                        break;
                    } catch (ParserException e3) {
                        Log.w(TAG, "failed parsing fontSize value: '" + attributeValue + "'");
                        break;
                    }
                case "fontWeight":
                    style = createIfNull(style).setBold(TtmlNode.BOLD.equalsIgnoreCase(attributeValue));
                    break;
                case "fontStyle":
                    style = createIfNull(style).setItalic(TtmlNode.ITALIC.equalsIgnoreCase(attributeValue));
                    break;
                case "textAlign":
                    switch (Util.toLowerInvariant(attributeValue)) {
                        case "left":
                            style = createIfNull(style).setTextAlign(Layout.Alignment.ALIGN_NORMAL);
                            break;
                        case "start":
                            style = createIfNull(style).setTextAlign(Layout.Alignment.ALIGN_NORMAL);
                            break;
                        case "right":
                            style = createIfNull(style).setTextAlign(Layout.Alignment.ALIGN_OPPOSITE);
                            break;
                        case "end":
                            style = createIfNull(style).setTextAlign(Layout.Alignment.ALIGN_OPPOSITE);
                            break;
                        case "center":
                            style = createIfNull(style).setTextAlign(Layout.Alignment.ALIGN_CENTER);
                            break;
                    }
                case "textDecoration":
                    switch (Util.toLowerInvariant(attributeValue)) {
                        case "linethrough":
                            style = createIfNull(style).setLinethrough(true);
                            break;
                        case "nolinethrough":
                            style = createIfNull(style).setLinethrough(false);
                            break;
                        case "underline":
                            style = createIfNull(style).setUnderline(true);
                            break;
                        case "nounderline":
                            style = createIfNull(style).setUnderline(false);
                            break;
                    }
            }
        }
        return style;
    }

    private TtmlStyle createIfNull(TtmlStyle style) {
        return style == null ? new TtmlStyle() : style;
    }

    private TtmlNode parseNode(XmlPullParser parser, TtmlNode parent) throws ParserException {
        long duration = 0;
        long startTime = -1;
        long endTime = -1;
        String[] styleIds = null;
        int attributeCount = parser.getAttributeCount();
        TtmlStyle style = parseStyleAttributes(parser, null);
        for (int i = 0; i < attributeCount; i++) {
            String attr = ParserUtil.removeNamespacePrefix(parser.getAttributeName(i));
            String value = parser.getAttributeValue(i);
            if (attr.equals(ATTR_BEGIN)) {
                startTime = parseTimeExpression(value, DEFAULT_FRAMERATE, 1, 1);
            } else if (attr.equals("end")) {
                endTime = parseTimeExpression(value, DEFAULT_FRAMERATE, 1, 1);
            } else if (attr.equals(ATTR_DURATION)) {
                duration = parseTimeExpression(value, DEFAULT_FRAMERATE, 1, 1);
            } else if (attr.equals("style")) {
                String[] ids = parseStyleIds(value);
                if (ids.length > 0) {
                    styleIds = ids;
                }
            }
        }
        if (parent != null && parent.startTimeUs != -1) {
            if (startTime != -1) {
                startTime += parent.startTimeUs;
            }
            if (endTime != -1) {
                endTime += parent.startTimeUs;
            }
        }
        if (endTime == -1) {
            if (duration > 0) {
                endTime = startTime + duration;
            } else if (parent != null && parent.endTimeUs != -1) {
                endTime = parent.endTimeUs;
            }
        }
        return TtmlNode.buildNode(parser.getName(), startTime, endTime, style, styleIds);
    }

    private static boolean isSupportedTag(String tag) {
        if (tag.equals(TtmlNode.TAG_TT) || tag.equals(TtmlNode.TAG_HEAD) || tag.equals(TtmlNode.TAG_BODY) || tag.equals(TtmlNode.TAG_DIV) || tag.equals(TtmlNode.TAG_P) || tag.equals(TtmlNode.TAG_SPAN) || tag.equals(TtmlNode.TAG_BR) || tag.equals("style") || tag.equals(TtmlNode.TAG_STYLING) || tag.equals(TtmlNode.TAG_LAYOUT) || tag.equals(TtmlNode.TAG_REGION) || tag.equals(TtmlNode.TAG_METADATA) || tag.equals(TtmlNode.TAG_SMPTE_IMAGE) || tag.equals(TtmlNode.TAG_SMPTE_DATA) || tag.equals(TtmlNode.TAG_SMPTE_INFORMATION)) {
            return true;
        }
        return false;
    }

    private static void parseFontSize(String expression, TtmlStyle out) throws ParserException {
        Matcher matcher;
        String[] expressions = expression.split("\\s+");
        if (expressions.length == 1) {
            matcher = FONT_SIZE.matcher(expression);
        } else if (expressions.length == 2) {
            matcher = FONT_SIZE.matcher(expressions[1]);
            Log.w(TAG, "multiple values in fontSize attribute. Picking the second value for vertical font size and ignoring the first.");
        } else {
            throw new ParserException();
        }
        if (matcher.matches()) {
            String unit = matcher.group(3);
            switch (unit) {
                case "px":
                    out.setFontSizeUnit((short) 1);
                    break;
                case "em":
                    out.setFontSizeUnit((short) 2);
                    break;
                case "%":
                    out.setFontSizeUnit((short) 3);
                    break;
                default:
                    throw new ParserException();
            }
            out.setFontSize(Float.valueOf(matcher.group(1)).floatValue());
            return;
        }
        throw new ParserException();
    }

    private static long parseTimeExpression(String time, int frameRate, int subframeRate, int tickRate) throws ParserException {
        Matcher matcher = CLOCK_TIME.matcher(time);
        if (matcher.matches()) {
            String hours = matcher.group(1);
            double durationSeconds = Long.parseLong(hours) * 3600;
            String minutes = matcher.group(2);
            double durationSeconds2 = durationSeconds + (Long.parseLong(minutes) * 60);
            String seconds = matcher.group(3);
            double durationSeconds3 = durationSeconds2 + Long.parseLong(seconds);
            String fraction = matcher.group(4);
            double durationSeconds4 = durationSeconds3 + (fraction != null ? Double.parseDouble(fraction) : 0.0d);
            String frames = matcher.group(5);
            double durationSeconds5 = durationSeconds4 + (frames != null ? Long.parseLong(frames) / frameRate : 0.0d);
            String subframes = matcher.group(6);
            return (long) ((durationSeconds5 + (subframes != null ? (Long.parseLong(subframes) / subframeRate) / frameRate : 0.0d)) * 1000000.0d);
        }
        Matcher matcher2 = OFFSET_TIME.matcher(time);
        if (matcher2.matches()) {
            String timeValue = matcher2.group(1);
            double offsetSeconds = Double.parseDouble(timeValue);
            String unit = matcher2.group(2);
            if (unit.equals("h")) {
                offsetSeconds *= 3600.0d;
            } else if (unit.equals("m")) {
                offsetSeconds *= 60.0d;
            } else if (!unit.equals("s")) {
                if (unit.equals("ms")) {
                    offsetSeconds /= 1000.0d;
                } else if (unit.equals("f")) {
                    offsetSeconds /= frameRate;
                } else if (unit.equals("t")) {
                    offsetSeconds /= tickRate;
                }
            }
            return (long) (offsetSeconds * 1000000.0d);
        }
        throw new ParserException("Malformed time expression: " + time);
    }
}
