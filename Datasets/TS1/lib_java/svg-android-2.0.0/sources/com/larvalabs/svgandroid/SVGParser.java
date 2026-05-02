package com.larvalabs.svgandroid;

import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Picture;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.FloatMath;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;
import java.util.StringTokenizer;
import java.util.regex.Pattern;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser.class */
public class SVGParser {
    static final String TAG = "SVGAndroid";
    private static boolean DISALLOW_DOCTYPE_DECL = true;
    private static final Pattern TRANSFORM_SEP = Pattern.compile("[\\s,]*");
    private static final RectF arcRectf = new RectF();
    private static final Matrix arcMatrix = new Matrix();
    private static final Matrix arcMatrix2 = new Matrix();

    public static Path parsePath(String pathString) {
        return doPath(pathString);
    }

    static SVG parse(InputSource data, SVGHandler handler) throws SVGParseException {
        try {
            Picture picture = new Picture();
            handler.setPicture(picture);
            SAXParserFactory spf = SAXParserFactory.newInstance();
            SAXParser sp = spf.newSAXParser();
            XMLReader xr = sp.getXMLReader();
            xr.setContentHandler(handler);
            xr.setFeature("http://xml.org/sax/features/validation", false);
            if (DISALLOW_DOCTYPE_DECL) {
                try {
                    xr.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
                } catch (SAXNotRecognizedException e) {
                    DISALLOW_DOCTYPE_DECL = false;
                }
            }
            xr.parse(data);
            SVG result = new SVG(picture, handler.bounds);
            if (!Float.isInfinite(handler.limits.top)) {
                result.setLimits(handler.limits);
            }
            return result;
        } catch (Exception e2) {
            Log.e(TAG, "Failed to parse SVG.", e2);
            throw new SVGParseException(e2);
        }
    }

