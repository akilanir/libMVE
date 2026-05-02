package uk.co.senab.photoview;

import android.graphics.Matrix;
import android.graphics.RectF;
import android.view.View;
import android.widget.ImageView;
import uk.co.senab.photoview.PhotoViewAttacher;

/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/IPhotoView.class */
public interface IPhotoView {
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

    void setOnViewTapListener(PhotoViewAttacher.OnViewTapListener onViewTapListener);

    void setScale(float f);

    void setScale(float f, boolean z);

    void setScale(float f, float f2, float f3, boolean z);

    void setScaleType(ImageView.ScaleType scaleType);

    void setZoomable(boolean z);

    void setPhotoViewRotation(float f);
}
