package com.amulyakhare.textdrawable;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.graphics.drawable.shapes.RectShape;
import android.graphics.drawable.shapes.RoundRectShape;

/* loaded from: com.amulyakhare.com.amulyakhare.textdrawable.1.0.1.jar:com/amulyakhare/textdrawable/TextDrawable.class */
public class TextDrawable extends ShapeDrawable {
    private final Paint textPaint;
    private final Paint borderPaint;
    private static final float SHADE_FACTOR = 0.9f;
    private final String text;
    private final int color;
    private final RectShape shape;
    private final int height;
    private final int width;
    private final int fontSize;
    private final float radius;
    private final int borderThickness;

    /* loaded from: com.amulyakhare.com.amulyakhare.textdrawable.1.0.1.jar:com/amulyakhare/textdrawable/TextDrawable$IBuilder.class */
    public interface IBuilder {
        TextDrawable build(String str, int i);
    }

    /* loaded from: com.amulyakhare.com.amulyakhare.textdrawable.1.0.1.jar:com/amulyakhare/textdrawable/TextDrawable$IConfigBuilder.class */
    public interface IConfigBuilder {
        IConfigBuilder width(int i);

        IConfigBuilder height(int i);

        IConfigBuilder textColor(int i);

        IConfigBuilder withBorder(int i);

        IConfigBuilder useFont(Typeface typeface);

        IConfigBuilder fontSize(int i);

        IConfigBuilder bold();

        IConfigBuilder toUpperCase();

        IShapeBuilder endConfig();
    }

    /* loaded from: com.amulyakhare.com.amulyakhare.textdrawable.1.0.1.jar:com/amulyakhare/textdrawable/TextDrawable$IShapeBuilder.class */
    public interface IShapeBuilder {
        IConfigBuilder beginConfig();

        IBuilder rect();

        IBuilder round();

        IBuilder roundRect(int i);

        TextDrawable buildRect(String str, int i);

        TextDrawable buildRoundRect(String str, int i, int i2);

        TextDrawable buildRound(String str, int i);
    }

    private TextDrawable(Builder builder) {
        super(builder.shape);
        this.shape = builder.shape;
        this.height = builder.height;
        this.width = builder.width;
        this.radius = builder.radius;
        this.text = builder.toUpperCase ? builder.text.toUpperCase() : builder.text;
        this.color = builder.color;
        this.fontSize = builder.fontSize;
        this.textPaint = new Paint();
        this.textPaint.setColor(builder.textColor);
        this.textPaint.setAntiAlias(true);
        this.textPaint.setFakeBoldText(builder.isBold);
        this.textPaint.setStyle(Paint.Style.FILL);
        this.textPaint.setTypeface(builder.font);
        this.textPaint.setTextAlign(Paint.Align.CENTER);
        this.textPaint.setStrokeWidth(builder.borderThickness);
        this.borderThickness = builder.borderThickness;
        this.borderPaint = new Paint();
        this.borderPaint.setColor(getDarkerShade(this.color));
        this.borderPaint.setStyle(Paint.Style.STROKE);
        this.borderPaint.setStrokeWidth(this.borderThickness);
        Paint paint = getPaint();
        paint.setColor(this.color);
    }

    private int getDarkerShade(int color) {
        return Color.rgb((int) (SHADE_FACTOR * Color.red(color)), (int) (SHADE_FACTOR * Color.green(color)), (int) (SHADE_FACTOR * Color.blue(color)));
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        super.draw(canvas);
        Rect r = getBounds();
        if (this.borderThickness > 0) {
            drawBorder(canvas);
        }
        int count = canvas.save();
        canvas.translate(r.left, r.top);
        int width = this.width < 0 ? r.width() : this.width;
        int height = this.height < 0 ? r.height() : this.height;
        int fontSize = this.fontSize < 0 ? Math.min(width, height) / 2 : this.fontSize;
        this.textPaint.setTextSize(fontSize);
        canvas.drawText(this.text, width / 2, (height / 2) - ((this.textPaint.descent() + this.textPaint.ascent()) / 2.0f), this.textPaint);
        canvas.restoreToCount(count);
    }

    private void drawBorder(Canvas canvas) {
        RectF rect = new RectF(getBounds());
        rect.inset(this.borderThickness / 2, this.borderThickness / 2);
        if (this.shape instanceof OvalShape) {
            canvas.drawOval(rect, this.borderPaint);
        } else if (this.shape instanceof RoundRectShape) {
            canvas.drawRoundRect(rect, this.radius, this.radius, this.borderPaint);
        } else {
            canvas.drawRect(rect, this.borderPaint);
        }
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.textPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.textPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.width;
    }

    @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.height;
    }

    public static IShapeBuilder builder() {
        return new Builder();
    }

    /* loaded from: com.amulyakhare.com.amulyakhare.textdrawable.1.0.1.jar:com/amulyakhare/textdrawable/TextDrawable$Builder.class */
    public static class Builder implements IConfigBuilder, IShapeBuilder, IBuilder {
        private String text;
        private int color;
        private int borderThickness;
        private int width;
        private int height;
        private Typeface font;
        private RectShape shape;
        public int textColor;
        private int fontSize;
        private boolean isBold;
        private boolean toUpperCase;
        public float radius;

        private Builder() {
            this.text = BuildConfig.FLAVOR;
            this.color = -7829368;
            this.textColor = -1;
            this.borderThickness = 0;
            this.width = -1;
            this.height = -1;
            this.shape = new RectShape();
            this.font = Typeface.create("sans-serif-light", 0);
            this.fontSize = -1;
            this.isBold = false;
            this.toUpperCase = false;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder width(int width) {
            this.width = width;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder height(int height) {
            this.height = height;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder textColor(int color) {
            this.textColor = color;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder withBorder(int thickness) {
            this.borderThickness = thickness;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder useFont(Typeface font) {
            this.font = font;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder fontSize(int size) {
            this.fontSize = size;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder bold() {
            this.isBold = true;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IConfigBuilder toUpperCase() {
            this.toUpperCase = true;
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public IConfigBuilder beginConfig() {
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IConfigBuilder
        public IShapeBuilder endConfig() {
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public IBuilder rect() {
            this.shape = new RectShape();
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public IBuilder round() {
            this.shape = new OvalShape();
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public IBuilder roundRect(int radius) {
            this.radius = radius;
            float[] radii = {radius, radius, radius, radius, radius, radius, radius, radius};
            this.shape = new RoundRectShape(radii, null, null);
            return this;
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public TextDrawable buildRect(String text, int color) {
            rect();
            return build(text, color);
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public TextDrawable buildRoundRect(String text, int color, int radius) {
            roundRect(radius);
            return build(text, color);
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IShapeBuilder
        public TextDrawable buildRound(String text, int color) {
            round();
            return build(text, color);
        }

        @Override // com.amulyakhare.textdrawable.TextDrawable.IBuilder
        public TextDrawable build(String text, int color) {
            this.color = color;
            this.text = text;
            return new TextDrawable(this);
        }
    }
}
