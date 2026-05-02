package com.theartofdev.edmodo.cropper;

import android.graphics.RectF;
import com.theartofdev.edmodo.cropper.CropImageView;
import com.theartofdev.edmodo.cropper.CropWindowMoveHandler;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropWindowHandler.class */
final class CropWindowHandler {
    private float mMinCropWindowWidth;
    private float mMinCropWindowHeight;
    private float mMaxCropWindowWidth;
    private float mMaxCropWindowHeight;
    private float mMinCropResultWidth;
    private float mMinCropResultHeight;
    private float mMaxCropResultWidth;
    private float mMaxCropResultHeight;
    private final RectF mEdges = new RectF();
    private final RectF mGetEdges = new RectF();
    private float mScaleFactorWidth = 1.0f;
    private float mScaleFactorHeight = 1.0f;

    CropWindowHandler() {
    }

    public RectF getRect() {
        this.mGetEdges.set(this.mEdges);
        return this.mGetEdges;
    }

    public float getMinCropWidth() {
        return Math.max(this.mMinCropWindowWidth, this.mMinCropResultWidth / this.mScaleFactorWidth);
    }

    public float getMinCropHeight() {
        return Math.max(this.mMinCropWindowHeight, this.mMinCropResultHeight / this.mScaleFactorHeight);
    }

    public float getMaxCropWidth() {
        return Math.min(this.mMaxCropWindowWidth, this.mMaxCropResultWidth / this.mScaleFactorWidth);
    }

    public float getMaxCropHeight() {
        return Math.min(this.mMaxCropWindowHeight, this.mMaxCropResultHeight / this.mScaleFactorHeight);
    }

    public float getScaleFactorWidth() {
        return this.mScaleFactorWidth;
    }

    public float getScaleFactorHeight() {
        return this.mScaleFactorHeight;
    }

    public void setCropWindowLimits(float maxWidth, float maxHeight, float scaleFactorWidth, float scaleFactorHeight) {
        this.mMaxCropWindowWidth = maxWidth;
        this.mMaxCropWindowHeight = maxHeight;
        this.mScaleFactorWidth = scaleFactorWidth;
        this.mScaleFactorHeight = scaleFactorHeight;
    }

    public void setInitialAttributeValues(CropImageOptions options) {
        this.mMinCropWindowWidth = options.minCropWindowWidth;
        this.mMinCropWindowHeight = options.minCropWindowHeight;
        this.mMinCropResultWidth = options.minCropResultWidth;
        this.mMinCropResultHeight = options.minCropResultHeight;
        this.mMaxCropResultWidth = options.maxCropResultWidth;
        this.mMaxCropResultHeight = options.maxCropResultHeight;
    }

    public void setRect(RectF rect) {
        this.mEdges.set(rect);
    }

    public boolean showGuidelines() {
        return this.mEdges.width() >= 100.0f && this.mEdges.height() >= 100.0f;
    }

    public CropWindowMoveHandler getMoveHandler(float x, float y, float targetRadius, CropImageView.CropShape cropShape) {
        CropWindowMoveHandler.Type rectanglePressedMoveType;
        if (cropShape == CropImageView.CropShape.OVAL) {
            rectanglePressedMoveType = getOvalPressedMoveType(x, y);
        } else {
            rectanglePressedMoveType = getRectanglePressedMoveType(x, y, targetRadius);
        }
        CropWindowMoveHandler.Type type = rectanglePressedMoveType;
        if (type != null) {
            return new CropWindowMoveHandler(type, this, x, y);
        }
        return null;
    }

