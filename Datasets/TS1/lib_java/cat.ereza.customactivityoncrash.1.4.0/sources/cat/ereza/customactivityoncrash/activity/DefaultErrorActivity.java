package cat.ereza.customactivityoncrash.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import cat.ereza.customactivityoncrash.CustomActivityOnCrash;
import cat.ereza.customactivityoncrash.R;

/* loaded from: cat.ereza.customactivityoncrash.1.4.0.jar:cat/ereza/customactivityoncrash/activity/DefaultErrorActivity.class */
public final class DefaultErrorActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.customactivityoncrash_default_error_activity);
        Button restartButton = (Button) findViewById(R.id.customactivityoncrash_error_activity_restart_button);
        final Class<? extends Activity> restartActivityClass = CustomActivityOnCrash.getRestartActivityClassFromIntent(getIntent());
        if (restartActivityClass != null) {
            restartButton.setText(R.string.customactivityoncrash_error_activity_restart_app);
            restartButton.setOnClickListener(new View.OnClickListener() { // from class: cat.ereza.customactivityoncrash.activity.DefaultErrorActivity.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    Intent intent = new Intent(DefaultErrorActivity.this, (Class<?>) restartActivityClass);
                    CustomActivityOnCrash.restartApplicationWithIntent(DefaultErrorActivity.this, intent);
                }
            });
        } else {
            restartButton.setOnClickListener(new View.OnClickListener() { // from class: cat.ereza.customactivityoncrash.activity.DefaultErrorActivity.2
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    CustomActivityOnCrash.closeApplication(DefaultErrorActivity.this);
                }
            });
        }
        Button moreInfoButton = (Button) findViewById(R.id.customactivityoncrash_error_activity_more_info_button);
        if (CustomActivityOnCrash.isShowErrorDetailsFromIntent(getIntent())) {
            moreInfoButton.setOnClickListener(new View.OnClickListener() { // from class: cat.ereza.customactivityoncrash.activity.DefaultErrorActivity.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    AlertDialog dialog = new AlertDialog.Builder(DefaultErrorActivity.this).setTitle(R.string.customactivityoncrash_error_activity_error_details_title).setMessage(CustomActivityOnCrash.getAllErrorDetailsFromIntent(DefaultErrorActivity.this, DefaultErrorActivity.this.getIntent())).setPositiveButton(R.string.customactivityoncrash_error_activity_error_details_close, (DialogInterface.OnClickListener) null).setNeutralButton(R.string.customactivityoncrash_error_activity_error_details_copy, new DialogInterface.OnClickListener() { // from class: cat.ereza.customactivityoncrash.activity.DefaultErrorActivity.3.1
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog2, int which) {
                            DefaultErrorActivity.this.copyErrorToClipboard();
                            Toast.makeText(DefaultErrorActivity.this, R.string.customactivityoncrash_error_activity_error_details_copied, 0).show();
                        }
                    }).show();
                    TextView textView = (TextView) dialog.findViewById(android.R.id.message);
                    textView.setTextSize(0, DefaultErrorActivity.this.getResources().getDimension(R.dimen.customactivityoncrash_error_activity_error_details_text_size));
                }
            });
        } else {
            moreInfoButton.setVisibility(8);
        }
        int defaultErrorActivityDrawableId = CustomActivityOnCrash.getDefaultErrorActivityDrawableIdFromIntent(getIntent());
        ImageView errorImageView = (ImageView) findViewById(R.id.customactivityoncrash_error_activity_image);
        if (Build.VERSION.SDK_INT >= 21) {
            errorImageView.setImageDrawable(getResources().getDrawable(defaultErrorActivityDrawableId, getTheme()));
        } else {
            errorImageView.setImageDrawable(getResources().getDrawable(defaultErrorActivityDrawableId));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copyErrorToClipboard() {
        String errorInformation = CustomActivityOnCrash.getAllErrorDetailsFromIntent(this, getIntent());
        if (Build.VERSION.SDK_INT >= 11) {
            ClipboardManager clipboard = (ClipboardManager) getSystemService("clipboard");
            ClipData clip = ClipData.newPlainText(getString(R.string.customactivityoncrash_error_activity_error_details_clipboard_label), errorInformation);
            clipboard.setPrimaryClip(clip);
        } else {
            android.text.ClipboardManager clipboard2 = (android.text.ClipboardManager) getSystemService("clipboard");
            clipboard2.setText(errorInformation);
        }
    }
}
