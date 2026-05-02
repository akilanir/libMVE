package com.journeyapps.barcodescanner;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.ViewGroup;
import android.view.WindowManager;
import com.google.zxing.client.android.R;
import com.journeyapps.barcodescanner.camera.CameraInstance;
import com.journeyapps.barcodescanner.camera.CameraSettings;
import com.journeyapps.barcodescanner.camera.DisplayConfiguration;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/CameraPreview.class */
public class CameraPreview extends ViewGroup {
    private static final String TAG = CameraPreview.class.getSimpleName();
    private CameraInstance cameraInstance;
    private WindowManager windowManager;
    private Handler stateHandler;
    private SurfaceView surfaceView;
    private boolean previewActive;
    private RotationListener rotationListener;
    private List<StateListener> stateListeners;
    private DisplayConfiguration displayConfiguration;
    private CameraSettings cameraSettings;
    private Size containerSize;
    private Size previewSize;
    private Rect surfaceRect;
    private Size currentSurfaceSize;
    private Rect framingRect;
    private Rect previewFramingRect;
    private final SurfaceHolder.Callback surfaceCallback;
    private final Handler.Callback stateCallback;
    private RotationCallback rotationCallback;
    private final StateListener fireState;

    /* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/CameraPreview$StateListener.class */
    public interface StateListener {
        void previewSized();

        void previewStarted();

        void previewStopped();

        void cameraError(Exception exc);
    }

