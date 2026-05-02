package com.google.android.exoplayer.text;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/SubtitleLayout.class */
public final class SubtitleLayout extends View {
    public static final float DEFAULT_TEXT_SIZE_FRACTION = 0.0533f;
    public static final float DEFAULT_BOTTOM_PADDING_FRACTION = 0.08f;
    private static final int FRACTIONAL = 0;
    private static final int FRACTIONAL_IGNORE_PADDING = 1;
    private static final int ABSOLUTE = 2;
    private final List<CuePainter> painters;
    private List<Cue> cues;
    private int textSizeType;
    private float textSize;
    private boolean applyEmbeddedStyles;
    private CaptionStyleCompat style;
    private float bottomPaddingFraction;

    public SubtitleLayout(Context context) {
        this(context, null);
    }

    public SubtitleLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.painters = new ArrayList();
        this.textSizeType = 0;
        this.textSize = 0.0533f;
        this.applyEmbeddedStyles = true;
        this.style = CaptionStyleCompat.DEFAULT;
        this.bottomPaddingFraction = 0.08f;
    }

    public void setCues(List<Cue> cues) {
        if (this.cues == cues) {
            return;
        }
        this.cues = cues;
        int cueCount = cues == null ? 0 : cues.size();
        while (this.painters.size() < cueCount) {
            this.painters.add(new CuePainter(getContext()));
        }
        invalidate();
    }

    public void setFixedTextSize(int unit, float size) {
        Resources resources;
        Context context = getContext();
        if (context == null) {
            resources = Resources.getSystem();
        } else {
            resources = context.getResources();
        }
        setTextSize(2, TypedValue.applyDimension(unit, size, resources.getDisplayMetrics()));
    }

    public void setFractionalTextSize(float fractionOfHeight) {
        setFractionalTextSize(fractionOfHeight, false);
    }

    public void setFractionalTextSize(float fractionOfHeight, boolean ignorePadding) {
        setTextSize(ignorePadding ? 1 : 0, fractionOfHeight);
    }

    private void setTextSize(int textSizeType, float textSize) {
        if (this.textSizeType == textSizeType && this.textSize == textSize) {
            return;
        }
        this.textSizeType = textSizeType;
        this.textSize = textSize;
        invalidate();
    }

    public void setApplyEmbeddedStyles(boolean applyEmbeddedStyles) {
        if (this.applyEmbeddedStyles == applyEmbeddedStyles) {
            return;
        }
        this.applyEmbeddedStyles = applyEmbeddedStyles;
        invalidate();
    }

    public void setStyle(CaptionStyleCompat style) {
        if (this.style == style) {
            return;
        }
        this.style = style;
        invalidate();
    }

    public void setBottomPaddingFraction(float bottomPaddingFraction) {
        if (this.bottomPaddingFraction == bottomPaddingFraction) {
            return;
        }
        this.bottomPaddingFraction = bottomPaddingFraction;
        invalidate();
    }

    @Override // android.view.View
    public void dispatchDraw(Canvas canvas) {
        int cueCount = this.cues == null ? 0 : this.cues.size();
        int rawTop = getTop();
        int rawBottom = getBottom();
        int left = getLeft() + getPaddingLeft();
        int top = rawTop + getPaddingTop();
        int right = getRight() + getPaddingRight();
        int bottom = rawBottom - getPaddingBottom();
        if (bottom <= top || right <= left) {
            return;
        }
        float textSizePx = this.textSizeType == 2 ? this.textSize : this.textSize * (this.textSizeType == 0 ? bottom - top : rawBottom - rawTop);
        if (textSizePx <= 0.0f) {
            return;
        }
        for (int i = 0; i < cueCount; i++) {
            this.painters.get(i).draw(this.cues.get(i), this.applyEmbeddedStyles, this.style, textSizePx, this.bottomPaddingFraction, canvas, left, top, right, bottom);
        }
    }
}