    private CropWindowMoveHandler.Type getRectanglePressedMoveType(float x, float y, float targetRadius) {
        CropWindowMoveHandler.Type moveType = null;
        if (isInCornerTargetZone(x, y, this.mEdges.left, this.mEdges.top, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.TOP_LEFT;
        } else if (isInCornerTargetZone(x, y, this.mEdges.right, this.mEdges.top, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.TOP_RIGHT;
        } else if (isInCornerTargetZone(x, y, this.mEdges.left, this.mEdges.bottom, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.BOTTOM_LEFT;
        } else if (isInCornerTargetZone(x, y, this.mEdges.right, this.mEdges.bottom, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.BOTTOM_RIGHT;
        } else if (isInCenterTargetZone(x, y, this.mEdges.left, this.mEdges.top, this.mEdges.right, this.mEdges.bottom) && focusCenter()) {
            moveType = CropWindowMoveHandler.Type.CENTER;
        } else if (isInHorizontalTargetZone(x, y, this.mEdges.left, this.mEdges.right, this.mEdges.top, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.TOP;
        } else if (isInHorizontalTargetZone(x, y, this.mEdges.left, this.mEdges.right, this.mEdges.bottom, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.BOTTOM;
        } else if (isInVerticalTargetZone(x, y, this.mEdges.left, this.mEdges.top, this.mEdges.bottom, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.LEFT;
        } else if (isInVerticalTargetZone(x, y, this.mEdges.right, this.mEdges.top, this.mEdges.bottom, targetRadius)) {
            moveType = CropWindowMoveHandler.Type.RIGHT;
        } else if (isInCenterTargetZone(x, y, this.mEdges.left, this.mEdges.top, this.mEdges.right, this.mEdges.bottom) && !focusCenter()) {
            moveType = CropWindowMoveHandler.Type.CENTER;
        }
        return moveType;
    }

    private CropWindowMoveHandler.Type getOvalPressedMoveType(float x, float y) {
        CropWindowMoveHandler.Type moveType;
        float cellLength = this.mEdges.width() / 6.0f;
        float leftCenter = this.mEdges.left + cellLength;
        float rightCenter = this.mEdges.left + (5.0f * cellLength);
        float cellHeight = this.mEdges.height() / 6.0f;
        float topCenter = this.mEdges.top + cellHeight;
        float bottomCenter = this.mEdges.top + (5.0f * cellHeight);
        if (x < leftCenter) {
            if (y < topCenter) {
                moveType = CropWindowMoveHandler.Type.TOP_LEFT;
            } else if (y < bottomCenter) {
                moveType = CropWindowMoveHandler.Type.LEFT;
            } else {
                moveType = CropWindowMoveHandler.Type.BOTTOM_LEFT;
            }
        } else if (x < rightCenter) {
            if (y < topCenter) {
                moveType = CropWindowMoveHandler.Type.TOP;
            } else if (y < bottomCenter) {
                moveType = CropWindowMoveHandler.Type.CENTER;
            } else {
                moveType = CropWindowMoveHandler.Type.BOTTOM;
            }
        } else if (y < topCenter) {
            moveType = CropWindowMoveHandler.Type.TOP_RIGHT;
        } else if (y < bottomCenter) {
            moveType = CropWindowMoveHandler.Type.RIGHT;
        } else {
            moveType = CropWindowMoveHandler.Type.BOTTOM_RIGHT;
        }
        return moveType;
    }

    private static boolean isInCornerTargetZone(float x, float y, float handleX, float handleY, float targetRadius) {
        return Math.abs(x - handleX) <= targetRadius && Math.abs(y - handleY) <= targetRadius;
    }

    private static boolean isInHorizontalTargetZone(float x, float y, float handleXStart, float handleXEnd, float handleY, float targetRadius) {
        return x > handleXStart && x < handleXEnd && Math.abs(y - handleY) <= targetRadius;
    }

    private static boolean isInVerticalTargetZone(float x, float y, float handleX, float handleYStart, float handleYEnd, float targetRadius) {
        return Math.abs(x - handleX) <= targetRadius && y > handleYStart && y < handleYEnd;
    }

    private static boolean isInCenterTargetZone(float x, float y, float left, float top, float right, float bottom) {
        return x > left && x < right && y > top && y < bottom;
    }

    private boolean focusCenter() {
        return !showGuidelines();
    }
}
