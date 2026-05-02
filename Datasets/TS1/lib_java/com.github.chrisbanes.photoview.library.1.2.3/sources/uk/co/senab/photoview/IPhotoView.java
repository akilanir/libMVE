package uk.co.senab.photoview;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.View;
import android.widget.ImageView;
import uk.co.senab.photoview.PhotoViewAttacher;

/* loaded from: com.github.chrisbanes.photoview.library.1.2.3.jar:uk/co/senab/photoview/IPhotoView.class */
public interface IPhotoView {
    public static final float DEFAULT_MAX_SCALE = 3.0f;
    public static final float DEFAULT_MID_SCALE = 1.75f;
    public static final float DEFAULT_MIN_SCALE = 1.0f;
    public static final int DEFAULT_ZOOM_DURATION = 200;

    boolean canZoom();

    RectF getDisplayRect();

    boolean setDisplayMatrix(Matrix matrix);

    Matrix getDisplayMatrix();

    @Deprecated
    float getMinScale();

    float getMinimumScale();

    @Deprecated
    float getMidScale();

    float getMediumScale();

    @Deprecated
    float getMaxScale();

    float getMaximumScale();

    float getScale();

    ImageView.ScaleType getScaleType();

    void setAllowParentInterceptOnEdge(boolean z);

    @Deprecated
    void setMinScale(float f);

    void setMinimumScale(float f);

    @Deprecated
    void setMidScale(float f);

    void setMediumScale(float f);

    @Deprecated
    void setMaxScale(float f);

    void setMaximumScale(float f);

    void setOnLongClickListener(View.OnLongClickListener onLongClickListener);

    void setOnMatrixChangeListener(PhotoViewAttacher.OnMatrixChangedListener onMatrixChangedListener);

    void setOnPhotoTapListener(PhotoViewAttacher.OnPhotoTapListener onPhotoTapListener);

    PhotoViewAttacher.OnPhotoTapListener getOnPhotoTapListener();

    void setOnViewTapListener(PhotoViewAttacher.OnViewTapListener onViewTapListener);

    void setRotationTo(float f);

    void setRotationBy(float f);

    PhotoViewAttacher.OnViewTapListener getOnViewTapListener();

    void setScale(float f);

    void setScale(float f, boolean z);

    void setScale(float f, float f2, float f3, boolean z);

    void setScaleType(ImageView.ScaleType scaleType);

    void setZoomable(boolean z);

    void setPhotoViewRotation(float f);

    Bitmap getVisibleRectangleBitmap();

    void setZoomTransitionDuration(int i);

    IPhotoView getIPhotoViewImplementation();

    void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener onDoubleTapListener);
}
