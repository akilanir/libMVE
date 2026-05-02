package com.journeyapps.barcodescanner;

import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.ResultPoint;
import com.google.zxing.client.android.DecodeFormatManager;
import com.google.zxing.client.android.DecodeHintManager;
import com.google.zxing.client.android.Intents;
import com.google.zxing.client.android.R;
import com.journeyapps.barcodescanner.camera.CameraSettings;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/CompoundBarcodeView.class */
public class CompoundBarcodeView extends FrameLayout {
    private BarcodeView barcodeView;
    private ViewfinderView viewFinder;
    private TextView statusView;
    private TorchListener torchListener;

    /* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/CompoundBarcodeView$TorchListener.class */
    public interface TorchListener {
        void onTorchOn();

        void onTorchOff();
    }

    /* loaded from: com.journeyapps.zxing-android-embedded.3.0.2.jar:com/journeyapps/barcodescanner/CompoundBarcodeView$WrappedCallback.class */
    private class WrappedCallback implements BarcodeCallback {
        private BarcodeCallback delegate;

        public WrappedCallback(BarcodeCallback delegate) {
            this.delegate = delegate;
        }

        @Override // com.journeyapps.barcodescanner.BarcodeCallback
        public void barcodeResult(BarcodeResult result) {
            this.delegate.barcodeResult(result);
        }

        @Override // com.journeyapps.barcodescanner.BarcodeCallback
        public void possibleResultPoints(List<ResultPoint> resultPoints) {
            for (ResultPoint point : resultPoints) {
                CompoundBarcodeView.this.viewFinder.addPossibleResultPoint(point);
            }
            this.delegate.possibleResultPoints(resultPoints);
        }
    }

    public CompoundBarcodeView(Context context) {
        super(context);
        initialize();
    }

    public CompoundBarcodeView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initialize(attrs);
    }

    public CompoundBarcodeView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initialize(attrs);
    }

    private void initialize(AttributeSet attrs) {
        TypedArray attributes = getContext().obtainStyledAttributes(attrs, R.styleable.zxing_view);
        int scannerLayout = attributes.getResourceId(R.styleable.zxing_view_zxing_scanner_layout, R.layout.zxing_barcode_scanner);
        attributes.recycle();
        inflate(getContext(), scannerLayout, this);
        this.barcodeView = (BarcodeView) findViewById(R.id.zxing_barcode_surface);
        if (this.barcodeView == null) {
            throw new IllegalArgumentException("There is no a com.journeyapps.barcodescanner.BarcodeView on provided layout with the id \"zxing_barcode_surface\".");
        }
        this.viewFinder = (ViewfinderView) findViewById(R.id.zxing_viewfinder_view);
        if (this.viewFinder == null) {
            throw new IllegalArgumentException("There is no a com.journeyapps.barcodescanner.ViewfinderView on provided layout with the id \"zxing_viewfinder_view\".");
        }
        this.viewFinder.setCameraPreview(this.barcodeView);
        this.statusView = (TextView) findViewById(R.id.zxing_status_view);
    }

    private void initialize() {
        initialize(null);
    }

    public void initializeFromIntent(Intent intent) {
        int cameraId;
        Set<BarcodeFormat> decodeFormats = DecodeFormatManager.parseDecodeFormats(intent);
        Map<DecodeHintType, Object> decodeHints = DecodeHintManager.parseDecodeHints(intent);
        CameraSettings settings = new CameraSettings();
        if (intent.hasExtra(Intents.Scan.CAMERA_ID) && (cameraId = intent.getIntExtra(Intents.Scan.CAMERA_ID, -1)) >= 0) {
            settings.setRequestedCameraId(cameraId);
        }
        String customPromptMessage = intent.getStringExtra(Intents.Scan.PROMPT_MESSAGE);
        if (customPromptMessage != null) {
            setStatusText(customPromptMessage);
        }
        String characterSet = intent.getStringExtra(Intents.Scan.CHARACTER_SET);
        MultiFormatReader reader = new MultiFormatReader();
        reader.setHints(decodeHints);
        this.barcodeView.setCameraSettings(settings);
        this.barcodeView.setDecoderFactory(new DefaultDecoderFactory(decodeFormats, decodeHints, characterSet));
    }

    public void setStatusText(String text) {
        if (this.statusView != null) {
            this.statusView.setText(text);
        }
    }

    public void pause() {
        this.barcodeView.pause();
    }

    public void resume() {
        this.barcodeView.resume();
    }

    public BarcodeView getBarcodeView() {
        return (BarcodeView) findViewById(R.id.zxing_barcode_surface);
    }

    public ViewfinderView getViewFinder() {
        return this.viewFinder;
    }

    public TextView getStatusView() {
        return this.statusView;
    }

    public void decodeSingle(BarcodeCallback callback) {
        this.barcodeView.decodeSingle(new WrappedCallback(callback));
    }

    public void decodeContinuous(BarcodeCallback callback) {
        this.barcodeView.decodeContinuous(new WrappedCallback(callback));
    }

    public void setTorchOn() {
        this.barcodeView.setTorch(true);
        if (this.torchListener != null) {
            this.torchListener.onTorchOn();
        }
    }

    public void setTorchOff() {
        this.barcodeView.setTorch(false);
        if (this.torchListener != null) {
            this.torchListener.onTorchOff();
        }
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        switch (keyCode) {
            case 24:
                setTorchOn();
                break;
            case 25:
                setTorchOff();
                break;
            case 27:
            case 80:
                break;
        }
        return true;
    }

    public void setTorchListener(TorchListener listener) {
        this.torchListener = listener;
    }
}
