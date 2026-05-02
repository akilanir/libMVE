package com.theartofdev.edmodo.cropper;

import android.graphics.Matrix;
import android.graphics.RectF;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.widget.ImageView;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageAnimation.class */
final class CropImageAnimation extends Animation implements Animation.AnimationListener {
    private final ImageView mImageView;
    private final CropOverlayView mCropOverlayView;
    private final RectF mStartImageRect = new RectF();
    private final RectF mEndImageRect = new RectF();
    private final RectF mStartCropWindowRect = new RectF();
    private final RectF mEndCropWindowRect = new RectF();
    private final float[] mStartImageMatrix = new float[9];
    private final float[] mEndImageMatrix = new float[9];
    private final RectF mAnimRect = new RectF();
    private final float[] mAnimMatrix = new float[9];

    public CropImageAnimation(ImageView cropImageView, CropOverlayView cropOverlayView) {
        this.mImageView = cropImageView;
        this.mCropOverlayView = cropOverlayView;
        setDuration(300L);
        setFillAfter(true);
        setInterpolator(new AccelerateDecelerateInterpolator());
        setAnimationListener(this);
    }

    public void setStartState(RectF imageRect, Matrix imageMatrix) {
        reset();
        this.mStartImageRect.set(imageRect);
        this.mStartCropWindowRect.set(this.mCropOverlayView.getCropWindowRect());
        imageMatrix.getValues(this.mStartImageMatrix);
    }

    public void setEndState(RectF imageRect, Matrix imageMatrix) {
        this.mEndImageRect.set(imageRect);
        this.mEndCropWindowRect.set(this.mCropOverlayView.getCropWindowRect());
        imageMatrix.getValues(this.mEndImageMatrix);
    }

    @Override // android.view.animation.Animation
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        this.mAnimRect.left = this.mStartCropWindowRect.left + ((this.mEndCropWindowRect.left - this.mStartCropWindowRect.left) * interpolatedTime);
        this.mAnimRect.top = this.mStartCropWindowRect.top + ((this.mEndCropWindowRect.top - this.mStartCropWindowRect.top) * interpolatedTime);
        this.mAnimRect.right = this.mStartCropWindowRect.right + ((this.mEndCropWindowRect.right - this.mStartCropWindowRect.right) * interpolatedTime);
        this.mAnimRect.bottom = this.mStartCropWindowRect.bottom + ((this.mEndCropWindowRect.bottom - this.mStartCropWindowRect.bottom) * interpolatedTime);
        this.mCropOverlayView.setCropWindowRect(this.mAnimRect);
        this.mAnimRect.left = this.mStartImageRect.left + ((this.mEndImageRect.left - this.mStartImageRect.left) * interpolatedTime);
        this.mAnimRect.top = this.mStartImageRect.top + ((this.mEndImageRect.top - this.mStartImageRect.top) * interpolatedTime);
        this.mAnimRect.right = this.mStartImageRect.right + ((this.mEndImageRect.right - this.mStartImageRect.right) * interpolatedTime);
        this.mAnimRect.bottom = this.mStartImageRect.bottom + ((this.mEndImageRect.bottom - this.mStartImageRect.bottom) * interpolatedTime);
        this.mCropOverlayView.setBitmapRect(this.mAnimRect, this.mImageView.getWidth(), this.mImageView.getHeight());
        for (int i = 0; i < this.mAnimMatrix.length; i++) {
            this.mAnimMatrix[i] = this.mStartImageMatrix[i] + ((this.mEndImageMatrix[i] - this.mStartImageMatrix[i]) * interpolatedTime);
        }
        Matrix m = this.mImageView.getImageMatrix();
        m.setValues(this.mAnimMatrix);
        this.mImageView.setImageMatrix(m);
        this.mImageView.invalidate();
        this.mCropOverlayView.invalidate();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationStart(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationEnd(Animation animation) {
        this.mImageView.clearAnimation();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationRepeat(Animation animation) {
    }
}
