package com.google.android.exoplayer.text.ttml;

import android.text.Layout;
import com.google.android.exoplayer.util.Assertions;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/ttml/TtmlStyle.class */
final class TtmlStyle {
    public static final short UNSPECIFIED = -1;
    public static final short STYLE_NORMAL = 0;
    public static final short STYLE_BOLD = 1;
    public static final short STYLE_ITALIC = 2;
    public static final short STYLE_BOLD_ITALIC = 3;
    public static final short FONT_SIZE_UNIT_PIXEL = 1;
    public static final short FONT_SIZE_UNIT_EM = 2;
    public static final short FONT_SIZE_UNIT_PERCENT = 3;
    private static final short OFF = 0;
    private static final short ON = 1;
    private String fontFamily;
    private int color;
    private boolean colorSpecified;
    private int backgroundColor;
    private boolean backgroundColorSpecified;
    private short linethrough = -1;
    private short underline = -1;
    private short bold = -1;
    private short italic = -1;
    private short fontSizeUnit = -1;
    private float fontSize;
    private String id;
    private TtmlStyle inheritableStyle;
    private Layout.Alignment textAlign;

    TtmlStyle() {
    }

    public short getStyle() {
        if (this.bold == -1 && this.italic == -1) {
            return (short) -1;
        }
        short style = 0;
        if (this.bold != -1) {
            style = (short) (0 + this.bold);
        }
        if (this.italic != -1) {
            style = (short) (style + this.italic);
        }
        return style;
    }

    public boolean isLinethrough() {
        return this.linethrough == 1;
    }

    public TtmlStyle setLinethrough(boolean linethrough) {
        Assertions.checkState(this.inheritableStyle == null);
        this.linethrough = linethrough ? (short) 1 : (short) 0;
        return this;
    }

    public boolean isUnderline() {
        return this.underline == 1;
    }

    public TtmlStyle setUnderline(boolean underline) {
        Assertions.checkState(this.inheritableStyle == null);
        this.underline = underline ? (short) 1 : (short) 0;
        return this;
    }

    public String getFontFamily() {
        return this.fontFamily;
    }

    public TtmlStyle setFontFamily(String fontFamily) {
        Assertions.checkState(this.inheritableStyle == null);
        this.fontFamily = fontFamily;
        return this;
    }

    public int getColor() {
        return this.color;
    }

    public TtmlStyle setColor(int color) {
        Assertions.checkState(this.inheritableStyle == null);
        this.color = color;
        this.colorSpecified = true;
        return this;
    }

    public boolean hasColorSpecified() {
        return this.colorSpecified;
    }

    public int getBackgroundColor() {
        return this.backgroundColor;
    }

    public TtmlStyle setBackgroundColor(int backgroundColor) {
        this.backgroundColor = backgroundColor;
        this.backgroundColorSpecified = true;
        return this;
    }

    public boolean hasBackgroundColorSpecified() {
        return this.backgroundColorSpecified;
    }

    public TtmlStyle setBold(boolean isBold) {
        Assertions.checkState(this.inheritableStyle == null);
        this.bold = isBold ? (short) 1 : (short) 0;
        return this;
    }

    public TtmlStyle setItalic(boolean isItalic) {
        Assertions.checkState(this.inheritableStyle == null);
        this.italic = isItalic ? (short) 2 : (short) 0;
        return this;
    }

    public TtmlStyle inherit(TtmlStyle ancestor) {
        return inherit(ancestor, false);
    }

    public TtmlStyle chain(TtmlStyle ancestor) {
        return inherit(ancestor, true);
    }

    private TtmlStyle inherit(TtmlStyle ancestor, boolean chaining) {
        if (ancestor != null) {
            if (!this.colorSpecified && ancestor.colorSpecified) {
                setColor(ancestor.color);
            }
            if (this.bold == -1) {
                this.bold = ancestor.bold;
            }
            if (this.italic == -1) {
                this.italic = ancestor.italic;
            }
            if (this.fontFamily == null) {
                this.fontFamily = ancestor.fontFamily;
            }
            if (this.linethrough == -1) {
                this.linethrough = ancestor.linethrough;
            }
            if (this.underline == -1) {
                this.underline = ancestor.underline;
            }
            if (this.textAlign == null) {
                this.textAlign = ancestor.textAlign;
            }
            if (this.fontSizeUnit == -1) {
                this.fontSizeUnit = ancestor.fontSizeUnit;
                this.fontSize = ancestor.fontSize;
            }
            if (chaining && !this.backgroundColorSpecified && ancestor.backgroundColorSpecified) {
                setBackgroundColor(ancestor.backgroundColor);
            }
        }
        return this;
    }

    public TtmlStyle setId(String id) {
        this.id = id;
        return this;
    }

    public String getId() {
        return this.id;
    }

    public Layout.Alignment getTextAlign() {
        return this.textAlign;
    }

    public TtmlStyle setTextAlign(Layout.Alignment textAlign) {
        this.textAlign = textAlign;
        return this;
    }

    public TtmlStyle setFontSize(float fontSize) {
        this.fontSize = fontSize;
        return this;
    }

    public TtmlStyle setFontSizeUnit(short unit) {
        this.fontSizeUnit = unit;
        return this;
    }

    public short getFontSizeUnit() {
        return this.fontSizeUnit;
    }

    public float getFontSize() {
        return this.fontSize;
    }
}
