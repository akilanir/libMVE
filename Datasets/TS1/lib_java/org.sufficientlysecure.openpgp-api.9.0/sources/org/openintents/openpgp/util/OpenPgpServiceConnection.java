package org.openintents.openpgp.util;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import org.openintents.openpgp.IOpenPgpService2;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpServiceConnection.class */
public class OpenPgpServiceConnection {
    private Context mApplicationContext;
    private IOpenPgpService2 mService;
    private String mProviderPackageName;
    private OnBound mOnBoundListener;
    private ServiceConnection mServiceConnection;

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpServiceConnection$OnBound.class */
    public interface OnBound {
        void onBound(IOpenPgpService2 iOpenPgpService2);

        void onError(Exception exc);
    }

    public OpenPgpServiceConnection(Context context, String providerPackageName) {
        this.mServiceConnection = new ServiceConnection() { // from class: org.openintents.openpgp.util.OpenPgpServiceConnection.1
            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName name, IBinder service) {
                OpenPgpServiceConnection.this.mService = IOpenPgpService2.Stub.asInterface(service);
                if (OpenPgpServiceConnection.this.mOnBoundListener != null) {
                    OpenPgpServiceConnection.this.mOnBoundListener.onBound(OpenPgpServiceConnection.this.mService);
                }
            }

            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName name) {
                OpenPgpServiceConnection.this.mService = null;
            }
        };
        this.mApplicationContext = context.getApplicationContext();
        this.mProviderPackageName = providerPackageName;
    }

    public OpenPgpServiceConnection(Context context, String providerPackageName, OnBound onBoundListener) {
        this(context, providerPackageName);
        this.mOnBoundListener = onBoundListener;
    }

    public IOpenPgpService2 getService() {
        return this.mService;
    }

    public boolean isBound() {
        return this.mService != null;
    }

    public void bindToService() {
        if (this.mService == null) {
            try {
                Intent serviceIntent = new Intent(OpenPgpApi.SERVICE_INTENT_2);
                serviceIntent.setPackage(this.mProviderPackageName);
                boolean connect = this.mApplicationContext.bindService(serviceIntent, this.mServiceConnection, 1);
                if (!connect) {
                    throw new Exception("bindService() returned false!");
                }
                return;
            } catch (Exception e) {
                if (this.mOnBoundListener != null) {
                    this.mOnBoundListener.onError(e);
                    return;
                }
                return;
            }
        }
        if (this.mOnBoundListener != null) {
            this.mOnBoundListener.onBound(this.mService);
        }
    }

    public void unbindFromService() {
        this.mApplicationContext.unbindService(this.mServiceConnection);
    }
}
