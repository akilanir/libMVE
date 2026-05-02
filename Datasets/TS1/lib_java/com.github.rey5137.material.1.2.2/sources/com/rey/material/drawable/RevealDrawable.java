package com.rey.material.drawable;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.util.ColorUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/RevealDrawable.class */
public class RevealDrawable extends Drawable implements Animatable {
    private long mStartTime;
    private float mAnimProgress;
    private Paint mFillPaint;
    private int mCurColor;
    private RadialGradient mShader;
    private Matrix mMatrix;
    private RectF mRect;
    private float mMaxRadius;
    private ColorChangeTask[] mTasks;
    private int mCurTask;
    private boolean mCurColorTransparent;
    private boolean mNextColorTransparent;
    private static final float[] GRADIENT_STOPS = {0.0f, 0.99f, 1.0f};
    private static final float GRADIENT_RADIUS = 16.0f;
    private boolean mRunning = false;
    private final Runnable mUpdater = new Runnable() { // from class: com.rey.material.drawable.RevealDrawable.1
        @Override // java.lang.Runnable
        public void run() {
            RevealDrawable.this.update();
        }
    };
    private Paint mShaderPaint = new Paint(1);

    public RevealDrawable(int color) {
        this.mShaderPaint.setStyle(Paint.Style.FILL);
        this.mFillPaint = new Paint(1);
        this.mFillPaint.setStyle(Paint.Style.FILL);
        this.mCurColor = color;
        this.mRect = new RectF();
        this.mMatrix = new Matrix();
    }

    public int getCurColor() {
        return this.mCurColor;
    }

    public void setCurColor(int color) {
        if (this.mCurColor != color) {
            this.mCurColor = color;
            this.mCurColorTransparent = Color.alpha(this.mCurColor) == 0;
            invalidateSelf();
        }
    }

    private float getMaxRadius(float x, float y, Rect bounds) {
        float x1 = x < ((float) bounds.centerX()) ? bounds.right : bounds.left;
        float y1 = y < ((float) bounds.centerY()) ? bounds.bottom : bounds.top;
        return (float) Math.sqrt(Math.pow(x1 - x, 2.0d) + Math.pow(y1 - y, 2.0d));
    }

    private RadialGradient getShader(ColorChangeTask task) {
        if (this.mShader == null) {
            if (task.isOut) {
                int color_middle = ColorUtil.getColor(this.mCurColor, 0.0f);
                this.mShader = new RadialGradient(task.x, task.y, GRADIENT_RADIUS, new int[]{0, color_middle, this.mCurColor}, GRADIENT_STOPS, Shader.TileMode.CLAMP);
            } else {
                int color_middle2 = ColorUtil.getColor(task.color, 0.0f);
                this.mShader = new RadialGradient(task.x, task.y, GRADIENT_RADIUS, new int[]{0, color_middle2, task.color}, GRADIENT_STOPS, Shader.TileMode.CLAMP);
            }
        }
        return this.mShader;
    }

    private void fillCanvas(Canvas canvas, int color, boolean transparent) {
        if (transparent) {
            return;
        }
        this.mFillPaint.setColor(color);
        canvas.drawRect(getBounds(), this.mFillPaint);
    }

    private void fillCanvasWithHole(Canvas canvas, ColorChangeTask task, float radius, boolean transparent) {
        if (transparent) {
            return;
        }
        float scale = radius / GRADIENT_RADIUS;
        this.mMatrix.reset();
        this.mMatrix.postScale(scale, scale, task.x, task.y);
        RadialGradient shader = getShader(task);
        shader.setLocalMatrix(this.mMatrix);
        this.mShaderPaint.setShader(shader);
        canvas.drawRect(getBounds(), this.mShaderPaint);
    }

