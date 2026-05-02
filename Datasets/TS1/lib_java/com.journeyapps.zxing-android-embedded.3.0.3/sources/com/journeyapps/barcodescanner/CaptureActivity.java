package com.journeyapps.barcodescanner;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import com.google.zxing.client.android.R;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/CaptureActivity.class */
public class CaptureActivity extends Activity {
    private CaptureManager capture;
    private CompoundBarcodeView barcodeScannerView;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.zxing_capture);
        this.barcodeScannerView = (CompoundBarcodeView) findViewById(R.id.zxing_barcode_scanner);
        this.capture = new CaptureManager(this, this.barcodeScannerView);
        this.capture.initializeFromIntent(getIntent(), savedInstanceState);
        this.capture.decode();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.capture.onResume();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        this.capture.onPause();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.capture.onDestroy();
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        this.capture.onSaveInstanceState(outState);
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return this.barcodeScannerView.onKeyDown(keyCode, event) || super.onKeyDown(keyCode, event);
    }
}