    public CameraPreview(Context context) {
        super(context);
        this.previewActive = false;
        this.stateListeners = new ArrayList();
        this.cameraSettings = new CameraSettings();
        this.framingRect = null;
        this.previewFramingRect = null;
        this.surfaceCallback = new SurfaceHolder.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.1
            @Override // android.view.SurfaceHolder.Callback
            public void surfaceCreated(SurfaceHolder holder) {
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceDestroyed(SurfaceHolder holder) {
                CameraPreview.this.currentSurfaceSize = null;
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                if (holder == null) {
                    Log.e(CameraPreview.TAG, "*** WARNING *** surfaceChanged() gave us a null surface!");
                    return;
                }
                CameraPreview.this.currentSurfaceSize = new Size(width, height);
                CameraPreview.this.startPreviewIfReady();
            }
        };
        this.stateCallback = new Handler.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.2
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message message) {
                if (message.what == R.id.zxing_prewiew_size_ready) {
                    CameraPreview.this.previewSized((Size) message.obj);
                    return true;
                }
                if (message.what == R.id.zxing_camera_error) {
                    Exception error = (Exception) message.obj;
                    if (CameraPreview.this.isActive()) {
                        CameraPreview.this.pause();
                        CameraPreview.this.fireState.cameraError(error);
                        return false;
                    }
                    return false;
                }
                return false;
            }
        };
        this.rotationCallback = new RotationCallback() { // from class: com.journeyapps.barcodescanner.CameraPreview.3
            @Override // com.journeyapps.barcodescanner.RotationCallback
            public void onRotationChanged(int rotation) {
                CameraPreview.this.stateHandler.post(new Runnable() { // from class: com.journeyapps.barcodescanner.CameraPreview.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CameraPreview.this.rotationChanged();
                    }
                });
            }
        };
        this.fireState = new StateListener() { // from class: com.journeyapps.barcodescanner.CameraPreview.4
            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewSized() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewSized();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStarted() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStarted();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStopped() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStopped();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void cameraError(Exception error) {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.cameraError(error);
                }
            }
        };
        initialize(context, null, 0, 0);
    }

    public CameraPreview(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.previewActive = false;
        this.stateListeners = new ArrayList();
        this.cameraSettings = new CameraSettings();
        this.framingRect = null;
        this.previewFramingRect = null;
        this.surfaceCallback = new SurfaceHolder.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.1
            @Override // android.view.SurfaceHolder.Callback
            public void surfaceCreated(SurfaceHolder holder) {
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceDestroyed(SurfaceHolder holder) {
                CameraPreview.this.currentSurfaceSize = null;
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                if (holder == null) {
                    Log.e(CameraPreview.TAG, "*** WARNING *** surfaceChanged() gave us a null surface!");
                    return;
                }
                CameraPreview.this.currentSurfaceSize = new Size(width, height);
                CameraPreview.this.startPreviewIfReady();
            }
        };
        this.stateCallback = new Handler.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.2
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message message) {
                if (message.what == R.id.zxing_prewiew_size_ready) {
                    CameraPreview.this.previewSized((Size) message.obj);
                    return true;
                }
                if (message.what == R.id.zxing_camera_error) {
                    Exception error = (Exception) message.obj;
                    if (CameraPreview.this.isActive()) {
                        CameraPreview.this.pause();
                        CameraPreview.this.fireState.cameraError(error);
                        return false;
                    }
                    return false;
                }
                return false;
            }
        };
        this.rotationCallback = new RotationCallback() { // from class: com.journeyapps.barcodescanner.CameraPreview.3
            @Override // com.journeyapps.barcodescanner.RotationCallback
            public void onRotationChanged(int rotation) {
                CameraPreview.this.stateHandler.post(new Runnable() { // from class: com.journeyapps.barcodescanner.CameraPreview.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CameraPreview.this.rotationChanged();
                    }
                });
            }
        };
        this.fireState = new StateListener() { // from class: com.journeyapps.barcodescanner.CameraPreview.4
            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewSized() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewSized();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStarted() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStarted();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStopped() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStopped();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void cameraError(Exception error) {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.cameraError(error);
                }
            }
        };
        initialize(context, attrs, 0, 0);
    }

    public CameraPreview(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.previewActive = false;
        this.stateListeners = new ArrayList();
        this.cameraSettings = new CameraSettings();
        this.framingRect = null;
        this.previewFramingRect = null;
        this.surfaceCallback = new SurfaceHolder.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.1
            @Override // android.view.SurfaceHolder.Callback
            public void surfaceCreated(SurfaceHolder holder) {
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceDestroyed(SurfaceHolder holder) {
                CameraPreview.this.currentSurfaceSize = null;
            }

            @Override // android.view.SurfaceHolder.Callback
            public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                if (holder == null) {
                    Log.e(CameraPreview.TAG, "*** WARNING *** surfaceChanged() gave us a null surface!");
                    return;
                }
                CameraPreview.this.currentSurfaceSize = new Size(width, height);
                CameraPreview.this.startPreviewIfReady();
            }
        };
        this.stateCallback = new Handler.Callback() { // from class: com.journeyapps.barcodescanner.CameraPreview.2
            @Override // android.os.Handler.Callback
            public boolean handleMessage(Message message) {
                if (message.what == R.id.zxing_prewiew_size_ready) {
                    CameraPreview.this.previewSized((Size) message.obj);
                    return true;
                }
                if (message.what == R.id.zxing_camera_error) {
                    Exception error = (Exception) message.obj;
                    if (CameraPreview.this.isActive()) {
                        CameraPreview.this.pause();
                        CameraPreview.this.fireState.cameraError(error);
                        return false;
                    }
                    return false;
                }
                return false;
            }
        };
        this.rotationCallback = new RotationCallback() { // from class: com.journeyapps.barcodescanner.CameraPreview.3
            @Override // com.journeyapps.barcodescanner.RotationCallback
            public void onRotationChanged(int rotation) {
                CameraPreview.this.stateHandler.post(new Runnable() { // from class: com.journeyapps.barcodescanner.CameraPreview.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CameraPreview.this.rotationChanged();
                    }
                });
            }
        };
        this.fireState = new StateListener() { // from class: com.journeyapps.barcodescanner.CameraPreview.4
            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewSized() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewSized();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStarted() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStarted();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void previewStopped() {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.previewStopped();
                }
            }

            @Override // com.journeyapps.barcodescanner.CameraPreview.StateListener
            public void cameraError(Exception error) {
                for (StateListener listener : CameraPreview.this.stateListeners) {
                    listener.cameraError(error);
                }
            }
        };
        initialize(context, attrs, defStyleAttr, 0);
    }

    private void initialize(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        if (getBackground() == null) {
            setBackgroundColor(-16777216);
        }
        this.windowManager = (WindowManager) context.getSystemService("window");
        this.stateHandler = new Handler(this.stateCallback);
        setupSurfaceView();
        this.rotationListener = new RotationListener();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void rotationChanged() {
        pause();
        resume();
    }

    private void setupSurfaceView() {
        this.surfaceView = new SurfaceView(getContext());
        if (Build.VERSION.SDK_INT < 11) {
            this.surfaceView.getHolder().setType(3);
        }
        this.surfaceView.getHolder().addCallback(this.surfaceCallback);
        addView(this.surfaceView);
    }

    public void addStateListener(StateListener listener) {
        this.stateListeners.add(listener);
    }

    private void calculateFrames() {
        if (this.containerSize == null || this.previewSize == null || this.displayConfiguration == null) {
            this.previewFramingRect = null;
            this.framingRect = null;
            this.surfaceRect = null;
            throw new IllegalStateException("containerSize or previewSize is not set yet");
        }
        int previewWidth = this.previewSize.width;
        int previewHeight = this.previewSize.height;
        int width = this.containerSize.width;
        int height = this.containerSize.height;
        this.surfaceRect = this.displayConfiguration.scalePreview(this.previewSize);
        Rect container = new Rect(0, 0, width, height);
        this.framingRect = calculateFramingRect(container, this.surfaceRect);
        Rect frameInPreview = new Rect(this.framingRect);
        frameInPreview.offset(-this.surfaceRect.left, -this.surfaceRect.top);
        this.previewFramingRect = new Rect((frameInPreview.left * previewWidth) / this.surfaceRect.width(), (frameInPreview.top * previewHeight) / this.surfaceRect.height(), (frameInPreview.right * previewWidth) / this.surfaceRect.width(), (frameInPreview.bottom * previewHeight) / this.surfaceRect.height());
        if (this.previewFramingRect.width() <= 0 || this.previewFramingRect.height() <= 0) {
            this.previewFramingRect = null;
            this.framingRect = null;
            Log.w(TAG, "Preview frame is too small");
            return;
        }
        this.fireState.previewSized();
    }

    public void setTorch(boolean on) {
        if (this.cameraInstance != null) {
            this.cameraInstance.setTorch(on);
        }
    }

    private void containerSized(Size containerSize) {
        this.containerSize = containerSize;
        if (this.cameraInstance != null && this.cameraInstance.getDisplayConfiguration() == null) {
            this.displayConfiguration = new DisplayConfiguration(getDisplayRotation(), containerSize);
            this.cameraInstance.setDisplayConfiguration(this.displayConfiguration);
            this.cameraInstance.configureCamera();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void previewSized(Size size) {
        this.previewSize = size;
        if (this.containerSize != null) {
            calculateFrames();
            requestLayout();
            startPreviewIfReady();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startPreviewIfReady() {
        if (this.currentSurfaceSize != null && this.previewSize != null && this.surfaceRect != null && this.currentSurfaceSize.equals(new Size(this.surfaceRect.width(), this.surfaceRect.height()))) {
            startCameraPreview(this.surfaceView.getHolder());
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    @SuppressLint({"DrawAllocation"})
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        containerSized(new Size(r - l, b - t));
        if (this.surfaceRect == null) {
            this.surfaceView.layout(0, 0, getWidth(), getHeight());
        } else {
            this.surfaceView.layout(this.surfaceRect.left, this.surfaceRect.top, this.surfaceRect.right, this.surfaceRect.bottom);
        }
    }

    public Rect getFramingRect() {
        return this.framingRect;
    }

    public Rect getPreviewFramingRect() {
        return this.previewFramingRect;
    }

    public CameraSettings getCameraSettings() {
        return this.cameraSettings;
    }

    public void setCameraSettings(CameraSettings cameraSettings) {
        this.cameraSettings = cameraSettings;
    }

    public void resume() {
        Util.validateMainThread();
        Log.d(TAG, "resume()");
        initCamera();
        if (this.currentSurfaceSize != null) {
            startPreviewIfReady();
        } else {
            this.surfaceView.getHolder().addCallback(this.surfaceCallback);
        }
        requestLayout();
        this.rotationListener.listen(getContext(), this.rotationCallback);
    }

    public void pause() {
        Util.validateMainThread();
        Log.d(TAG, "pause()");
        if (this.cameraInstance != null) {
            this.cameraInstance.close();
            this.cameraInstance = null;
            this.previewActive = false;
        }
        if (this.currentSurfaceSize == null) {
            SurfaceHolder surfaceHolder = this.surfaceView.getHolder();
            surfaceHolder.removeCallback(this.surfaceCallback);
        }
        this.containerSize = null;
        this.previewSize = null;
        this.previewFramingRect = null;
        this.rotationListener.stop();
        this.fireState.previewStopped();
    }

    protected boolean isActive() {
        return this.cameraInstance != null;
    }

    private int getDisplayRotation() {
        return this.windowManager.getDefaultDisplay().getRotation();
    }

    private void initCamera() {
        if (this.cameraInstance != null) {
            Log.w(TAG, "initCamera called twice");
            return;
        }
        this.cameraInstance = new CameraInstance(getContext());
        this.cameraInstance.setCameraSettings(this.cameraSettings);
        this.cameraInstance.setReadyHandler(this.stateHandler);
        this.cameraInstance.open();
    }

    private void startCameraPreview(SurfaceHolder holder) {
        if (!this.previewActive) {
            Log.i(TAG, "Starting preview");
            this.cameraInstance.setSurfaceHolder(holder);
            this.cameraInstance.startPreview();
            this.previewActive = true;
            previewStarted();
            this.fireState.previewStarted();
        }
    }

    protected void previewStarted() {
    }

    public CameraInstance getCameraInstance() {
        return this.cameraInstance;
    }

    public boolean isPreviewActive() {
        return this.previewActive;
    }

    protected Rect calculateFramingRect(Rect container, Rect surface) {
        Rect intersection = new Rect(container);
        intersection.intersect(surface);
        int margin = Math.min(intersection.width() / 10, intersection.height() / 10);
        intersection.inset(margin, margin);
        if (intersection.height() > intersection.width()) {
            intersection.inset(0, (intersection.height() - intersection.width()) / 2);
        }
        return intersection;
    }
}
