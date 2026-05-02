package com.journeyapps.barcodescanner;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import com.google.zxing.ResultPoint;
import com.google.zxing.client.android.R;
import com.journeyapps.barcodescanner.CameraPreview;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/ViewfinderView.class */
public final class ViewfinderView extends View {
    private static final String TAG = ViewfinderView.class.getSimpleName();
    private static final int[] SCANNER_ALPHA = {0, 64, 128, 192, 255, 192, 128, 64};
    private static final long ANIMATION_DELAY = 80;
    private static final int CURRENT_POINT_OPACITY = 160;
    private static final int MAX_RESULT_POINTS = 20;
    private static final int POINT_SIZE = 6;
    private final Paint paint;
    private Bitmap resultBitmap;
    private final int maskColor;
    private final int resultColor;
    private final int laserColor;
    private final int resultPointColor;
    private int scannerAlpha;
    private List<ResultPoint> possibleResultPoints;
    private List<ResultPoint> lastPossibleResultPoints;
    private CameraPreview cameraPreview;

    public ViewfinderView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.paint = new Paint(1);
        Resources resources = getResources();
        TypedArray attributes = getContext().obtainStyledAttributes(attrs, R.styleable.zxing_finder);
        this.maskColor = attributes.getColor(R.styleable.zxing_finder_zxing_viewfinder_mask, resources.getColor(R.color.zxing_viewfinder_mask));
        this.resultColor = attributes.getColor(R.styleable.zxing_finder_zxing_result_view, resources.getColor(R.color.zxing_result_view));
        this.laserColor = attributes.getColor(R.styleable.zxing_finder_zxing_viewfinder_laser, resources.getColor(R.color.zxing_viewfinder_laser));
        this.resultPointColor = attributes.getColor(R.styleable.zxing_finder_zxing_possible_result_points, resources.getColor(R.color.zxing_possible_result_points));
        attributes.recycle();
        this.scannerAlpha = 0;
        this.possibleResultPoints = new ArrayList(5);
        this.lastPossibleResultPoints = null;
    }

    public void setCameraPreview(CameraPreview view) {
        this.cameraPreview = view;
        view.addStateListener(new CameraPreview.StateListener() { // from class: com.journeyapps.barcodescanner.ViewfinderView.1
            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewSized() {
                ViewfinderView.this.invalidate();
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStarted() {
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStopped() {
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void cameraError(Exception error) {
            }
        });
    }

    @Override // android.view.View
    @SuppressLint({"DrawAllocation"})
    public void onDraw(Canvas canvas) {
        if (this.cameraPreview == null || this.cameraPreview.getPreviewFramingRect() == null || this.cameraPreview.getFramingRect() == null) {
            return;
        }
        Rect frame = this.cameraPreview.getFramingRect();
        Rect previewFrame = this.cameraPreview.getPreviewFramingRect();
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        this.paint.setColor(this.resultBitmap != null ? this.resultColor : this.maskColor);
        canvas.drawRect(0.0f, 0.0f, width, frame.top, this.paint);
        canvas.drawRect(0.0f, frame.top, frame.left, frame.bottom + 1, this.paint);
        canvas.drawRect(frame.right + 1, frame.top, width, frame.bottom + 1, this.paint);
        canvas.drawRect(0.0f, frame.bottom + 1, width, height, this.paint);
        if (this.resultBitmap != null) {
            this.paint.setAlpha(CURRENT_POINT_OPACITY);
            canvas.drawBitmap(this.resultBitmap, (Rect) null, frame, this.paint);
            return;
        }
        this.paint.setColor(this.laserColor);
        this.paint.setAlpha(SCANNER_ALPHA[this.scannerAlpha]);
        this.scannerAlpha = (this.scannerAlpha + 1) % SCANNER_ALPHA.length;
        int middle = (frame.height() / 2) + frame.top;
        canvas.drawRect(frame.left + 2, middle - 1, frame.right - 1, middle + 2, this.paint);
        float scaleX = frame.width() / previewFrame.width();
        float scaleY = frame.height() / previewFrame.height();
        List<ResultPoint> currentPossible = this.possibleResultPoints;
        List<ResultPoint> currentLast = this.lastPossibleResultPoints;
        int frameLeft = frame.left;
        int frameTop = frame.top;
        if (currentPossible.isEmpty()) {
            this.lastPossibleResultPoints = null;
        } else {
            this.possibleResultPoints = new ArrayList(5);
            this.lastPossibleResultPoints = currentPossible;
            this.paint.setAlpha(CURRENT_POINT_OPACITY);
            this.paint.setColor(this.resultPointColor);
            for (ResultPoint point : currentPossible) {
                canvas.drawCircle(frameLeft + ((int) (point.getX() * scaleX)), frameTop + ((int) (point.getY() * scaleY)), 6.0f, this.paint);
            }
        }
        if (currentLast != null) {
            this.paint.setAlpha(80);
            this.paint.setColor(this.resultPointColor);
            for (ResultPoint point2 : currentLast) {
                canvas.drawCircle(frameLeft + ((int) (point2.getX() * scaleX)), frameTop + ((int) (point2.getY() * scaleY)), 3.0f, this.paint);
            }
        }
        postInvalidateDelayed(ANIMATION_DELAY, frame.left - POINT_SIZE, frame.top - POINT_SIZE, frame.right + POINT_SIZE, frame.bottom + POINT_SIZE);
    }

    public void drawViewfinder() {
        Bitmap resultBitmap = this.resultBitmap;
        this.resultBitmap = null;
        if (resultBitmap != null) {
            resultBitmap.recycle();
        }
        invalidate();
    }

    public void drawResultBitmap(Bitmap result) {
        this.resultBitmap = result;
        invalidate();
    }

    public void addPossibleResultPoint(ResultPoint point) {
        List<ResultPoint> points = this.possibleResultPoints;
        points.add(point);
        int size = points.size();
        if (size > MAX_RESULT_POINTS) {
            points.subList(0, size - 10).clear();
        }
    }
}
