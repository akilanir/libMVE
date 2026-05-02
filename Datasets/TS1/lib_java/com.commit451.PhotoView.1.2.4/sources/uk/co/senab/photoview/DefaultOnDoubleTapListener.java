package uk.co.senab.photoview;

import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.widget.ImageView;

/* loaded from: com.commit451.PhotoView.1.2.4.jar:uk/co/senab/photoview/DefaultOnDoubleTapListener.class */
public class DefaultOnDoubleTapListener implements GestureDetector.OnDoubleTapListener {
    private PhotoViewAttacher photoViewAttacher;

    public DefaultOnDoubleTapListener(PhotoViewAttacher photoViewAttacher) {
        setPhotoViewAttacher(photoViewAttacher);
    }

    public void setPhotoViewAttacher(PhotoViewAttacher newPhotoViewAttacher) {
        this.photoViewAttacher = newPhotoViewAttacher;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onSingleTapConfirmed(MotionEvent e) {
        RectF displayRect;
        if (this.photoViewAttacher == null) {
            return false;
        }
        ImageView imageView = this.photoViewAttacher.getImageView();
        if (null != this.photoViewAttacher.getOnPhotoTapListener() && null != (displayRect = this.photoViewAttacher.getDisplayRect())) {
            float x = e.getX();
            float y = e.getY();
            if (displayRect.contains(x, y)) {
                float xResult = (x - displayRect.left) / displayRect.width();
                float yResult = (y - displayRect.top) / displayRect.height();
                this.photoViewAttacher.getOnPhotoTapListener().onPhotoTap(imageView, xResult, yResult);
                return true;
            }
        }
        if (null != this.photoViewAttacher.getOnViewTapListener()) {
            this.photoViewAttacher.getOnViewTapListener().onViewTap(imageView, e.getX(), e.getY());
            return false;
        }
        return false;
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent ev) {
        if (this.photoViewAttacher == null) {
            return false;
        }
        try {
            float scale = this.photoViewAttacher.getScale();
            float x = ev.getX();
            float y = ev.getY();
            if (scale < this.photoViewAttacher.getMediumScale()) {
                this.photoViewAttacher.setScale(this.photoViewAttacher.getMediumScale(), x, y, true);
            } else if (scale >= this.photoViewAttacher.getMediumScale() && scale < this.photoViewAttacher.getMaximumScale()) {
                this.photoViewAttacher.setScale(this.photoViewAttacher.getMaximumScale(), x, y, true);
            } else {
                this.photoViewAttacher.setScale(this.photoViewAttacher.getMinimumScale(), x, y, true);
            }
            return true;
        } catch (ArrayIndexOutOfBoundsException e) {
            return true;
        }
    }

    @Override // android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTapEvent(MotionEvent e) {
        return false;
    }
}
