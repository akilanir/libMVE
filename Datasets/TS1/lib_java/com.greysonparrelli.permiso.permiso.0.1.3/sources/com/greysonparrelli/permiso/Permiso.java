package com.greysonparrelli.permiso;

import android.app.Activity;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import com.greysonparrelli.permiso.PermisoDialogFragment;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/Permiso.class */
public class Permiso {
    private static final String TAG = "Permiso";
    private WeakReference<Activity> mActivity;
    private static Permiso sInstance = new Permiso();
    private int mActiveRequestCode = 1;
    private Map<Integer, RequestData> mCodesToRequests = new HashMap();

    /* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/Permiso$IOnPermissionResult.class */
    public interface IOnPermissionResult {
        void onPermissionResult(ResultSet resultSet);

        void onRationaleRequested(IOnRationaleProvided iOnRationaleProvided, String... strArr);
    }

    /* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/Permiso$IOnRationaleProvided.class */
    public interface IOnRationaleProvided {
        void onRationaleProvided();
    }

    public static Permiso getInstance() {
        return sInstance;
    }

    private Permiso() {
    }

    public void setActivity(@NonNull Activity activity) {
        this.mActivity = new WeakReference<>(activity);
    }

    @MainThread
    public void requestPermissions(@NonNull IOnPermissionResult callback, String... permissions) {
        checkActivity();
        RequestData requestData = new RequestData(callback, permissions);
        for (String permission : permissions) {
            if (ContextCompat.checkSelfPermission(this.mActivity.get(), permission) == 0) {
                requestData.resultSet.grantPermissions(permission);
            }
        }
        if (requestData.resultSet.areAllPermissionsGranted()) {
            requestData.onResultListener.onPermissionResult(requestData.resultSet);
            return;
        }
        boolean linkedToExisting = linkToExistingRequestIfPossible(requestData);
        if (!linkedToExisting) {
            final int requestCode = markRequestAsActive(requestData);
            String[] permissionsThatNeedRationale = requestData.resultSet.getPermissionsThatNeedRationale(this.mActivity.get());
            if (permissionsThatNeedRationale.length > 0) {
                requestData.onResultListener.onRationaleRequested(new IOnRationaleProvided() { // from class: com.greysonparrelli.permiso.Permiso.1
                    @Override // com.greysonparrelli.permiso.Permiso.IOnRationaleProvided
                    public void onRationaleProvided() {
                        Permiso.this.makePermissionRequest(requestCode);
                    }
                }, permissionsThatNeedRationale);
            } else {
                makePermissionRequest(requestCode);
            }
        }
    }

    @MainThread
    public void onRequestPermissionResult(int requestCode, String[] permissions, int[] grantResults) {
        if (this.mCodesToRequests.containsKey(Integer.valueOf(requestCode))) {
            RequestData requestData = this.mCodesToRequests.get(Integer.valueOf(requestCode));
            requestData.resultSet.parsePermissionResults(permissions, grantResults);
            requestData.onResultListener.onPermissionResult(requestData.resultSet);
            this.mCodesToRequests.remove(Integer.valueOf(requestCode));
            return;
        }
        Log.w(TAG, "onRequestPermissionResult() was given an unrecognized request code.");
    }

    @MainThread
    public void showRationaleInDialog(@Nullable String title, @NonNull String message, @Nullable String buttonText, @NonNull final IOnRationaleProvided rationaleCallback) {
        checkActivity();
        PermisoDialogFragment dialogFragment = PermisoDialogFragment.newInstance(title, message, buttonText);
        dialogFragment.setOnCloseListener(new PermisoDialogFragment.IOnCloseListener() { // from class: com.greysonparrelli.permiso.Permiso.2
            @Override // com.greysonparrelli.permiso.PermisoDialogFragment.IOnCloseListener
            public void onClose() {
                rationaleCallback.onRationaleProvided();
            }
        });
        dialogFragment.show(this.mActivity.get().getFragmentManager(), PermisoDialogFragment.TAG);
    }

