package com.greysonparrelli.permiso;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;

/* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/PermisoActivity.class */
public class PermisoActivity extends AppCompatActivity {
    /* JADX WARN: Multi-variable type inference failed */
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Permiso.getInstance().setActivity(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void onResume() {
        super.onResume();
        Permiso.getInstance().setActivity(this);
    }

    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        Permiso.getInstance().onRequestPermissionResult(requestCode, permissions, grantResults);
    }
}