    private void fillCircle(Canvas canvas, float x, float y, float radius, int color, boolean transparent) {
        if (transparent) {
            return;
        }
        this.mFillPaint.setColor(color);
        this.mRect.set(x - radius, y - radius, x + radius, y + radius);
        canvas.drawOval(this.mRect, this.mFillPaint);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (!isRunning()) {
            fillCanvas(canvas, this.mCurColor, this.mCurColorTransparent);
            return;
        }
        ColorChangeTask task = this.mTasks[this.mCurTask];
        if (this.mAnimProgress == 0.0f) {
            fillCanvas(canvas, this.mCurColor, this.mCurColorTransparent);
            return;
        }
        if (this.mAnimProgress == 1.0f) {
            fillCanvas(canvas, task.color, this.mNextColorTransparent);
            return;
        }
        if (task.isOut) {
            float radius = this.mMaxRadius * task.interpolator.getInterpolation(this.mAnimProgress);
            if (Color.alpha(task.color) == 255) {
                fillCanvas(canvas, this.mCurColor, this.mCurColorTransparent);
            } else {
                fillCanvasWithHole(canvas, task, radius, this.mCurColorTransparent);
            }
            fillCircle(canvas, task.x, task.y, radius, task.color, this.mNextColorTransparent);
            return;
        }
        float radius2 = this.mMaxRadius * task.interpolator.getInterpolation(this.mAnimProgress);
        if (Color.alpha(this.mCurColor) == 255) {
            fillCanvas(canvas, task.color, this.mNextColorTransparent);
        } else {
            fillCanvasWithHole(canvas, task, radius2, this.mNextColorTransparent);
        }
        fillCircle(canvas, task.x, task.y, radius2, this.mCurColor, this.mCurColorTransparent);
    }

    public void changeColor(int color, int duration, Interpolator interpolator, float x, float y, boolean out) {
        changeColor(new ColorChangeTask(color, duration, interpolator, x, y, out));
    }

    public void changeColor(ColorChangeTask... tasks) {
        synchronized (RevealDrawable.class) {
            if (!isRunning()) {
                int i = 0;
                while (true) {
                    if (i >= tasks.length) {
                        break;
                    }
                    if (tasks[i].color == this.mCurColor) {
                        i++;
                    } else {
                        this.mCurTask = i;
                        this.mTasks = tasks;
                        start();
                        break;
                    }
                }
            } else {
                int curLength = this.mTasks.length - this.mCurTask;
                ColorChangeTask[] newTasks = new ColorChangeTask[curLength + tasks.length];
                System.arraycopy(this.mTasks, this.mCurTask, newTasks, 0, curLength);
                System.arraycopy(tasks, 0, newTasks, curLength, tasks.length);
                this.mTasks = newTasks;
                this.mCurTask = 0;
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mShaderPaint.setAlpha(alpha);
        this.mFillPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mShaderPaint.setColorFilter(cf);
        this.mFillPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
        this.mAnimProgress = 0.0f;
        this.mCurColorTransparent = Color.alpha(this.mCurColor) == 0;
        this.mNextColorTransparent = Color.alpha(this.mTasks[this.mCurTask].color) == 0;
        this.mMaxRadius = getMaxRadius(this.mTasks[this.mCurTask].x, this.mTasks[this.mCurTask].y, getBounds());
        this.mShader = null;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (isRunning()) {
            return;
        }
        resetAnimation();
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (!isRunning()) {
            return;
        }
        this.mTasks = null;
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
        synchronized (RevealDrawable.class) {
            this.mAnimProgress = Math.min(1.0f, (curTime - this.mStartTime) / this.mTasks[this.mCurTask].duration);
            if (this.mAnimProgress == 1.0f) {
                setCurColor(this.mTasks[this.mCurTask].color);
                this.mCurTask++;
                while (true) {
                    if (this.mCurTask >= this.mTasks.length) {
                        break;
                    }
                    if (this.mTasks[this.mCurTask].color == this.mCurColor) {
                        this.mCurTask++;
                    } else {
                        resetAnimation();
                        break;
                    }
                }
                if (this.mCurTask == this.mTasks.length) {
                    stop();
                }
            }
        }
        invalidateSelf();
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/RevealDrawable$ColorChangeTask.class */
    public static class ColorChangeTask {
        public final int color;
        public final int duration;
        public final Interpolator interpolator;
        public final float x;
        public final float y;
        public final boolean isOut;

        public ColorChangeTask(int color, int duration, Interpolator interpolator, float x, float y, boolean out) {
            this.color = color;
            this.duration = duration;
            this.interpolator = interpolator == null ? new DecelerateInterpolator() : interpolator;
            this.x = x;
            this.y = y;
            this.isOut = out;
        }
    }
}