    private static NumberParse parseNumbers(String s) {
        int n = s.length();
        int p = 0;
        ArrayList<Float> numbers = new ArrayList<>();
        boolean skipChar = false;
        boolean prevWasE = false;
        for (int i = 1; i < n; i++) {
            if (skipChar) {
                skipChar = false;
            } else {
                char c = s.charAt(i);
                switch (c) {
                    case '\t':
                    case '\n':
                    case ' ':
                    case ',':
                        break;
                    case 11:
                    case '\f':
                    case '\r':
                    case 14:
                    case 15:
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                    case '!':
                    case '\"':
                    case '#':
                    case '$':
                    case '%':
                    case '&':
                    case '\'':
                    case '(':
                    case '*':
                    case '+':
                    case '.':
                    case '/':
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                    case ':':
                    case ';':
                    case '<':
                    case '=':
                    case '>':
                    case '?':
                    case '@':
                    case 'B':
                    case 'D':
                    case 'E':
                    case 'F':
                    case 'G':
                    case 'I':
                    case 'J':
                    case 'K':
                    case 'N':
                    case 'O':
                    case 'P':
                    case 'R':
                    case 'U':
                    case 'W':
                    case 'X':
                    case 'Y':
                    case '[':
                    case '\\':
                    case ']':
                    case '^':
                    case '_':
                    case '`':
                    case 'b':
                    case 'd':
                    case 'f':
                    case 'g':
                    case 'i':
                    case 'j':
                    case 'k':
                    case 'n':
                    case 'o':
                    case 'p':
                    case 'r':
                    case 'u':
                    case 'w':
                    case 'x':
                    case 'y':
                    default:
                        prevWasE = false;
                        continue;
                    case ')':
                    case 'A':
                    case 'C':
                    case 'H':
                    case 'L':
                    case 'M':
                    case 'Q':
                    case 'S':
                    case 'T':
                    case 'V':
                    case 'Z':
                    case 'a':
                    case 'c':
                    case 'h':
                    case 'l':
                    case 'm':
                    case 'q':
                    case 's':
                    case 't':
                    case 'v':
                    case 'z':
                        String str = s.substring(p, i);
                        if (str.trim().length() > 0) {
                            Float f = Float.valueOf(Float.parseFloat(str));
                            numbers.add(f);
                        }
                        int p2 = i;
                        return new NumberParse(numbers, p2);
                    case '-':
                        if (prevWasE) {
                            prevWasE = false;
                            break;
                        }
                        break;
                    case 'e':
                        prevWasE = true;
                        continue;
                }
                String str2 = s.substring(p, i);
                if (str2.trim().length() > 0) {
                    Float f2 = Float.valueOf(Float.parseFloat(str2));
                    numbers.add(f2);
                    if (c == '-') {
                        p = i;
                    } else {
                        p = i + 1;
                        skipChar = true;
                    }
                } else {
                    p++;
                }
                prevWasE = false;
            }
        }
        String last = s.substring(p);
        if (last.length() > 0) {
            try {
                numbers.add(Float.valueOf(Float.parseFloat(last)));
            } catch (NumberFormatException e) {
            }
            p = s.length();
        }
        return new NumberParse(numbers, p);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Matrix parseTransform(String s) {
        Matrix matrix = new Matrix();
        while (true) {
            parseTransformItem(s, matrix);
            int rparen = s.indexOf(")");
            if (rparen <= 0 || s.length() <= rparen + 1) {
                break;
            }
            s = TRANSFORM_SEP.matcher(s.substring(rparen + 1)).replaceFirst("");
        }
        return matrix;
    }

    private static Matrix parseTransformItem(String s, Matrix matrix) {
        if (s.startsWith("matrix(")) {
            NumberParse np = parseNumbers(s.substring("matrix(".length()));
            if (np.numbers.size() == 6) {
                Matrix mat = new Matrix();
                mat.setValues(new float[]{((Float) np.numbers.get(0)).floatValue(), ((Float) np.numbers.get(2)).floatValue(), ((Float) np.numbers.get(4)).floatValue(), ((Float) np.numbers.get(1)).floatValue(), ((Float) np.numbers.get(3)).floatValue(), ((Float) np.numbers.get(5)).floatValue(), 0.0f, 0.0f, 1.0f});
                matrix.preConcat(mat);
            }
        } else if (s.startsWith("translate(")) {
            NumberParse np2 = parseNumbers(s.substring("translate(".length()));
            if (np2.numbers.size() > 0) {
                float tx = ((Float) np2.numbers.get(0)).floatValue();
                float ty = 0.0f;
                if (np2.numbers.size() > 1) {
                    ty = ((Float) np2.numbers.get(1)).floatValue();
                }
                matrix.preTranslate(tx, ty);
            }
        } else if (s.startsWith("scale(")) {
            NumberParse np3 = parseNumbers(s.substring("scale(".length()));
            if (np3.numbers.size() > 0) {
                float sx = ((Float) np3.numbers.get(0)).floatValue();
                float sy = sx;
                if (np3.numbers.size() > 1) {
                    sy = ((Float) np3.numbers.get(1)).floatValue();
                }
                matrix.preScale(sx, sy);
            }
        } else if (s.startsWith("skewX(")) {
            NumberParse np4 = parseNumbers(s.substring("skewX(".length()));
            if (np4.numbers.size() > 0) {
                float angle = ((Float) np4.numbers.get(0)).floatValue();
                matrix.preSkew((float) Math.tan(angle), 0.0f);
            }
        } else if (s.startsWith("skewY(")) {
            NumberParse np5 = parseNumbers(s.substring("skewY(".length()));
            if (np5.numbers.size() > 0) {
                float angle2 = ((Float) np5.numbers.get(0)).floatValue();
                matrix.preSkew(0.0f, (float) Math.tan(angle2));
            }
        } else if (s.startsWith("rotate(")) {
            NumberParse np6 = parseNumbers(s.substring("rotate(".length()));
            if (np6.numbers.size() > 0) {
                float angle3 = ((Float) np6.numbers.get(0)).floatValue();
                float cx = 0.0f;
                float cy = 0.0f;
                if (np6.numbers.size() > 2) {
                    cx = ((Float) np6.numbers.get(1)).floatValue();
                    cy = ((Float) np6.numbers.get(2)).floatValue();
                }
                matrix.preTranslate(-cx, -cy);
                matrix.preRotate(angle3);
                matrix.preTranslate(cx, cy);
            }
        } else {
            Log.w(TAG, "Invalid transform (" + s + ")");
        }
        return matrix;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Path doPath(String s) {
        int n = s.length();
        ParserHelper ph = new ParserHelper(s, 0);
        ph.skipWhitespace();
        Path p = new Path();
        float lastX = 0.0f;
        float lastY = 0.0f;
        float lastX1 = 0.0f;
        float lastY1 = 0.0f;
        float subPathStartX = 0.0f;
        float subPathStartY = 0.0f;
        char prevCmd = 0;
        while (ph.pos < n) {
            char cmd = s.charAt(ph.pos);
            switch (cmd) {
                case '+':
                case '-':
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    if (prevCmd == 'm' || prevCmd == 'M') {
                        cmd = (char) (prevCmd - 1);
                        break;
                    } else if ("lhvcsqta".indexOf(Character.toLowerCase(prevCmd)) >= 0) {
                        cmd = prevCmd;
                        break;
                    }
                    break;
                case ',':
                case '.':
                case '/':
                default:
                    ph.advance();
                    prevCmd = cmd;
                    break;
            }
            boolean wasCurve = false;
            switch (cmd) {
                case 'A':
                case 'a':
                    float rx = ph.nextFloat();
                    float ry = ph.nextFloat();
                    float theta = ph.nextFloat();
                    int largeArc = ph.nextFlag();
                    int sweepArc = ph.nextFlag();
                    float x = ph.nextFloat();
                    float y = ph.nextFloat();
                    if (cmd == 'a') {
                        x += lastX;
                        y += lastY;
                    }
                    drawArc(p, lastX, lastY, x, y, rx, ry, theta, largeArc, sweepArc);
                    lastX = x;
                    lastY = y;
                    break;
                case 'B':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'I':
                case 'J':
                case 'K':
                case 'N':
                case 'O':
                case 'P':
                case 'R':
                case 'U':
                case 'W':
                case 'X':
                case 'Y':
                case '[':
                case '\\':
                case ']':
                case '^':
                case '_':
                case '`':
                case 'b':
                case 'd':
                case 'e':
                case 'f':
                case 'g':
                case 'i':
                case 'j':
                case 'k':
                case 'n':
                case 'o':
                case 'p':
                case 'r':
                case 'u':
                case 'w':
                case 'x':
                case 'y':
                default:
                    Log.w(TAG, "Invalid path command: " + cmd);
                    ph.advance();
                    break;
                case 'C':
                case 'c':
                    wasCurve = true;
                    float x1 = ph.nextFloat();
                    float y1 = ph.nextFloat();
                    float x2 = ph.nextFloat();
                    float y2 = ph.nextFloat();
                    float x3 = ph.nextFloat();
                    float y3 = ph.nextFloat();
                    if (cmd == 'c') {
                        x1 += lastX;
                        x2 += lastX;
                        x3 += lastX;
                        y1 += lastY;
                        y2 += lastY;
                        y3 += lastY;
                    }
                    p.cubicTo(x1, y1, x2, y2, x3, y3);
                    lastX1 = x2;
                    lastY1 = y2;
                    lastX = x3;
                    lastY = y3;
                    break;
                case 'H':
                case 'h':
                    float x4 = ph.nextFloat();
                    if (cmd == 'h') {
                        p.rLineTo(x4, 0.0f);
                        lastX += x4;
                        break;
                    } else {
                        p.lineTo(x4, lastY);
                        lastX = x4;
                        break;
                    }
                case 'L':
                case 'T':
                case 'l':
                case 't':
                    float x5 = ph.nextFloat();
                    float y4 = ph.nextFloat();
                    if (cmd == 'l') {
                        p.rLineTo(x5, y4);
                        lastX += x5;
                        lastY += y4;
                        break;
                    } else {
                        p.lineTo(x5, y4);
                        lastX = x5;
                        lastY = y4;
                        break;
                    }
                case 'M':
                case 'm':
                    float x6 = ph.nextFloat();
                    float y5 = ph.nextFloat();
                    if (cmd == 'm') {
                        subPathStartX += x6;
                        subPathStartY += y5;
                        p.rMoveTo(x6, y5);
                        lastX += x6;
                        lastY += y5;
                        break;
                    } else {
                        subPathStartX = x6;
                        subPathStartY = y5;
                        p.moveTo(x6, y5);
                        lastX = x6;
                        lastY = y5;
                        break;
                    }
                case 'Q':
                case 'S':
                case 'q':
                case 's':
                    wasCurve = true;
                    float x22 = ph.nextFloat();
                    float y22 = ph.nextFloat();
                    float x7 = ph.nextFloat();
                    float y6 = ph.nextFloat();
                    if (Character.isLowerCase(cmd)) {
                        x22 += lastX;
                        x7 += lastX;
                        y22 += lastY;
                        y6 += lastY;
                    }
                    p.cubicTo((2.0f * lastX) - lastX1, (2.0f * lastY) - lastY1, x22, y22, x7, y6);
                    lastX1 = x22;
                    lastY1 = y22;
                    lastX = x7;
                    lastY = y6;
                    break;
                case 'V':
                case 'v':
                    float y7 = ph.nextFloat();
                    if (cmd == 'v') {
                        p.rLineTo(0.0f, y7);
                        lastY += y7;
                        break;
                    } else {
                        p.lineTo(lastX, y7);
                        lastY = y7;
                        break;
                    }
                case 'Z':
                case 'z':
                    p.close();
                    p.moveTo(subPathStartX, subPathStartY);
                    lastX = subPathStartX;
                    lastY = subPathStartY;
                    lastX1 = subPathStartX;
                    lastY1 = subPathStartY;
                    wasCurve = true;
                    break;
            }
            if (!wasCurve) {
                lastX1 = lastX;
                lastY1 = lastY;
            }
            ph.skipWhitespace();
        }
        return p;
    }

    private static float angle(float x1, float y1, float x2, float y2) {
        return ((float) Math.toDegrees(Math.atan2(x1, y1) - Math.atan2(x2, y2))) % 360.0f;
    }

    private static void drawArc(Path p, float lastX, float lastY, float x, float y, float rx, float ry, float theta, int largeArc, int sweepArc) {
        if (rx == 0.0f || ry == 0.0f) {
            p.lineTo(x, y);
            return;
        }
        if (x == lastX && y == lastY) {
            return;
        }
        float rx2 = Math.abs(rx);
        float ry2 = Math.abs(ry);
        float thrad = (theta * 3.1415927f) / 180.0f;
        float st = FloatMath.sin(thrad);
        float ct = FloatMath.cos(thrad);
        float xc = (lastX - x) / 2.0f;
        float yc = (lastY - y) / 2.0f;
        float x1t = (ct * xc) + (st * yc);
        float y1t = ((-st) * xc) + (ct * yc);
        float x1ts = x1t * x1t;
        float y1ts = y1t * y1t;
        float rxs = rx2 * rx2;
        float rys = ry2 * ry2;
        float lambda = ((x1ts / rxs) + (y1ts / rys)) * 1.001f;
        if (lambda > 1.0f) {
            float lambdasr = FloatMath.sqrt(lambda);
            rx2 *= lambdasr;
            ry2 *= lambdasr;
            rxs = rx2 * rx2;
            rys = ry2 * ry2;
        }
        float R = FloatMath.sqrt((((rxs * rys) - (rxs * y1ts)) - (rys * x1ts)) / ((rxs * y1ts) + (rys * x1ts))) * (largeArc == sweepArc ? -1 : 1);
        float cxt = ((R * rx2) * y1t) / ry2;
        float cyt = (((-R) * ry2) * x1t) / rx2;
        float cx = ((ct * cxt) - (st * cyt)) + ((lastX + x) / 2.0f);
        float cy = (st * cxt) + (ct * cyt) + ((lastY + y) / 2.0f);
        float th1 = angle(1.0f, 0.0f, (x1t - cxt) / rx2, (y1t - cyt) / ry2);
        float dth = angle((x1t - cxt) / rx2, (y1t - cyt) / ry2, ((-x1t) - cxt) / rx2, ((-y1t) - cyt) / ry2);
        if (sweepArc == 0 && dth > 0.0f) {
            dth -= 360.0f;
        } else if (sweepArc != 0 && dth < 0.0f) {
            dth += 360.0f;
        }
        if (theta % 360.0f == 0.0f) {
            arcRectf.set(cx - rx2, cy - ry2, cx + rx2, cy + ry2);
            p.arcTo(arcRectf, th1, dth);
            return;
        }
        arcRectf.set(-rx2, -ry2, rx2, ry2);
        arcMatrix.reset();
        arcMatrix.postRotate(theta);
        arcMatrix.postTranslate(cx, cy);
        arcMatrix.invert(arcMatrix2);
        p.transform(arcMatrix2);
        p.arcTo(arcRectf, th1, dth);
        p.transform(arcMatrix);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static NumberParse getNumberParseAttr(String name, Attributes attributes) {
        int n = attributes.getLength();
        for (int i = 0; i < n; i++) {
            if (attributes.getLocalName(i).equals(name)) {
                return parseNumbers(attributes.getValue(i));
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getStringAttr(String name, Attributes attributes) {
        int n = attributes.getLength();
        for (int i = 0; i < n; i++) {
            if (attributes.getLocalName(i).equals(name)) {
                return attributes.getValue(i);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Float getFloatAttr(String name, Attributes attributes) {
        return getFloatAttr(name, attributes, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Float getFloatAttr(String name, Attributes attributes, Float defaultValue) {
        String v = getStringAttr(name, attributes);
        return parseFloatValue(v, defaultValue);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Float parseFloatValue(String str, Float defaultValue) {
        if (str == null) {
            return defaultValue;
        }
        if (str.endsWith("px")) {
            str = str.substring(0, str.length() - 2);
        } else if (str.endsWith("%")) {
            return Float.valueOf(Float.parseFloat(str.substring(0, str.length() - 1)) / 100.0f);
        }
        return Float.valueOf(Float.parseFloat(str));
    }

    /* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser$NumberParse.class */
    private static class NumberParse {
        private ArrayList<Float> numbers;
        private int nextCmd;

        public NumberParse(ArrayList<Float> numbers, int nextCmd) {
            this.numbers = numbers;
            this.nextCmd = nextCmd;
        }

        public int getNextCmd() {
            return this.nextCmd;
        }

        public float getNumber(int index) {
            return this.numbers.get(index).floatValue();
        }
    }

    /* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser$Gradient.class */
    private static class Gradient {
        String id;
        String xlink;
        boolean isLinear;
        float x1;
        float y1;
        float x2;
        float y2;
        float x;
        float y;
        float radius;
        ArrayList<Float> positions;
        ArrayList<Integer> colors;
        Matrix matrix;
        public Shader shader;
        public boolean boundingBox;
        public Shader.TileMode tilemode;

        private Gradient() {
            this.positions = new ArrayList<>();
            this.colors = new ArrayList<>();
            this.matrix = null;
            this.shader = null;
            this.boundingBox = false;
        }

        public Gradient createChild(Gradient g) {
            Gradient child = new Gradient();
            child.id = g.id;
            child.xlink = this.id;
            child.isLinear = g.isLinear;
            child.x1 = g.x1;
            child.x2 = g.x2;
            child.y1 = g.y1;
            child.y2 = g.y2;
            child.x = g.x;
            child.y = g.y;
            child.radius = g.radius;
            child.positions = this.positions;
            child.colors = this.colors;
            child.matrix = this.matrix;
            if (g.matrix != null) {
                if (this.matrix == null) {
                    child.matrix = g.matrix;
                } else {
                    Matrix m = new Matrix(this.matrix);
                    m.preConcat(g.matrix);
                    child.matrix = m;
                }
            }
            child.boundingBox = g.boundingBox;
            child.shader = g.shader;
            child.tilemode = g.tilemode;
            return child;
        }
    }

    /* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser$StyleSet.class */
    private static class StyleSet {
        HashMap<String, String> styleMap;

        private StyleSet(String string) {
            this.styleMap = new HashMap<>();
            String[] styles = string.split(";");
            for (String s : styles) {
                String[] style = s.split(":");
                if (style.length == 2) {
                    this.styleMap.put(style[0], style[1]);
                }
            }
        }

        public String getStyle(String name) {
            return this.styleMap.get(name);
        }
    }

    /* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser$Properties.class */
    private static class Properties {
        StyleSet styles;
        Attributes atts;

        private Properties(Attributes atts) {
            this.styles = null;
            this.atts = atts;
            String styleAttr = SVGParser.getStringAttr("style", atts);
            if (styleAttr != null) {
                this.styles = new StyleSet(styleAttr);
            }
        }

        public String getAttr(String name) {
            String v = null;
            if (this.styles != null) {
                v = this.styles.getStyle(name);
            }
            if (v == null) {
                v = SVGParser.getStringAttr(name, this.atts);
            }
            return v;
        }

        public String getString(String name) {
            return getAttr(name);
        }

        private Integer rgb(int r, int g, int b) {
            return Integer.valueOf(((r & 255) << 16) | ((g & 255) << 8) | (b & 255));
        }

        private int parseNum(String v) throws NumberFormatException {
            if (v.endsWith("%")) {
                return Math.round((Float.parseFloat(v.substring(0, v.length() - 1)) / 100.0f) * 255.0f);
            }
            return Integer.parseInt(v);
        }

        public Integer getColor(String name) {
            String v = getAttr(name);
            if (v == null) {
                return null;
            }
            if (v.startsWith("#")) {
                try {
                    int c = Integer.parseInt(v.substring(1), 16);
                    return Integer.valueOf(v.length() == 4 ? hex3Tohex6(c) : c);
                } catch (NumberFormatException e) {
                    return null;
                }
            }
            if (v.startsWith("rgb(") && v.endsWith(")")) {
                String[] values = v.substring(4, v.length() - 1).split(",");
                try {
                    return rgb(parseNum(values[0]), parseNum(values[1]), parseNum(values[2]));
                } catch (ArrayIndexOutOfBoundsException e2) {
                    return null;
                } catch (NumberFormatException e3) {
                    return null;
                }
            }
            return SVGColors.mapColour(v);
        }

        private int hex3Tohex6(int x) {
            return ((x & 3840) << 8) | ((x & 3840) << 12) | ((x & 240) << 4) | ((x & 240) << 8) | ((x & 15) << 4) | (x & 15);
        }

        public Float getFloat(String name, float defaultValue) {
            Float v = getFloat(name);
            if (v == null) {
                return Float.valueOf(defaultValue);
            }
            return v;
        }

        public Float getFloat(String name) {
            String v = getAttr(name);
            if (v == null) {
                return null;
            }
            try {
                return Float.valueOf(Float.parseFloat(v));
            } catch (NumberFormatException e) {
                return null;
            }
        }
    }

    /* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGParser$SVGHandler.class */
    static class SVGHandler extends DefaultHandler {
        private Picture picture;
        private Canvas canvas;
        private Float limitsAdjustmentX;
        private Float limitsAdjustmentY;
        Paint fillPaint;
        Integer canvasRestoreCount;
        boolean strokeSet = false;
        Stack<Paint> strokePaintStack = new Stack<>();
        Stack<Boolean> strokeSetStack = new Stack<>();
        boolean fillSet = false;
        Stack<Paint> fillPaintStack = new Stack<>();
        Stack<Boolean> fillSetStack = new Stack<>();
        RectF rect = new RectF();
        RectF bounds = null;
        RectF limits = new RectF(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);
        Integer searchColor = null;
        Integer replaceColor = null;
        boolean whiteMode = false;
        Stack<Boolean> transformStack = new Stack<>();
        Stack<Matrix> matrixStack = new Stack<>();
        HashMap<String, Gradient> gradientMap = new HashMap<>();
        Gradient gradient = null;
        private final Matrix gradMatrix = new Matrix();
        private boolean hidden = false;
        private int hiddenLevel = 0;
        private boolean boundsMode = false;
        private final RectF tmpLimitRect = new RectF();
        Paint strokePaint = new Paint();

        public SVGHandler() {
            this.strokePaint.setAntiAlias(true);
            this.strokePaint.setStyle(Paint.Style.STROKE);
            this.fillPaint = new Paint();
            this.fillPaint.setAntiAlias(true);
            this.fillPaint.setStyle(Paint.Style.FILL);
            this.matrixStack.push(new Matrix());
        }

        void setPicture(Picture picture) {
            this.picture = picture;
        }

        public void setColorSwap(Integer searchColor, Integer replaceColor) {
            this.searchColor = searchColor;
            this.replaceColor = replaceColor;
        }

        public void setWhiteMode(boolean whiteMode) {
            this.whiteMode = whiteMode;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startDocument() throws SAXException {
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endDocument() throws SAXException {
        }

        private boolean doFill(Properties atts, RectF bounding_box) {
            if ("none".equals(atts.getString("display"))) {
                return false;
            }
            if (this.whiteMode) {
                this.fillPaint.setShader(null);
                this.fillPaint.setColor(-1);
                return true;
            }
            String fillString = atts.getString("fill");
            if (fillString != null) {
                if (fillString.startsWith("url(#")) {
                    String id = fillString.substring("url(#".length(), fillString.length() - 1);
                    Gradient g = this.gradientMap.get(id);
                    Shader shader = null;
                    if (g != null) {
                        shader = g.shader;
                    }
                    if (shader != null) {
                        this.fillPaint.setShader(shader);
                        this.gradMatrix.set(g.matrix);
                        if (g.boundingBox && bounding_box != null) {
                            this.gradMatrix.preTranslate(bounding_box.left, bounding_box.top);
                            this.gradMatrix.preScale(bounding_box.width(), bounding_box.height());
                        }
                        shader.setLocalMatrix(this.gradMatrix);
                        return true;
                    }
                    Log.w(SVGParser.TAG, "Didn't find shader, using black: " + id);
                    this.fillPaint.setShader(null);
                    doColor(atts, -16777216, true, this.fillPaint);
                    return true;
                }
                if (fillString.equalsIgnoreCase("none")) {
                    this.fillPaint.setShader(null);
                    this.fillPaint.setColor(0);
                    return true;
                }
                this.fillPaint.setShader(null);
                Integer color = atts.getColor("fill");
                if (color != null) {
                    doColor(atts, color, true, this.fillPaint);
                    return true;
                }
                Log.w(SVGParser.TAG, "Unrecognized fill color, using black: " + fillString);
                doColor(atts, -16777216, true, this.fillPaint);
                return true;
            }
            if (this.fillSet) {
                return this.fillPaint.getColor() != 0;
            }
            this.fillPaint.setShader(null);
            this.fillPaint.setColor(-16777216);
            return true;
        }

        private boolean doStroke(Properties atts) {
            if (this.whiteMode || "none".equals(atts.getString("display"))) {
                return false;
            }
            Float width = atts.getFloat("stroke-width");
            if (width != null) {
                this.strokePaint.setStrokeWidth(width.floatValue());
            }
            String linecap = atts.getString("stroke-linecap");
            if ("round".equals(linecap)) {
                this.strokePaint.setStrokeCap(Paint.Cap.ROUND);
            } else if ("square".equals(linecap)) {
                this.strokePaint.setStrokeCap(Paint.Cap.SQUARE);
            } else if ("butt".equals(linecap)) {
                this.strokePaint.setStrokeCap(Paint.Cap.BUTT);
            }
            String linejoin = atts.getString("stroke-linejoin");
            if ("miter".equals(linejoin)) {
                this.strokePaint.setStrokeJoin(Paint.Join.MITER);
            } else if ("round".equals(linejoin)) {
                this.strokePaint.setStrokeJoin(Paint.Join.ROUND);
            } else if ("bevel".equals(linejoin)) {
                this.strokePaint.setStrokeJoin(Paint.Join.BEVEL);
            }
            pathStyleHelper(atts.getString("stroke-dasharray"), atts.getString("stroke-dashoffset"));
            String strokeString = atts.getAttr("stroke");
            if (strokeString != null) {
                if (strokeString.equalsIgnoreCase("none")) {
                    this.strokePaint.setColor(0);
                    return false;
                }
                Integer color = atts.getColor("stroke");
                if (color != null) {
                    doColor(atts, color, false, this.strokePaint);
                    return true;
                }
                Log.w(SVGParser.TAG, "Unrecognized stroke color, using none: " + strokeString);
                this.strokePaint.setColor(0);
                return false;
            }
            if (this.strokeSet) {
                return this.strokePaint.getColor() != 0;
            }
            this.strokePaint.setColor(0);
            return false;
        }

        private Gradient doGradient(boolean isLinear, Attributes atts) {
            Gradient gradient = new Gradient();
            gradient.id = SVGParser.getStringAttr("id", atts);
            gradient.isLinear = isLinear;
            if (isLinear) {
                gradient.x1 = SVGParser.getFloatAttr("x1", atts, Float.valueOf(0.0f)).floatValue();
                gradient.x2 = SVGParser.getFloatAttr("x2", atts, Float.valueOf(1.0f)).floatValue();
                gradient.y1 = SVGParser.getFloatAttr("y1", atts, Float.valueOf(0.0f)).floatValue();
                gradient.y2 = SVGParser.getFloatAttr("y2", atts, Float.valueOf(0.0f)).floatValue();
            } else {
                gradient.x = SVGParser.getFloatAttr("cx", atts, Float.valueOf(0.0f)).floatValue();
                gradient.y = SVGParser.getFloatAttr("cy", atts, Float.valueOf(0.0f)).floatValue();
                gradient.radius = SVGParser.getFloatAttr("r", atts, Float.valueOf(0.0f)).floatValue();
            }
            String transform = SVGParser.getStringAttr("gradientTransform", atts);
            if (transform != null) {
                gradient.matrix = SVGParser.parseTransform(transform);
            }
            String spreadMethod = SVGParser.getStringAttr("spreadMethod", atts);
            if (spreadMethod == null) {
                spreadMethod = "pad";
            }
            gradient.tilemode = spreadMethod.equals("reflect") ? Shader.TileMode.MIRROR : spreadMethod.equals("repeat") ? Shader.TileMode.REPEAT : Shader.TileMode.CLAMP;
            String unit = SVGParser.getStringAttr("gradientUnits", atts);
            if (unit == null) {
                unit = "objectBoundingBox";
            }
            gradient.boundingBox = !unit.equals("userSpaceOnUse");
            String xlink = SVGParser.getStringAttr("href", atts);
            if (xlink != null) {
                if (xlink.startsWith("#")) {
                    xlink = xlink.substring(1);
                }
                gradient.xlink = xlink;
            }
            return gradient;
        }

        private void doColor(Properties atts, Integer color, boolean fillMode, Paint paint) {
            int c = (16777215 & color.intValue()) | (-16777216);
            if (this.searchColor != null && this.searchColor.intValue() == c) {
                c = this.replaceColor.intValue();
            }
            paint.setShader(null);
            paint.setColor(c);
            Float opacity = atts.getFloat("opacity");
            if (opacity == null) {
                opacity = atts.getFloat(fillMode ? "fill-opacity" : "stroke-opacity");
            }
            if (opacity == null) {
                paint.setAlpha(255);
            } else {
                paint.setAlpha((int) (255.0f * opacity.floatValue()));
            }
        }

        private void pathStyleHelper(String style, String offset) {
            if (style == null) {
                return;
            }
            if (style.equals("none")) {
                this.strokePaint.setPathEffect(null);
                return;
            }
            StringTokenizer st = new StringTokenizer(style, " ,");
            int count = st.countTokens();
            float[] intervals = new float[(count & 1) == 1 ? count * 2 : count];
            float max = 0.0f;
            float current = 1.0f;
            int i = 0;
            while (st.hasMoreTokens()) {
                int i2 = i;
                i++;
                float f = toFloat(st.nextToken(), current);
                current = f;
                intervals[i2] = f;
                max += current;
            }
            int start = 0;
            while (i < intervals.length) {
                float f2 = intervals[start];
                intervals[i] = f2;
                max += f2;
                i++;
                start++;
            }
            float off = 0.0f;
            if (offset != null) {
                try {
                    off = Float.parseFloat(offset) % max;
                } catch (NumberFormatException e) {
                }
            }
            this.strokePaint.setPathEffect(new DashPathEffect(intervals, off));
        }

        private static float toFloat(String s, float dflt) {
            float result = dflt;
            try {
                result = Float.parseFloat(s);
            } catch (NumberFormatException e) {
            }
            return result;
        }

        private void doLimits2(float x, float y) {
            if (x < this.limits.left) {
                this.limits.left = x;
            }
            if (x > this.limits.right) {
                this.limits.right = x;
            }
            if (y < this.limits.top) {
                this.limits.top = y;
            }
            if (y > this.limits.bottom) {
                this.limits.bottom = y;
            }
        }

        private void doLimits(RectF box, Paint paint) {
            Matrix m = this.matrixStack.peek();
            m.mapRect(this.tmpLimitRect, box);
            float width2 = paint == null ? 0.0f : paint.getStrokeWidth() / 2.0f;
            doLimits2(this.tmpLimitRect.left - width2, this.tmpLimitRect.top - width2);
            doLimits2(this.tmpLimitRect.right + width2, this.tmpLimitRect.bottom + width2);
        }

        private void doLimits(RectF box) {
            doLimits(box, null);
        }

        private void pushTransform(Attributes atts) {
            String transform = SVGParser.getStringAttr("transform", atts);
            boolean pushed = transform != null;
            this.transformStack.push(Boolean.valueOf(pushed));
            if (pushed) {
                Matrix matrix = SVGParser.parseTransform(transform);
                this.canvas.save();
                this.canvas.concat(matrix);
                matrix.postConcat(this.matrixStack.peek());
                this.matrixStack.push(matrix);
            }
        }

        private void popTransform() {
            if (this.transformStack.pop().booleanValue()) {
                this.canvas.restore();
                this.matrixStack.pop();
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
            Float radiusY;
            Float radiusX;
            this.strokePaint.setAlpha(255);
            this.fillPaint.setAlpha(255);
            if (this.boundsMode) {
                if (localName.equals("rect")) {
                    Float x = SVGParser.getFloatAttr("x", atts);
                    if (x == null) {
                        x = Float.valueOf(0.0f);
                    }
                    Float y = SVGParser.getFloatAttr("y", atts);
                    if (y == null) {
                        y = Float.valueOf(0.0f);
                    }
                    this.bounds = new RectF(x.floatValue(), y.floatValue(), x.floatValue() + SVGParser.getFloatAttr("width", atts).floatValue(), y.floatValue() + SVGParser.getFloatAttr("height", atts).floatValue());
                    return;
                }
                return;
            }
            if (localName.equals("svg")) {
                this.canvas = null;
                String viewboxStr = SVGParser.getStringAttr("viewBox", atts);
                if (viewboxStr != null) {
                    String[] dims = viewboxStr.split("\\s+");
                    if (dims.length == 4) {
                        Float x1 = SVGParser.parseFloatValue(dims[0], null);
                        Float y1 = SVGParser.parseFloatValue(dims[1], null);
                        Float x2 = SVGParser.parseFloatValue(dims[2], null);
                        Float y2 = SVGParser.parseFloatValue(dims[3], null);
                        if (x1 != null && x2 != null && y1 != null && y2 != null) {
                            float width = FloatMath.ceil(x2.floatValue() - x1.floatValue());
                            float height = FloatMath.ceil(y2.floatValue() - y1.floatValue());
                            this.canvas = this.picture.beginRecording((int) width, (int) height);
                            this.canvasRestoreCount = Integer.valueOf(this.canvas.save());
                            this.canvas.clipRect(0.0f, 0.0f, width, height);
                            this.limitsAdjustmentX = Float.valueOf(-x1.floatValue());
                            this.limitsAdjustmentY = Float.valueOf(-y1.floatValue());
                            this.canvas.translate(this.limitsAdjustmentX.floatValue(), this.limitsAdjustmentY.floatValue());
                        }
                    }
                }
                if (this.canvas == null) {
                    this.canvas = this.picture.beginRecording((int) FloatMath.ceil(SVGParser.getFloatAttr("width", atts).floatValue()), (int) FloatMath.ceil(SVGParser.getFloatAttr("height", atts).floatValue()));
                    this.canvasRestoreCount = null;
                    return;
                }
                return;
            }
            if (!localName.equals("defs")) {
                if (localName.equals("linearGradient")) {
                    this.gradient = doGradient(true, atts);
                    return;
                }
                if (localName.equals("radialGradient")) {
                    this.gradient = doGradient(false, atts);
                    return;
                }
                if (localName.equals("stop")) {
                    if (this.gradient != null) {
                        Properties props = new Properties(atts);
                        float offset = props.getFloat("offset", 0.0f).floatValue();
                        int color = props.getColor("stop-color").intValue();
                        float alpha = props.getFloat("stop-opacity", 1.0f).floatValue();
                        int alphaInt = Math.round(255.0f * alpha);
                        this.gradient.positions.add(Float.valueOf(offset));
                        this.gradient.colors.add(Integer.valueOf(color | (alphaInt << 24)));
                        return;
                    }
                    return;
                }
                if (localName.equals("g")) {
                    if ("bounds".equalsIgnoreCase(SVGParser.getStringAttr("id", atts))) {
                        this.boundsMode = true;
                    }
                    if (this.hidden) {
                        this.hiddenLevel++;
                    }
                    if ("none".equals(SVGParser.getStringAttr("display", atts)) && !this.hidden) {
                        this.hidden = true;
                        this.hiddenLevel = 1;
                    }
                    pushTransform(atts);
                    Properties props2 = new Properties(atts);
                    this.fillPaintStack.push(new Paint(this.fillPaint));
                    this.strokePaintStack.push(new Paint(this.strokePaint));
                    this.fillSetStack.push(Boolean.valueOf(this.fillSet));
                    this.strokeSetStack.push(Boolean.valueOf(this.strokeSet));
                    doFill(props2, null);
                    doStroke(props2);
                    this.fillSet |= props2.getString("fill") != null;
                    this.strokeSet |= props2.getString("stroke") != null;
                    return;
                }
                if (!this.hidden && localName.equals("rect")) {
                    Float x3 = SVGParser.getFloatAttr("x", atts);
                    if (x3 == null) {
                        x3 = Float.valueOf(0.0f);
                    }
                    Float y3 = SVGParser.getFloatAttr("y", atts);
                    if (y3 == null) {
                        y3 = Float.valueOf(0.0f);
                    }
                    Float width2 = SVGParser.getFloatAttr("width", atts);
                    Float height2 = SVGParser.getFloatAttr("height", atts);
                    Float rx = SVGParser.getFloatAttr("rx", atts, Float.valueOf(0.0f));
                    Float ry = SVGParser.getFloatAttr("ry", atts, Float.valueOf(0.0f));
                    pushTransform(atts);
                    Properties props3 = new Properties(atts);
                    this.rect.set(x3.floatValue(), y3.floatValue(), x3.floatValue() + width2.floatValue(), y3.floatValue() + height2.floatValue());
                    if (doFill(props3, this.rect)) {
                        this.rect.set(x3.floatValue(), y3.floatValue(), x3.floatValue() + width2.floatValue(), y3.floatValue() + height2.floatValue());
                        if (rx.floatValue() <= 0.0f && ry.floatValue() <= 0.0f) {
                            this.canvas.drawRect(this.rect, this.fillPaint);
                        } else {
                            this.canvas.drawRoundRect(this.rect, rx.floatValue(), ry.floatValue(), this.fillPaint);
                        }
                        doLimits(this.rect);
                    }
                    if (doStroke(props3)) {
                        this.rect.set(x3.floatValue(), y3.floatValue(), x3.floatValue() + width2.floatValue(), y3.floatValue() + height2.floatValue());
                        if (rx.floatValue() <= 0.0f && ry.floatValue() <= 0.0f) {
                            this.canvas.drawRect(this.rect, this.strokePaint);
                        } else {
                            this.canvas.drawRoundRect(this.rect, rx.floatValue(), ry.floatValue(), this.strokePaint);
                        }
                        doLimits(this.rect, this.strokePaint);
                    }
                    popTransform();
                    return;
                }
                if (!this.hidden && localName.equals("line")) {
                    Float x12 = SVGParser.getFloatAttr("x1", atts);
                    Float x22 = SVGParser.getFloatAttr("x2", atts);
                    Float y12 = SVGParser.getFloatAttr("y1", atts);
                    Float y22 = SVGParser.getFloatAttr("y2", atts);
                    if (doStroke(new Properties(atts))) {
                        pushTransform(atts);
                        this.rect.set(x12.floatValue(), y12.floatValue(), x22.floatValue(), y22.floatValue());
                        this.canvas.drawLine(x12.floatValue(), y12.floatValue(), x22.floatValue(), y22.floatValue(), this.strokePaint);
                        doLimits(this.rect, this.strokePaint);
                        popTransform();
                        return;
                    }
                    return;
                }
                if (!this.hidden && (localName.equals("circle") || localName.equals("ellipse"))) {
                    Float centerX = SVGParser.getFloatAttr("cx", atts);
                    Float centerY = SVGParser.getFloatAttr("cy", atts);
                    if (localName.equals("ellipse")) {
                        radiusX = SVGParser.getFloatAttr("rx", atts);
                        radiusY = SVGParser.getFloatAttr("ry", atts);
                    } else {
                        Float floatAttr = SVGParser.getFloatAttr("r", atts);
                        radiusY = floatAttr;
                        radiusX = floatAttr;
                    }
                    if (centerX != null && centerY != null && radiusX != null && radiusY != null) {
                        pushTransform(atts);
                        Properties props4 = new Properties(atts);
                        this.rect.set(centerX.floatValue() - radiusX.floatValue(), centerY.floatValue() - radiusY.floatValue(), centerX.floatValue() + radiusX.floatValue(), centerY.floatValue() + radiusY.floatValue());
                        if (doFill(props4, this.rect)) {
                            this.canvas.drawOval(this.rect, this.fillPaint);
                            doLimits(this.rect);
                        }
                        if (doStroke(props4)) {
                            this.canvas.drawOval(this.rect, this.strokePaint);
                            doLimits(this.rect, this.strokePaint);
                        }
                        popTransform();
                        return;
                    }
                    return;
                }
                if (this.hidden || !(localName.equals("polygon") || localName.equals("polyline"))) {
                    if (this.hidden || !localName.equals("path")) {
                        if (!this.hidden) {
                            Log.w(SVGParser.TAG, "UNRECOGNIZED SVG COMMAND: " + localName);
                            return;
                        }
                        return;
                    }
                    Path p = SVGParser.doPath(SVGParser.getStringAttr("d", atts));
                    pushTransform(atts);
                    Properties props5 = new Properties(atts);
                    p.computeBounds(this.rect, false);
                    if (doFill(props5, this.rect)) {
                        this.canvas.drawPath(p, this.fillPaint);
                        doLimits(this.rect);
                    }
                    if (doStroke(props5)) {
                        this.canvas.drawPath(p, this.strokePaint);
                        doLimits(this.rect, this.strokePaint);
                    }
                    popTransform();
                    return;
                }
                NumberParse numbers = SVGParser.getNumberParseAttr("points", atts);
                if (numbers != null) {
                    Path p2 = new Path();
                    ArrayList<Float> points = numbers.numbers;
                    if (points.size() > 1) {
                        pushTransform(atts);
                        Properties props6 = new Properties(atts);
                        p2.moveTo(points.get(0).floatValue(), points.get(1).floatValue());
                        for (int i = 2; i < points.size(); i += 2) {
                            p2.lineTo(points.get(i).floatValue(), points.get(i + 1).floatValue());
                        }
                        if (localName.equals("polygon")) {
                            p2.close();
                        }
                        p2.computeBounds(this.rect, false);
                        if (doFill(props6, this.rect)) {
                            this.canvas.drawPath(p2, this.fillPaint);
                            doLimits(this.rect);
                        }
                        if (doStroke(props6)) {
                            this.canvas.drawPath(p2, this.strokePaint);
                            doLimits(this.rect, this.strokePaint);
                        }
                        popTransform();
                    }
                }
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] ch, int start, int length) {
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String namespaceURI, String localName, String qName) throws SAXException {
            Gradient parent;
            if (localName.equals("svg")) {
                if (this.canvasRestoreCount != null) {
                    this.canvas.restoreToCount(this.canvasRestoreCount.intValue());
                }
                if (this.limitsAdjustmentX != null) {
                    this.limits.left += this.limitsAdjustmentX.floatValue();
                    this.limits.right += this.limitsAdjustmentX.floatValue();
                }
                if (this.limitsAdjustmentY != null) {
                    this.limits.top += this.limitsAdjustmentY.floatValue();
                    this.limits.bottom += this.limitsAdjustmentY.floatValue();
                }
                this.picture.endRecording();
                return;
            }
            if (localName.equals("linearGradient") || localName.equals("radialGradient")) {
                if (this.gradient.id != null) {
                    if (this.gradient.xlink != null && (parent = this.gradientMap.get(this.gradient.xlink)) != null) {
                        this.gradient = parent.createChild(this.gradient);
                    }
                    int[] colors = new int[this.gradient.colors.size()];
                    for (int i = 0; i < colors.length; i++) {
                        colors[i] = this.gradient.colors.get(i).intValue();
                    }
                    float[] positions = new float[this.gradient.positions.size()];
                    for (int i2 = 0; i2 < positions.length; i2++) {
                        positions[i2] = this.gradient.positions.get(i2).floatValue();
                    }
                    if (colors.length == 0) {
                        Log.d("BAD", "BAD");
                    }
                    if (localName.equals("linearGradient")) {
                        this.gradient.shader = new LinearGradient(this.gradient.x1, this.gradient.y1, this.gradient.x2, this.gradient.y2, colors, positions, this.gradient.tilemode);
                    } else {
                        this.gradient.shader = new RadialGradient(this.gradient.x, this.gradient.y, this.gradient.radius, colors, positions, this.gradient.tilemode);
                    }
                    this.gradientMap.put(this.gradient.id, this.gradient);
                    return;
                }
                return;
            }
            if (localName.equals("g")) {
                if (this.boundsMode) {
                    this.boundsMode = false;
                }
                if (this.hidden) {
                    this.hiddenLevel--;
                    if (this.hiddenLevel == 0) {
                        this.hidden = false;
                    }
                }
                popTransform();
                this.fillPaint = this.fillPaintStack.pop();
                this.fillSet = this.fillSetStack.pop().booleanValue();
                this.strokePaint = this.strokePaintStack.pop();
                this.strokeSet = this.strokeSetStack.pop().booleanValue();
            }
        }
    }
}
