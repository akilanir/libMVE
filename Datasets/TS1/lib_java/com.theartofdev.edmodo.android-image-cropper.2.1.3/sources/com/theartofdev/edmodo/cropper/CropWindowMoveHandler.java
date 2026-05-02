package com.theartofdev.edmodo.cropper;

import android.graphics.PointF;
import android.graphics.RectF;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropWindowMoveHandler.class */
final class CropWindowMoveHandler {
    private final CropWindowHandler mCropWindowHandler;
    private final Type mType;
    private final PointF mTouchOffset = new PointF();

    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type.class */
    public enum Type {
        TOP_LEFT,
        TOP_RIGHT,
        BOTTOM_LEFT,
        BOTTOM_RIGHT,
        LEFT,
        TOP,
        RIGHT,
        BOTTOM,
        CENTER
    }

    public CropWindowMoveHandler(Type type, CropWindowHandler cropWindowHandler, float touchX, float touchY) {
        this.mType = type;
        this.mCropWindowHandler = cropWindowHandler;
        calculateTouchOffset(touchX, touchY);
    }

    public void move(float x, float y, RectF bounds, int viewWidth, int viewHeight, float snapMargin, boolean fixedAspectRatio, float aspectRatio) {
        float adjX = x + this.mTouchOffset.x;
        float adjY = y + this.mTouchOffset.y;
        if (this.mType == Type.CENTER) {
            moveCenter(adjX, adjY, bounds, viewWidth, viewHeight, snapMargin);
        } else if (fixedAspectRatio) {
            moveSizeWithFixedAspectRatio(adjX, adjY, bounds, viewWidth, viewHeight, snapMargin, aspectRatio);
        } else {
            moveSizeWithFreeAspectRatio(adjX, adjY, bounds, viewWidth, viewHeight, snapMargin);
        }
    }

