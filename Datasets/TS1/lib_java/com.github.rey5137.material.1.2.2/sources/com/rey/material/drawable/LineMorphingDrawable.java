package com.rey.material.drawable;

import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.v4.text.TextUtilsCompat;
import android.util.AttributeSet;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import com.rey.material.R;
import com.rey.material.util.ThemeUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/LineMorphingDrawable.class */
public class LineMorphingDrawable extends Drawable implements Animatable {
    private boolean mRunning;
    private Paint mPaint;
    private int mPaddingLeft;
    private int mPaddingTop;
    private int mPaddingRight;
    private int mPaddingBottom;
    private RectF mDrawBound;
    private int mPrevState;
    private int mCurState;
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private Interpolator mInterpolator;
    private int mStrokeSize;
    private int mStrokeColor;
    private boolean mClockwise;
    private Paint.Cap mStrokeCap;
    private Paint.Join mStrokeJoin;
    private boolean mIsRtl;
    private Path mPath;
    private State[] mStates;
    private final Runnable mUpdater;

    private LineMorphingDrawable(State[] states, int curState, int paddingLeft, int paddingTop, int paddingRight, int paddingBottom, int animDuration, Interpolator interpolator, int strokeSize, int strokeColor, Paint.Cap strokeCap, Paint.Join strokeJoin, boolean clockwise, boolean isRtl) {
        this.mRunning = false;
        this.mPaddingLeft = 12;
        this.mPaddingTop = 12;
        this.mPaddingRight = 12;
        this.mPaddingBottom = 12;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.LineMorphingDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                LineMorphingDrawable.this.update();
            }
        };
        this.mStates = states;
        this.mPaddingLeft = paddingLeft;
        this.mPaddingTop = paddingTop;
        this.mPaddingRight = paddingRight;
        this.mPaddingBottom = paddingBottom;
        this.mAnimDuration = animDuration;
        this.mInterpolator = interpolator;
        this.mStrokeSize = strokeSize;
        this.mStrokeColor = strokeColor;
        this.mStrokeCap = strokeCap;
        this.mStrokeJoin = strokeJoin;
        this.mClockwise = clockwise;
        this.mIsRtl = isRtl;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeCap(this.mStrokeCap);
        this.mPaint.setStrokeJoin(this.mStrokeJoin);
        this.mPaint.setColor(this.mStrokeColor);
        this.mPaint.setStrokeWidth(this.mStrokeSize);
        this.mDrawBound = new RectF();
        this.mPath = new Path();
        switchLineState(curState, false);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        int restoreCount = canvas.save();
        float degrees = (this.mClockwise ? 180 : -180) * ((this.mPrevState < this.mCurState ? 0.0f : 1.0f) + this.mAnimProgress);
        if (this.mIsRtl) {
            canvas.scale(-1.0f, 1.0f, this.mDrawBound.centerX(), this.mDrawBound.centerY());
        }
        canvas.rotate(degrees, this.mDrawBound.centerX(), this.mDrawBound.centerY());
        canvas.drawPath(this.mPath, this.mPaint);
        canvas.restoreToCount(restoreCount);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.mDrawBound.left = bounds.left + this.mPaddingLeft;
        this.mDrawBound.top = bounds.top + this.mPaddingTop;
        this.mDrawBound.right = bounds.right - this.mPaddingRight;
        this.mDrawBound.bottom = bounds.bottom - this.mPaddingBottom;
        updatePath();
    }

    public void switchLineState(int state, boolean animation) {
        if (this.mCurState != state) {
            this.mPrevState = this.mCurState;
            this.mCurState = state;
            if (animation) {
                start();
                return;
            } else {
                this.mAnimProgress = 1.0f;
                updatePath();
                return;
            }
        }
        if (!animation) {
            this.mAnimProgress = 1.0f;
            updatePath();
        }
    }

    public boolean setLineState(int state, float progress) {
        if (this.mCurState != state) {
            this.mPrevState = this.mCurState;
            this.mCurState = state;
            this.mAnimProgress = progress;
            updatePath();
            return true;
        }
        if (this.mAnimProgress != progress) {
            this.mAnimProgress = progress;
            updatePath();
            return true;
        }
        return false;
    }

    public int getLineState() {
        return this.mCurState;
    }

    public int getLineStateCount() {
        if (this.mStates == null) {
            return 0;
        }
        return this.mStates.length;
    }

    public float getAnimProgress() {
        return this.mAnimProgress;
    }

    private void updatePath() {
        this.mPath.reset();
        if (this.mStates == null) {
            return;
        }
        if (this.mAnimProgress == 0.0f || (this.mStates[this.mPrevState].links != null && this.mAnimProgress < 0.05f)) {
            updatePathWithState(this.mPath, this.mStates[this.mPrevState]);
        } else if (this.mAnimProgress == 1.0f || (this.mStates[this.mCurState].links != null && this.mAnimProgress > 0.95f)) {
            updatePathWithState(this.mPath, this.mStates[this.mCurState]);
        } else {
            updatePathBetweenStates(this.mPath, this.mStates[this.mPrevState], this.mStates[this.mCurState], this.mInterpolator.getInterpolation(this.mAnimProgress));
        }
        invalidateSelf();
    }

    private void updatePathWithState(Path path, State state) {
        if (state.links != null) {
            for (int i = 0; i < state.links.length; i += 2) {
                int index1 = state.links[i] * 4;
                int index2 = state.links[i + 1] * 4;
                float x1 = getX(state.points[index1]);
                float y1 = getY(state.points[index1 + 1]);
                float x2 = getX(state.points[index1 + 2]);
                float y2 = getY(state.points[index1 + 3]);
                float x3 = getX(state.points[index2]);
                float y3 = getY(state.points[index2 + 1]);
                float x4 = getX(state.points[index2 + 2]);
                float y4 = getY(state.points[index2 + 3]);
                if (x1 == x3 && y1 == y3) {
                    path.moveTo(x2, y2);
                    path.lineTo(x1, y1);
                    path.lineTo(x4, y4);
                } else if (x1 == x4 && y1 == y4) {
                    path.moveTo(x2, y2);
                    path.lineTo(x1, y1);
                    path.lineTo(x3, y3);
                } else if (x2 == x3 && y2 == y3) {
                    path.moveTo(x1, y1);
                    path.lineTo(x2, y2);
                    path.lineTo(x4, y4);
                } else {
                    path.moveTo(x1, y1);
                    path.lineTo(x2, y2);
                    path.lineTo(x3, y3);
                }
            }
            int count = state.points.length / 4;
            for (int i2 = 0; i2 < count; i2++) {
                boolean exist = false;
                int j = 0;
                while (true) {
                    if (j >= state.links.length) {
                        break;
                    }
                    if (state.links[j] != i2) {
                        j++;
                    } else {
                        exist = true;
                        break;
                    }
                }
                if (!exist) {
                    int index = i2 * 4;
                    path.moveTo(getX(state.points[index]), getY(state.points[index + 1]));
                    path.lineTo(getX(state.points[index + 2]), getY(state.points[index + 3]));
                }
            }
            return;
        }
        int count2 = state.points.length / 4;
        for (int i3 = 0; i3 < count2; i3++) {
            int index3 = i3 * 4;
            path.moveTo(getX(state.points[index3]), getY(state.points[index3 + 1]));
            path.lineTo(getX(state.points[index3 + 2]), getY(state.points[index3 + 3]));
        }
    }

    private void updatePathBetweenStates(Path path, State prev, State cur, float progress) {
        float x1;
        float y1;
        float x2;
        float y2;
        float x3;
        float y3;
        float x4;
        float f;
        int count = Math.max(prev.points.length, cur.points.length) / 4;
        for (int i = 0; i < count; i++) {
            int index = i * 4;
            if (index >= prev.points.length) {
                x1 = 0.5f;
                y1 = 0.5f;
                x2 = 0.5f;
                y2 = 0.5f;
            } else {
                x1 = prev.points[index];
                y1 = prev.points[index + 1];
                x2 = prev.points[index + 2];
                y2 = prev.points[index + 3];
            }
            if (index >= cur.points.length) {
                x3 = 0.5f;
                y3 = 0.5f;
                x4 = 0.5f;
                f = 0.5f;
            } else {
                x3 = cur.points[index];
                y3 = cur.points[index + 1];
                x4 = cur.points[index + 2];
                f = cur.points[index + 3];
            }
            float y4 = f;
            this.mPath.moveTo(getX(x1 + ((x3 - x1) * progress)), getY(y1 + ((y3 - y1) * progress)));
            this.mPath.lineTo(getX(x2 + ((x4 - x2) * progress)), getY(y2 + ((y4 - y2) * progress)));
        }
    }

    private float getX(float value) {
        return this.mDrawBound.left + (this.mDrawBound.width() * value);
    }

    private float getY(float value) {
        return this.mDrawBound.top + (this.mDrawBound.height() * value);
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
        this.mAnimProgress = 0.0f;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        resetAnimation();
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (!isRunning()) {
            return;
        }
        this.mRunning = false;
        unscheduleSelf(this.mUpdater);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunning;
    }

    @Override // android.graphics.drawable.Drawable
    public void scheduleSelf(Runnable what, long when) {
        this.mRunning = true;
        super.scheduleSelf(what, when);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        long curTime = SystemClock.uptimeMillis();
        float value = Math.min(1.0f, (curTime - this.mStartTime) / this.mAnimDuration);
        if (value == 1.0f) {
            setLineState(this.mCurState, 1.0f);
            this.mRunning = false;
        } else {
            setLineState(this.mCurState, this.mInterpolator.getInterpolation(value));
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/LineMorphingDrawable$State.class */
    public static class State {
        float[] points;
        int[] links;

        public State() {
        }

        public State(float[] points, int[] links) {
            this.points = points;
            this.links = links;
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/LineMorphingDrawable$Builder.class */
    public static class Builder {
        private int mCurState;
        private int mPaddingLeft;
        private int mPaddingTop;
        private int mPaddingRight;
        private int mPaddingBottom;
        private int mAnimDuration;
        private Interpolator mInterpolator;
        private int mStrokeSize;
        private int mStrokeColor;
        private boolean mClockwise;
        private Paint.Cap mStrokeCap;
        private Paint.Join mStrokeJoin;
        private boolean mIsRtl;
        private State[] mStates;
        private static final String TAG_STATE_LIST = "state-list";
        private static final String TAG_STATE = "state";
        private static final String TAG_POINTS = "points";
        private static final String TAG_LINKS = "links";
        private static final String TAG_ITEM = "item";

        public Builder() {
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.LineMorphingDrawable, defStyleAttr, defStyleRes);
            int resId = a.getResourceId(R.styleable.LineMorphingDrawable_lmd_state, 0);
            if (resId != 0) {
                states(readStates(context, resId));
            }
            curState(a.getInteger(R.styleable.LineMorphingDrawable_lmd_curState, 0));
            padding(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_padding, 0));
            paddingLeft(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_paddingLeft, this.mPaddingLeft));
            paddingTop(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_paddingTop, this.mPaddingTop));
            paddingRight(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_paddingRight, this.mPaddingRight));
            paddingBottom(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_paddingBottom, this.mPaddingBottom));
            animDuration(a.getInteger(R.styleable.LineMorphingDrawable_lmd_animDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            int resId2 = a.getResourceId(R.styleable.LineMorphingDrawable_lmd_interpolator, 0);
            if (resId2 != 0) {
                interpolator(AnimationUtils.loadInterpolator(context, resId2));
            }
            strokeSize(a.getDimensionPixelSize(R.styleable.LineMorphingDrawable_lmd_strokeSize, ThemeUtil.dpToPx(context, 3)));
            strokeColor(a.getColor(R.styleable.LineMorphingDrawable_lmd_strokeColor, -1));
            int cap = a.getInteger(R.styleable.LineMorphingDrawable_lmd_strokeCap, 0);
            if (cap == 0) {
                strokeCap(Paint.Cap.BUTT);
            } else if (cap == 1) {
                strokeCap(Paint.Cap.ROUND);
            } else {
                strokeCap(Paint.Cap.SQUARE);
            }
            int join = a.getInteger(R.styleable.LineMorphingDrawable_lmd_strokeJoin, 0);
            if (join == 0) {
                strokeJoin(Paint.Join.MITER);
            } else if (join == 1) {
                strokeJoin(Paint.Join.ROUND);
            } else {
                strokeJoin(Paint.Join.BEVEL);
            }
            clockwise(a.getBoolean(R.styleable.LineMorphingDrawable_lmd_clockwise, true));
            int direction = a.getInteger(R.styleable.LineMorphingDrawable_lmd_layoutDirection, 0);
            if (direction == 3) {
                rtl(TextUtilsCompat.getLayoutDirectionFromLocale(Locale.getDefault()) == 1);
            } else {
                rtl(direction == 1);
            }
            a.recycle();
        }

        private State[] readStates(Context context, int id) {
            String tagName;
            XmlResourceParser parser = null;
            List<State> states = new ArrayList<>();
            try {
                XmlResourceParser parser2 = context.getResources().getXml(id);
                int eventType = parser2.getEventType();
                boolean lookingForEndOfUnknownTag = false;
                String unknownTagName = null;
                while (true) {
                    if (eventType == 2) {
                        String tagName2 = parser2.getName();
                        if (tagName2.equals(TAG_STATE_LIST)) {
                            eventType = parser2.next();
                        } else {
                            throw new RuntimeException("Expecting menu, got " + tagName2);
                        }
                    } else {
                        eventType = parser2.next();
                        if (eventType == 1) {
                            break;
                        }
                    }
                }
                boolean reachedEndOfStateList = false;
                State state = null;
                List<String> array = new ArrayList<>();
                StringBuilder currentValue = new StringBuilder();
                while (!reachedEndOfStateList) {
                    switch (eventType) {
                        case 1:
                            reachedEndOfStateList = true;
                            break;
                        case 2:
                            if (lookingForEndOfUnknownTag) {
                                break;
                            } else {
                                tagName = parser2.getName();
                                switch (tagName) {
                                    case "state":
                                        state = new State();
                                        break;
                                    case "points":
                                    case "links":
                                        array.clear();
                                        break;
                                    case "item":
                                        currentValue.delete(0, currentValue.length());
                                        break;
                                    default:
                                        lookingForEndOfUnknownTag = true;
                                        unknownTagName = tagName;
                                        break;
                                }
                                break;
                            }
                        case 3:
                            String tagName3 = parser2.getName();
                            if (lookingForEndOfUnknownTag && tagName3.equals(unknownTagName)) {
                                lookingForEndOfUnknownTag = false;
                                unknownTagName = null;
                            }
                            switch (tagName3) {
                                case "state-list":
                                    reachedEndOfStateList = true;
                                    break;
                                case "state":
                                    states.add(state);
                                    break;
                                case "points":
                                    state.points = new float[array.size()];
                                    for (int i = 0; i < state.points.length; i++) {
                                        state.points[i] = Float.parseFloat(array.get(i));
                                    }
                                    break;
                                case "links":
                                    state.links = new int[array.size()];
                                    for (int i2 = 0; i2 < state.links.length; i2++) {
                                        state.links[i2] = Integer.parseInt(array.get(i2));
                                    }
                                    break;
                                case "item":
                                    array.add(currentValue.toString());
                                    break;
                            }
                            break;
                        case 4:
                            currentValue.append(parser2.getText());
                            break;
                    }
                    eventType = parser2.next();
                }
                if (parser2 != null) {
                    parser2.close();
                }
            } catch (Exception e) {
                if (0 != 0) {
                    parser.close();
                }
            } catch (Throwable th) {
                if (0 != 0) {
                    parser.close();
                }
                throw th;
            }
            if (states.isEmpty()) {
                return null;
            }
            return (State[]) states.toArray(new State[states.size()]);
        }

        public LineMorphingDrawable build() {
            if (this.mStrokeCap == null) {
                this.mStrokeCap = Paint.Cap.BUTT;
            }
            if (this.mStrokeJoin == null) {
                this.mStrokeJoin = Paint.Join.MITER;
            }
            if (this.mInterpolator == null) {
                this.mInterpolator = new AccelerateInterpolator();
            }
            return new LineMorphingDrawable(this.mStates, this.mCurState, this.mPaddingLeft, this.mPaddingTop, this.mPaddingRight, this.mPaddingBottom, this.mAnimDuration, this.mInterpolator, this.mStrokeSize, this.mStrokeColor, this.mStrokeCap, this.mStrokeJoin, this.mClockwise, this.mIsRtl);
        }

        public Builder states(State... states) {
            this.mStates = states;
            return this;
        }

        public Builder curState(int state) {
            this.mCurState = state;
            return this;
        }

        public Builder padding(int padding) {
            this.mPaddingLeft = padding;
            this.mPaddingTop = padding;
            this.mPaddingRight = padding;
            this.mPaddingBottom = padding;
            return this;
        }

        public Builder paddingLeft(int padding) {
            this.mPaddingLeft = padding;
            return this;
        }

        public Builder paddingTop(int padding) {
            this.mPaddingTop = padding;
            return this;
        }

        public Builder paddingRight(int padding) {
            this.mPaddingRight = padding;
            return this;
        }

        public Builder paddingBottom(int padding) {
            this.mPaddingBottom = padding;
            return this;
        }

        public Builder animDuration(int duration) {
            this.mAnimDuration = duration;
            return this;
        }

        public Builder interpolator(Interpolator interpolator) {
            this.mInterpolator = interpolator;
            return this;
        }

        public Builder strokeSize(int size) {
            this.mStrokeSize = size;
            return this;
        }

        public Builder strokeColor(int strokeColor) {
            this.mStrokeColor = strokeColor;
            return this;
        }

        public Builder strokeCap(Paint.Cap cap) {
            this.mStrokeCap = cap;
            return this;
        }

        public Builder strokeJoin(Paint.Join join) {
            this.mStrokeJoin = join;
            return this;
        }

        public Builder clockwise(boolean clockwise) {
            this.mClockwise = clockwise;
            return this;
        }

        public Builder rtl(boolean rtl) {
            this.mIsRtl = rtl;
            return this;
        }
    }
}
