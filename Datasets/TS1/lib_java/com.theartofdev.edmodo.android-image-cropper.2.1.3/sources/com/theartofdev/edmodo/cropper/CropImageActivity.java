package com.theartofdev.edmodo.cropper;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import com.theartofdev.edmodo.cropper.CropImage;
import com.theartofdev.edmodo.cropper.CropImageView;
import java.io.File;
import java.io.IOException;

/* loaded from: com.theartofdev.edmodo.android-image-cropper.2.1.3.jar:com/theartofdev/edmodo/cropper/CropImageActivity.class */
public class CropImageActivity extends AppCompatActivity implements CropImageView.OnSetImageUriCompleteListener, CropImageView.OnSaveCroppedImageCompleteListener {
    private CropImageView mCropImageView;
    private CropImageOptions mOptions;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.crop_image_activity);
        this.mCropImageView = (CropImageView) findViewById(R.id.cropImageView);
        Intent intent = getIntent();
        Uri source = (Uri) intent.getParcelableExtra("CROP_IMAGE_EXTRA_SOURCE");
        this.mOptions = (CropImageOptions) intent.getParcelableExtra("CROP_IMAGE_EXTRA_OPTIONS");
        if (savedInstanceState == null) {
            this.mCropImageView.setImageUriAsync(source);
        }
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            String title = (this.mOptions.activityTitle == null || this.mOptions.activityTitle.isEmpty()) ? getResources().getString(R.string.crop_image_activity_title) : this.mOptions.activityTitle;
            actionBar.setTitle(title);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
    }

    protected void onStart() {
        super.onStart();
        this.mCropImageView.setOnSetImageUriCompleteListener(this);
        this.mCropImageView.setOnSaveCroppedImageCompleteListener(this);
    }

    protected void onStop() {
        super.onStop();
        this.mCropImageView.setOnSetImageUriCompleteListener(null);
        this.mCropImageView.setOnSaveCroppedImageCompleteListener(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.crop_image_menu, menu);
        if (!this.mOptions.allowRotation) {
            menu.removeItem(R.id.crop_image_menu_rotate);
        }
        Drawable cropIcon = null;
        try {
            cropIcon = ContextCompat.getDrawable(this, R.drawable.crop_image_menu_crop);
            if (cropIcon != null) {
                menu.findItem(R.id.crop_image_menu_crop).setIcon(cropIcon);
            }
        } catch (Exception e) {
        }
        if (this.mOptions.activityMenuIconColor != 0) {
            updateMenuItemIconColor(menu, R.id.crop_image_menu_rotate, this.mOptions.activityMenuIconColor);
            if (cropIcon != null) {
                updateMenuItemIconColor(menu, R.id.crop_image_menu_crop, this.mOptions.activityMenuIconColor);
                return true;
            }
            return true;
        }
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.crop_image_menu_crop) {
            cropImage();
            return true;
        }
        if (item.getItemId() == R.id.crop_image_menu_rotate) {
            rotateImage();
            return true;
        }
        if (item.getItemId() == 16908332) {
            setResultCancel();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public void onBackPressed() {
        super.onBackPressed();
        setResultCancel();
    }

    @Override // com.theartofdev.edmodo.cropper.CropImageView.OnSetImageUriCompleteListener
    public void onSetImageUriComplete(CropImageView view, Uri uri, Exception error) {
        if (error == null) {
            if (this.mOptions.initialCropWindowRectangle != null) {
                this.mCropImageView.setCropRect(this.mOptions.initialCropWindowRectangle);
            }
            if (this.mOptions.initialRotation > -1) {
                this.mCropImageView.setRotatedDegrees(this.mOptions.initialRotation);
                return;
            }
            return;
        }
        setResult(null, error);
    }

    @Override // com.theartofdev.edmodo.cropper.CropImageView.OnSaveCroppedImageCompleteListener
    public void onSaveCroppedImageComplete(CropImageView view, Uri uri, Exception error) {
        setResult(uri, error);
    }

    protected void cropImage() {
        if (this.mOptions.noOutputImage) {
            setResult(null, null);
        } else {
            Uri outputUri = getOutputUri();
            this.mCropImageView.saveCroppedImageAsync(outputUri, this.mOptions.outputCompressFormat, this.mOptions.outputCompressQuality, this.mOptions.outputRequestWidth, this.mOptions.outputRequestHeight);
        }
    }

    protected void rotateImage() {
        this.mCropImageView.rotateImage(90);
    }

    protected Uri getOutputUri() {
        Uri outputUri = this.mOptions.outputUri;
        if (outputUri.equals(Uri.EMPTY)) {
            try {
                String ext = this.mOptions.outputCompressFormat == Bitmap.CompressFormat.JPEG ? ".jpg" : this.mOptions.outputCompressFormat == Bitmap.CompressFormat.PNG ? ".png" : ".wepb";
                outputUri = Uri.fromFile(File.createTempFile("cropped", ext, getCacheDir()));
            } catch (IOException e) {
                throw new RuntimeException("Failed to create temp file for output image", e);
            }
        }
        return outputUri;
    }

    protected void setResult(Uri uri, Exception error) {
        int resultCode = error == null ? -1 : CropImage.CROP_IMAGE_ACTIVITY_RESULT_ERROR_CODE;
        setResult(resultCode, getResultIntent(uri, error));
        finish();
    }

    protected void setResultCancel() {
        setResult(0);
        finish();
    }

    protected Intent getResultIntent(Uri uri, Exception error) {
        CropImage.ActivityResult result = new CropImage.ActivityResult(uri, error, this.mCropImageView.getCropPoints(), this.mCropImageView.getCropRect(), this.mCropImageView.getRotatedDegrees());
        Intent intent = new Intent();
        intent.putExtra("CROP_IMAGE_EXTRA_RESULT", result);
        return intent;
    }

    private void updateMenuItemIconColor(Menu menu, int itemId, int color) {
        Drawable menuItemIcon;
        MenuItem menuItem = menu.findItem(itemId);
        if (menuItem != null && (menuItemIcon = menuItem.getIcon()) != null) {
            try {
                menuItemIcon.mutate();
                menuItemIcon.setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
                menuItem.setIcon(menuItemIcon);
            } catch (Exception e) {
            }
        }
    }
}
