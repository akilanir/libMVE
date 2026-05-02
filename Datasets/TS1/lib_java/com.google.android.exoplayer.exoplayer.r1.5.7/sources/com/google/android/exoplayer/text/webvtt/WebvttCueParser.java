package com.google.android.exoplayer.text.webvtt;

import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import android.util.Log;
import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.webvtt.WebvttCue;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/webvtt/WebvttCueParser.class */
public final class WebvttCueParser {
    public static final Pattern CUE_HEADER_PATTERN = Pattern.compile("^(\\S+)\\s+-->\\s+(\\S+)(.*)?$");
    private static final Pattern COMMENT = Pattern.compile("^NOTE(( |\t).*)?$");
    private static final Pattern CUE_SETTING_PATTERN = Pattern.compile("(\\S+?):(\\S+)");
    private static final char CHAR_LESS_THAN = '<';
    private static final char CHAR_GREATER_THAN = '>';
    private static final char CHAR_SLASH = '/';
    private static final char CHAR_AMPERSAND = '&';
    private static final char CHAR_SEMI_COLON = ';';
    private static final char CHAR_SPACE = ' ';
    private static final String SPACE = " ";
    private static final String ENTITY_LESS_THAN = "lt";
    private static final String ENTITY_GREATER_THAN = "gt";
    private static final String ENTITY_AMPERSAND = "amp";
    private static final String ENTITY_NON_BREAK_SPACE = "nbsp";
    private static final String TAG_BOLD = "b";
    private static final String TAG_ITALIC = "i";
    private static final String TAG_UNDERLINE = "u";
    private static final String TAG_CLASS = "c";
    private static final String TAG_VOICE = "v";
    private static final String TAG_LANG = "lang";
    private static final int STYLE_BOLD = 1;
    private static final int STYLE_ITALIC = 2;
    private static final String TAG = "WebvttCueParser";
    private final StringBuilder textBuilder = new StringBuilder();

    boolean parseNextValidCue(ParsableByteArray webvttData, WebvttCue.Builder builder) {
        Matcher cueHeaderMatcher;
        do {
            cueHeaderMatcher = findNextCueHeader(webvttData);
            if (cueHeaderMatcher == null) {
                return false;
            }
        } while (!parseCue(cueHeaderMatcher, webvttData, builder, this.textBuilder));
        return true;
    }

    static void parseCueSettingsList(String cueSettingsList, WebvttCue.Builder builder) {
        Matcher cueSettingMatcher = CUE_SETTING_PATTERN.matcher(cueSettingsList);
        while (cueSettingMatcher.find()) {
            String name = cueSettingMatcher.group(1);
            String value = cueSettingMatcher.group(2);
            try {
                if ("line".equals(name)) {
                    parseLineAttribute(value, builder);
                } else if ("align".equals(name)) {
                    builder.setTextAlignment(parseTextAlignment(value));
                } else if ("position".equals(name)) {
                    parsePositionAttribute(value, builder);
                } else if ("size".equals(name)) {
                    builder.setWidth(WebvttParserUtil.parsePercentage(value));
                } else {
                    Log.w(TAG, "Unknown cue setting " + name + ":" + value);
                }
            } catch (NumberFormatException e) {
                Log.w(TAG, "Skipping bad cue setting: " + cueSettingMatcher.group());
            }
        }
    }

    public static Matcher findNextCueHeader(ParsableByteArray input) {
        String line;
        while (true) {
            String line2 = input.readLine();
            if (line2 != null) {
                if (COMMENT.matcher(line2).matches()) {
                    do {
                        line = input.readLine();
                        if (line != null) {
                        }
                    } while (!line.isEmpty());
                } else {
                    Matcher cueHeaderMatcher = CUE_HEADER_PATTERN.matcher(line2);
                    if (cueHeaderMatcher.matches()) {
                        return cueHeaderMatcher;
                    }
                }
            } else {
                return null;
            }
        }
    }