    private void calculateTouchOffset(float touchX, float touchY) {
        float touchOffsetX = 0.0f;
        float touchOffsetY = 0.0f;
        RectF rect = this.mCropWindowHandler.getRect();
        switch (AnonymousClass1.$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[this.mType.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                touchOffsetX = rect.left - touchX;
                touchOffsetY = rect.top - touchY;
                break;
            case 2:
                touchOffsetX = rect.right - touchX;
                touchOffsetY = rect.top - touchY;
                break;
            case 3:
                touchOffsetX = rect.left - touchX;
                touchOffsetY = rect.bottom - touchY;
                break;
            case 4:
                touchOffsetX = rect.right - touchX;
                touchOffsetY = rect.bottom - touchY;
                break;
            case 5:
                touchOffsetX = rect.left - touchX;
                touchOffsetY = 0.0f;
                break;
            case 6:
                touchOffsetX = 0.0f;
                touchOffsetY = rect.top - touchY;
                break;
            case 7:
                touchOffsetX = rect.right - touchX;
                touchOffsetY = 0.0f;
                break;
            case 8:
                touchOffsetX = 0.0f;
                touchOffsetY = rect.bottom - touchY;
                break;
            case 9:
                touchOffsetX = rect.centerX() - touchX;
                touchOffsetY = rect.centerY() - touchY;
                break;
        }
        this.mTouchOffset.x = touchOffsetX;
        this.mTouchOffset.y = touchOffsetY;
    }

    /* renamed from: com.theartofdev.edmodo.cropper.CropWindowMoveHandler$1, reason: invalid class name */
    /* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropWindowMoveHandler$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type = new int[Type.values().length];

        static {
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.TOP_LEFT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.TOP_RIGHT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.BOTTOM_LEFT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.BOTTOM_RIGHT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.LEFT.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.TOP.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.RIGHT.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.BOTTOM.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[Type.CENTER.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
        }
    }

    private void moveCenter(float x, float y, RectF bounds, int viewWidth, int viewHeight, float snapRadius) {
        RectF rect = this.mCropWindowHandler.getRect();
        float dx = x - rect.centerX();
        float dy = y - rect.centerY();
        if (rect.left + dx < 0.0f || rect.right + dx > viewWidth) {
            dx /= 1.05f;
            this.mTouchOffset.x -= dx / 2.0f;
        }
        if (rect.top + dy < 0.0f || rect.bottom + dy > viewHeight) {
            dy /= 1.05f;
            this.mTouchOffset.y -= dy / 2.0f;
        }
        rect.offset(dx, dy);
        snapEdgesToBounds(rect, bounds, snapRadius);
        this.mCropWindowHandler.setRect(rect);
    }

    private void moveSizeWithFreeAspectRatio(float x, float y, RectF bounds, int viewWidth, int viewHeight, float snapMargin) {
        switch (AnonymousClass1.$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[this.mType.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                adjustTop(y, bounds, snapMargin, 0.0f, false, false);
                adjustLeft(x, bounds, snapMargin, 0.0f, false, false);
                break;
            case 2:
                adjustTop(y, bounds, snapMargin, 0.0f, false, false);
                adjustRight(x, bounds, viewWidth, snapMargin, 0.0f, false, false);
                break;
            case 3:
                adjustBottom(y, bounds, viewHeight, snapMargin, 0.0f, false, false);
                adjustLeft(x, bounds, snapMargin, 0.0f, false, false);
                break;
            case 4:
                adjustBottom(y, bounds, viewHeight, snapMargin, 0.0f, false, false);
                adjustRight(x, bounds, viewWidth, snapMargin, 0.0f, false, false);
                break;
            case 5:
                adjustLeft(x, bounds, snapMargin, 0.0f, false, false);
                break;
            case 6:
                adjustTop(y, bounds, snapMargin, 0.0f, false, false);
                break;
            case 7:
                adjustRight(x, bounds, viewWidth, snapMargin, 0.0f, false, false);
                break;
            case 8:
                adjustBottom(y, bounds, viewHeight, snapMargin, 0.0f, false, false);
                break;
        }
    }

    private void moveSizeWithFixedAspectRatio(float x, float y, RectF bounds, int viewWidth, int viewHeight, float snapMargin, float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        switch (AnonymousClass1.$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type[this.mType.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                if (calculateAspectRatio(x, y, rect.right, rect.bottom) < aspectRatio) {
                    adjustTop(y, bounds, snapMargin, aspectRatio, true, false);
                    adjustLeftByAspectRatio(aspectRatio);
                    break;
                } else {
                    adjustLeft(x, bounds, snapMargin, aspectRatio, true, false);
                    adjustTopByAspectRatio(aspectRatio);
                    break;
                }
            case 2:
                if (calculateAspectRatio(rect.left, y, x, rect.bottom) < aspectRatio) {
                    adjustTop(y, bounds, snapMargin, aspectRatio, false, true);
                    adjustRightByAspectRatio(aspectRatio);
                    break;
                } else {
                    adjustRight(x, bounds, viewWidth, snapMargin, aspectRatio, true, false);
                    adjustTopByAspectRatio(aspectRatio);
                    break;
                }
            case 3:
                if (calculateAspectRatio(x, rect.top, rect.right, y) < aspectRatio) {
                    adjustBottom(y, bounds, viewHeight, snapMargin, aspectRatio, true, false);
                    adjustLeftByAspectRatio(aspectRatio);
                    break;
                } else {
                    adjustLeft(x, bounds, snapMargin, aspectRatio, false, true);
                    adjustBottomByAspectRatio(aspectRatio);
                    break;
                }
            case 4:
                if (calculateAspectRatio(rect.left, rect.top, x, y) < aspectRatio) {
                    adjustBottom(y, bounds, viewHeight, snapMargin, aspectRatio, false, true);
                    adjustRightByAspectRatio(aspectRatio);
                    break;
                } else {
                    adjustRight(x, bounds, viewWidth, snapMargin, aspectRatio, false, true);
                    adjustBottomByAspectRatio(aspectRatio);
                    break;
                }
            case 5:
                adjustLeft(x, bounds, snapMargin, aspectRatio, true, true);
                adjustTopBottomByAspectRatio(bounds, aspectRatio);
                break;
            case 6:
                adjustTop(y, bounds, snapMargin, aspectRatio, true, true);
                adjustLeftRightByAspectRatio(bounds, aspectRatio);
                break;
            case 7:
                adjustRight(x, bounds, viewWidth, snapMargin, aspectRatio, true, true);
                adjustTopBottomByAspectRatio(bounds, aspectRatio);
                break;
            case 8:
                adjustBottom(y, bounds, viewHeight, snapMargin, aspectRatio, true, true);
                adjustLeftRightByAspectRatio(bounds, aspectRatio);
                break;
        }
    }

    private void snapEdgesToBounds(RectF edges, RectF bounds, float margin) {
        if (edges.left < bounds.left + margin) {
            edges.offset(bounds.left - edges.left, 0.0f);
        }
        if (edges.top < bounds.top + margin) {
            edges.offset(0.0f, bounds.top - edges.top);
        }
        if (edges.right > bounds.right - margin) {
            edges.offset(bounds.right - edges.right, 0.0f);
        }
        if (edges.bottom > bounds.bottom - margin) {
            edges.offset(0.0f, bounds.bottom - edges.bottom);
        }
    }

    private void adjustLeft(float left, RectF bounds, float snapMargin, float aspectRatio, boolean topMoves, boolean bottomMoves) {
        RectF rect = this.mCropWindowHandler.getRect();
        float newLeft = left;
        if (newLeft < 0.0f) {
            newLeft /= 1.05f;
            this.mTouchOffset.x -= newLeft / 1.1f;
        }
        if (newLeft - bounds.left < snapMargin) {
            newLeft = bounds.left;
        }
        if (rect.right - newLeft < this.mCropWindowHandler.getMinCropWidth()) {
            newLeft = rect.right - this.mCropWindowHandler.getMinCropWidth();
        }
        if (rect.right - newLeft > this.mCropWindowHandler.getMaxCropWidth()) {
            newLeft = rect.right - this.mCropWindowHandler.getMaxCropWidth();
        }
        if (newLeft - bounds.left < snapMargin) {
            newLeft = bounds.left;
        }
        if (aspectRatio > 0.0f) {
            float newHeight = (rect.right - newLeft) / aspectRatio;
            if (newHeight < this.mCropWindowHandler.getMinCropHeight()) {
                newLeft = Math.max(bounds.left, rect.right - (this.mCropWindowHandler.getMinCropHeight() * aspectRatio));
                newHeight = (rect.right - newLeft) / aspectRatio;
            }
            if (newHeight > this.mCropWindowHandler.getMaxCropHeight()) {
                newLeft = Math.max(bounds.left, rect.right - (this.mCropWindowHandler.getMaxCropHeight() * aspectRatio));
                newHeight = (rect.right - newLeft) / aspectRatio;
            }
            if (topMoves && bottomMoves) {
                newLeft = Math.max(newLeft, Math.max(bounds.left, rect.right - (bounds.height() * aspectRatio)));
            } else {
                if (topMoves && rect.bottom - newHeight < bounds.top) {
                    newLeft = Math.max(bounds.left, rect.right - ((rect.bottom - bounds.top) * aspectRatio));
                    newHeight = (rect.right - newLeft) / aspectRatio;
                }
                if (bottomMoves && rect.top + newHeight > bounds.bottom) {
                    newLeft = Math.max(newLeft, Math.max(bounds.left, rect.right - ((bounds.bottom - rect.top) * aspectRatio)));
                }
            }
        }
        rect.left = newLeft;
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustRight(float right, RectF bounds, int viewWidth, float snapMargin, float aspectRatio, boolean topMoves, boolean bottomMoves) {
        RectF rect = this.mCropWindowHandler.getRect();
        float newRight = right;
        if (newRight > viewWidth) {
            newRight = viewWidth + ((newRight - viewWidth) / 1.05f);
            this.mTouchOffset.x -= (newRight - viewWidth) / 1.1f;
        }
        if (bounds.right - newRight < snapMargin) {
            newRight = bounds.right;
        }
        if (newRight - rect.left < this.mCropWindowHandler.getMinCropWidth()) {
            newRight = rect.left + this.mCropWindowHandler.getMinCropWidth();
        }
        if (newRight - rect.left > this.mCropWindowHandler.getMaxCropWidth()) {
            newRight = rect.left + this.mCropWindowHandler.getMaxCropWidth();
        }
        if (bounds.right - newRight < snapMargin) {
            newRight = bounds.right;
        }
        if (aspectRatio > 0.0f) {
            float newHeight = (newRight - rect.left) / aspectRatio;
            if (newHeight < this.mCropWindowHandler.getMinCropHeight()) {
                newRight = Math.min(bounds.right, rect.left + (this.mCropWindowHandler.getMinCropHeight() * aspectRatio));
                newHeight = (newRight - rect.left) / aspectRatio;
            }
            if (newHeight > this.mCropWindowHandler.getMaxCropHeight()) {
                newRight = Math.min(bounds.right, rect.left + (this.mCropWindowHandler.getMaxCropHeight() * aspectRatio));
                newHeight = (newRight - rect.left) / aspectRatio;
            }
            if (topMoves && bottomMoves) {
                newRight = Math.min(newRight, Math.min(bounds.right, rect.left + (bounds.height() * aspectRatio)));
            } else {
                if (topMoves && rect.bottom - newHeight < bounds.top) {
                    newRight = Math.min(bounds.right, rect.left + ((rect.bottom - bounds.top) * aspectRatio));
                    newHeight = (newRight - rect.left) / aspectRatio;
                }
                if (bottomMoves && rect.top + newHeight > bounds.bottom) {
                    newRight = Math.min(newRight, Math.min(bounds.right, rect.left + ((bounds.bottom - rect.top) * aspectRatio)));
                }
            }
        }
        rect.right = newRight;
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustTop(float top, RectF bounds, float snapMargin, float aspectRatio, boolean leftMoves, boolean rightMoves) {
        RectF rect = this.mCropWindowHandler.getRect();
        float newTop = top;
        if (newTop < 0.0f) {
            newTop /= 1.05f;
            this.mTouchOffset.y -= newTop / 1.1f;
        }
        if (newTop - bounds.top < snapMargin) {
            newTop = bounds.top;
        }
        if (rect.bottom - newTop < this.mCropWindowHandler.getMinCropHeight()) {
            newTop = rect.bottom - this.mCropWindowHandler.getMinCropHeight();
        }
        if (rect.bottom - newTop > this.mCropWindowHandler.getMaxCropHeight()) {
            newTop = rect.bottom - this.mCropWindowHandler.getMaxCropHeight();
        }
        if (newTop - bounds.top < snapMargin) {
            newTop = bounds.top;
        }
        if (aspectRatio > 0.0f) {
            float newWidth = (rect.bottom - newTop) * aspectRatio;
            if (newWidth < this.mCropWindowHandler.getMinCropWidth()) {
                newTop = Math.max(bounds.top, rect.bottom - (this.mCropWindowHandler.getMinCropWidth() / aspectRatio));
                newWidth = (rect.bottom - newTop) * aspectRatio;
            }
            if (newWidth > this.mCropWindowHandler.getMaxCropWidth()) {
                newTop = Math.max(bounds.top, rect.bottom - (this.mCropWindowHandler.getMaxCropWidth() / aspectRatio));
                newWidth = (rect.bottom - newTop) * aspectRatio;
            }
            if (leftMoves && rightMoves) {
                newTop = Math.max(newTop, Math.max(bounds.top, rect.bottom - (bounds.width() / aspectRatio)));
            } else {
                if (leftMoves && rect.right - newWidth < bounds.left) {
                    newTop = Math.max(bounds.top, rect.bottom - ((rect.right - bounds.left) / aspectRatio));
                    newWidth = (rect.bottom - newTop) * aspectRatio;
                }
                if (rightMoves && rect.left + newWidth > bounds.right) {
                    newTop = Math.max(newTop, Math.max(bounds.top, rect.bottom - ((bounds.right - rect.left) / aspectRatio)));
                }
            }
        }
        rect.top = newTop;
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustBottom(float bottom, RectF bounds, int viewHeight, float snapMargin, float aspectRatio, boolean leftMoves, boolean rightMoves) {
        RectF rect = this.mCropWindowHandler.getRect();
        float newBottom = bottom;
        if (newBottom > viewHeight) {
            newBottom = viewHeight + ((newBottom - viewHeight) / 1.05f);
            this.mTouchOffset.y -= (newBottom - viewHeight) / 1.1f;
        }
        if (bounds.bottom - newBottom < snapMargin) {
            newBottom = bounds.bottom;
        }
        if (newBottom - rect.top < this.mCropWindowHandler.getMinCropHeight()) {
            newBottom = rect.top + this.mCropWindowHandler.getMinCropHeight();
        }
        if (newBottom - rect.top > this.mCropWindowHandler.getMaxCropHeight()) {
            newBottom = rect.top + this.mCropWindowHandler.getMaxCropHeight();
        }
        if (bounds.bottom - newBottom < snapMargin) {
            newBottom = bounds.bottom;
        }
        if (aspectRatio > 0.0f) {
            float newWidth = (newBottom - rect.top) * aspectRatio;
            if (newWidth < this.mCropWindowHandler.getMinCropWidth()) {
                newBottom = Math.min(bounds.bottom, rect.top + (this.mCropWindowHandler.getMinCropWidth() / aspectRatio));
                newWidth = (newBottom - rect.top) * aspectRatio;
            }
            if (newWidth > this.mCropWindowHandler.getMaxCropWidth()) {
                newBottom = Math.min(bounds.bottom, rect.top + (this.mCropWindowHandler.getMaxCropWidth() / aspectRatio));
                newWidth = (newBottom - rect.top) * aspectRatio;
            }
            if (leftMoves && rightMoves) {
                newBottom = Math.min(newBottom, Math.min(bounds.bottom, rect.top + (bounds.width() / aspectRatio)));
            } else {
                if (leftMoves && rect.right - newWidth < bounds.left) {
                    newBottom = Math.min(bounds.bottom, rect.top + ((rect.right - bounds.left) / aspectRatio));
                    newWidth = (newBottom - rect.top) * aspectRatio;
                }
                if (rightMoves && rect.left + newWidth > bounds.right) {
                    newBottom = Math.min(newBottom, Math.min(bounds.bottom, rect.top + ((bounds.right - rect.left) / aspectRatio)));
                }
            }
        }
        rect.bottom = newBottom;
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustLeftByAspectRatio(float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.left = rect.right - (rect.height() * aspectRatio);
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustTopByAspectRatio(float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.top = rect.bottom - (rect.width() / aspectRatio);
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustRightByAspectRatio(float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.right = rect.left + (rect.height() * aspectRatio);
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustBottomByAspectRatio(float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.bottom = rect.top + (rect.width() / aspectRatio);
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustLeftRightByAspectRatio(RectF bounds, float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.inset((rect.width() - (rect.height() * aspectRatio)) / 2.0f, 0.0f);
        if (rect.left < bounds.left) {
            rect.offset(bounds.left - rect.left, 0.0f);
        }
        if (rect.right > bounds.right) {
            rect.offset(bounds.right - rect.right, 0.0f);
        }
        this.mCropWindowHandler.setRect(rect);
    }

    private void adjustTopBottomByAspectRatio(RectF bounds, float aspectRatio) {
        RectF rect = this.mCropWindowHandler.getRect();
        rect.inset(0.0f, (rect.height() - (rect.width() / aspectRatio)) / 2.0f);
        if (rect.top < bounds.top) {
            rect.offset(0.0f, bounds.top - rect.top);
        }
        if (rect.bottom > bounds.bottom) {
            rect.offset(0.0f, bounds.bottom - rect.bottom);
        }
        this.mCropWindowHandler.setRect(rect);
    }

    private static float calculateAspectRatio(float left, float top, float right, float bottom) {
        return (right - left) / (bottom - top);
    }
}