    private boolean linkToExistingRequestIfPossible(final RequestData newRequest) {
        boolean found = false;
        Iterator i$ = this.mCodesToRequests.values().iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            final RequestData activeRequest = i$.next();
            if (activeRequest.resultSet.containsAllUngrantedPermissions(newRequest.resultSet)) {
                final IOnPermissionResult originalOnResultListener = activeRequest.onResultListener;
                activeRequest.onResultListener = new IOnPermissionResult() { // from class: com.greysonparrelli.permiso.Permiso.3
                    @Override // com.greysonparrelli.permiso.Permiso.IOnPermissionResult
                    public void onPermissionResult(ResultSet resultSet) {
                        originalOnResultListener.onPermissionResult(resultSet);
                        String[] unsatisfied = newRequest.resultSet.getUngrantedPermissions();
                        for (String permission : unsatisfied) {
                            newRequest.resultSet.requestResults.put(permission, Boolean.valueOf(resultSet.isPermissionGranted(permission)));
                        }
                        newRequest.onResultListener.onPermissionResult(newRequest.resultSet);
                    }

                    @Override // com.greysonparrelli.permiso.Permiso.IOnPermissionResult
                    public void onRationaleRequested(IOnRationaleProvided callback, String... permissions) {
                        activeRequest.onResultListener.onRationaleRequested(callback, permissions);
                    }
                };
                found = true;
                break;
            }
        }
        return found;
    }

    private int markRequestAsActive(RequestData requestData) {
        int requestCode = this.mActiveRequestCode;
        this.mActiveRequestCode = requestCode + 1;
        this.mCodesToRequests.put(Integer.valueOf(requestCode), requestData);
        return requestCode;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void makePermissionRequest(int requestCode) {
        RequestData requestData = this.mCodesToRequests.get(Integer.valueOf(requestCode));
        ActivityCompat.requestPermissions(this.mActivity.get(), requestData.resultSet.getUngrantedPermissions(), requestCode);
    }

    private void checkActivity() {
        if (this.mActivity.get() == null) {
            throw new IllegalStateException("No activity set. Either subclass PermisoActivity or call Permiso.setActivity() in onCreate() and onResume() of your Activity.");
        }
    }

    /* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/Permiso$RequestData.class */
    private static class RequestData {
        IOnPermissionResult onResultListener;
        ResultSet resultSet;

        public RequestData(@NonNull IOnPermissionResult onResultListener, String... permissions) {
            this.onResultListener = onResultListener;
            this.resultSet = new ResultSet(permissions);
        }
    }

    /* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/Permiso$ResultSet.class */
    public static class ResultSet {
        private Map<String, Boolean> requestResults;

        private ResultSet(String... permissions) {
            this.requestResults = new HashMap(permissions.length);
            for (String permission : permissions) {
                this.requestResults.put(permission, false);
            }
        }

        public boolean isPermissionGranted(String permission) {
            if (this.requestResults.containsKey(permission)) {
                return this.requestResults.get(permission).booleanValue();
            }
            return false;
        }

        public boolean areAllPermissionsGranted() {
            return !this.requestResults.containsValue(false);
        }

        public Map<String, Boolean> toMap() {
            return new HashMap(this.requestResults);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void grantPermissions(String... permissions) {
            for (String permission : permissions) {
                this.requestResults.put(permission, true);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void parsePermissionResults(String[] permissions, int[] grantResults) {
            for (int i = 0; i < permissions.length; i++) {
                this.requestResults.put(permissions[i], Boolean.valueOf(grantResults[i] == 0));
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String[] getUngrantedPermissions() {
            List<String> ungrantedList = new ArrayList<>(this.requestResults.size());
            for (String permission : this.requestResults.keySet()) {
                if (!this.requestResults.get(permission).booleanValue()) {
                    ungrantedList.add(permission);
                }
            }
            return (String[]) ungrantedList.toArray(new String[ungrantedList.size()]);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean containsAllUngrantedPermissions(ResultSet set) {
            List<String> ungranted = Arrays.asList(set.getUngrantedPermissions());
            return this.requestResults.keySet().containsAll(ungranted);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String[] getPermissionsThatNeedRationale(Activity activity) {
            String[] ungranted = getUngrantedPermissions();
            List<String> shouldShowRationale = new ArrayList<>(ungranted.length);
            for (String permission : ungranted) {
                if (ActivityCompat.shouldShowRequestPermissionRationale(activity, permission)) {
                    shouldShowRationale.add(permission);
                }
            }
            return (String[]) shouldShowRationale.toArray(new String[shouldShowRationale.size()]);
        }
    }
}