    static void parseCueText(String markup, WebvttCue.Builder builder) {
        SpannableStringBuilder spannedText = new SpannableStringBuilder();
        Stack<StartTag> startTagStack = new Stack<>();
        int pos = 0;
        while (pos < markup.length()) {
            char curr = markup.charAt(pos);
            switch (curr) {
                case '&':
                    int semiColonEnd = markup.indexOf(CHAR_SEMI_COLON, pos + 1);
                    int spaceEnd = markup.indexOf(32, pos + 1);
                    int entityEnd = semiColonEnd == -1 ? spaceEnd : spaceEnd == -1 ? semiColonEnd : Math.min(semiColonEnd, spaceEnd);
                    if (entityEnd != -1) {
                        applyEntity(markup.substring(pos + 1, entityEnd), spannedText);
                        if (entityEnd == spaceEnd) {
                            spannedText.append((CharSequence) SPACE);
                        }
                        pos = entityEnd + 1;
                        break;
                    } else {
                        spannedText.append(curr);
                        pos++;
                        break;
                    }
                case CHAR_LESS_THAN /* 60 */:
                    if (pos + 1 >= markup.length()) {
                        pos++;
                        break;
                    } else {
                        int ltPos = pos;
                        boolean isClosingTag = markup.charAt(ltPos + 1) == '/';
                        pos = findEndOfTag(markup, ltPos + 1);
                        boolean isVoidTag = markup.charAt(pos - 2) == '/';
                        String[] tagTokens = tokenizeTag(markup.substring(ltPos + (isClosingTag ? 2 : 1), isVoidTag ? pos - 2 : pos - 1));
                        if (tagTokens != null && isSupportedTag(tagTokens[0])) {
                            if (!isClosingTag) {
                                if (!isVoidTag) {
                                    startTagStack.push(new StartTag(tagTokens[0], spannedText.length()));
                                    break;
                                } else {
                                    break;
                                }
                            } else {
                                while (!startTagStack.isEmpty()) {
                                    StartTag startTag = startTagStack.pop();
                                    applySpansForTag(startTag, spannedText);
                                    if (startTag.name.equals(tagTokens[0])) {
                                        break;
                                    }
                                }
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                default:
                    spannedText.append(curr);
                    pos++;
                    break;
            }
        }
        while (!startTagStack.isEmpty()) {
            applySpansForTag(startTagStack.pop(), spannedText);
        }
        builder.setText(spannedText);
    }

    private static boolean parseCue(Matcher cueHeaderMatcher, ParsableByteArray webvttData, WebvttCue.Builder builder, StringBuilder textBuilder) {
        try {
            builder.setStartTime(WebvttParserUtil.parseTimestampUs(cueHeaderMatcher.group(1))).setEndTime(WebvttParserUtil.parseTimestampUs(cueHeaderMatcher.group(2)));
            parseCueSettingsList(cueHeaderMatcher.group(3), builder);
            textBuilder.setLength(0);
            while (true) {
                String line = webvttData.readLine();
                if (line == null || line.isEmpty()) {
                    break;
                }
                if (textBuilder.length() > 0) {
                    textBuilder.append("\n");
                }
                textBuilder.append(line.trim());
            }
            parseCueText(textBuilder.toString(), builder);
            return true;
        } catch (NumberFormatException e) {
            Log.w(TAG, "Skipping cue with bad header: " + cueHeaderMatcher.group());
            return false;
        }
    }

    private static void parseLineAttribute(String s, WebvttCue.Builder builder) throws NumberFormatException {
        int commaPosition = s.indexOf(44);
        if (commaPosition != -1) {
            builder.setLineAnchor(parsePositionAnchor(s.substring(commaPosition + 1)));
            s = s.substring(0, commaPosition);
        } else {
            builder.setLineAnchor(Cue.TYPE_UNSET);
        }
        if (s.endsWith("%")) {
            builder.setLine(WebvttParserUtil.parsePercentage(s)).setLineType(0);
        } else {
            builder.setLine(Integer.parseInt(s)).setLineType(1);
        }
    }

    private static void parsePositionAttribute(String s, WebvttCue.Builder builder) throws NumberFormatException {
        int commaPosition = s.indexOf(44);
        if (commaPosition != -1) {
            builder.setPositionAnchor(parsePositionAnchor(s.substring(commaPosition + 1)));
            s = s.substring(0, commaPosition);
        } else {
            builder.setPositionAnchor(Cue.TYPE_UNSET);
        }
        builder.setPosition(WebvttParserUtil.parsePercentage(s));
    }

    private static int parsePositionAnchor(String s) {
        switch (s) {
            case "start":
                return 0;
            case "center":
            case "middle":
                return 1;
            case "end":
                return 2;
            default:
                Log.w(TAG, "Invalid anchor value: " + s);
                return Cue.TYPE_UNSET;
        }
    }

    private static Layout.Alignment parseTextAlignment(String s) {
        switch (s) {
            case "start":
            case "left":
                return Layout.Alignment.ALIGN_NORMAL;
            case "center":
            case "middle":
                return Layout.Alignment.ALIGN_CENTER;
            case "end":
            case "right":
                return Layout.Alignment.ALIGN_OPPOSITE;
            default:
                Log.w(TAG, "Invalid alignment value: " + s);
                return null;
        }
    }

    private static int findEndOfTag(String markup, int startPos) {
        int idx = markup.indexOf(CHAR_GREATER_THAN, startPos);
        return idx == -1 ? markup.length() : idx + 1;
    }

    private static void applyEntity(String entity, SpannableStringBuilder spannedText) {
        switch (entity) {
            case "lt":
                spannedText.append('<');
                break;
            case "gt":
                spannedText.append('>');
                break;
            case "nbsp":
                spannedText.append(' ');
                break;
            case "amp":
                spannedText.append('&');
                break;
            default:
                Log.w(TAG, "ignoring unsupported entity: '&" + entity + ";'");
                break;
        }
    }

    private static boolean isSupportedTag(String tagName) {
        switch (tagName) {
            case "b":
            case "c":
            case "i":
            case "lang":
            case "u":
            case "v":
                return true;
            default:
                return false;
        }
    }

    private static void applySpansForTag(StartTag startTag, SpannableStringBuilder spannedText) {
        switch (startTag.name) {
            case "b":
                spannedText.setSpan(new StyleSpan(1), startTag.position, spannedText.length(), 33);
                break;
            case "i":
                spannedText.setSpan(new StyleSpan(2), startTag.position, spannedText.length(), 33);
                break;
            case "u":
                spannedText.setSpan(new UnderlineSpan(), startTag.position, spannedText.length(), 33);
                break;
        }
    }

    private static String[] tokenizeTag(String fullTagExpression) {
        String fullTagExpression2 = fullTagExpression.replace("\\s+", SPACE).trim();
        if (fullTagExpression2.length() == 0) {
            return null;
        }
        if (fullTagExpression2.contains(SPACE)) {
            fullTagExpression2 = fullTagExpression2.substring(0, fullTagExpression2.indexOf(SPACE));
        }
        return fullTagExpression2.split("\\.");
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/webvtt/WebvttCueParser$StartTag.class */
    private static final class StartTag {
        public final String name;
        public final int position;

        public StartTag(String name, int position) {
            this.position = position;
            this.name = name;
        }
    }
}
