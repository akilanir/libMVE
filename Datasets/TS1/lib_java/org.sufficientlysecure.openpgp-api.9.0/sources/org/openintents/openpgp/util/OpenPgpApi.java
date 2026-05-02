package org.openintents.openpgp.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.atomic.AtomicInteger;
import org.openintents.openpgp.IOpenPgpService2;
import org.openintents.openpgp.OpenPgpError;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpApi.class */
public class OpenPgpApi {
    public static final String TAG = "OpenPgp API";
    public static final String SERVICE_INTENT_2 = "org.openintents.openpgp.IOpenPgpService2";
    public static final int API_VERSION = 9;
    public static final String ACTION_SIGN = "org.openintents.openpgp.action.SIGN";
    public static final String ACTION_CLEARTEXT_SIGN = "org.openintents.openpgp.action.CLEARTEXT_SIGN";
    public static final String ACTION_DETACHED_SIGN = "org.openintents.openpgp.action.DETACHED_SIGN";
    public static final String ACTION_ENCRYPT = "org.openintents.openpgp.action.ENCRYPT";
    public static final String ACTION_SIGN_AND_ENCRYPT = "org.openintents.openpgp.action.SIGN_AND_ENCRYPT";
    public static final String ACTION_DECRYPT_VERIFY = "org.openintents.openpgp.action.DECRYPT_VERIFY";
    public static final String ACTION_DECRYPT_METADATA = "org.openintents.openpgp.action.DECRYPT_METADATA";
    public static final String ACTION_GET_SIGN_KEY_ID = "org.openintents.openpgp.action.GET_SIGN_KEY_ID";
    public static final String ACTION_GET_KEY_IDS = "org.openintents.openpgp.action.GET_KEY_IDS";
    public static final String ACTION_GET_KEY = "org.openintents.openpgp.action.GET_KEY";
    public static final String EXTRA_API_VERSION = "api_version";
    public static final String EXTRA_ACCOUNT_NAME = "account_name";
    public static final String EXTRA_REQUEST_ASCII_ARMOR = "ascii_armor";
    public static final String RESULT_DETACHED_SIGNATURE = "detached_signature";
    public static final String EXTRA_USER_IDS = "user_ids";
    public static final String EXTRA_KEY_IDS = "key_ids";
    public static final String EXTRA_SIGN_KEY_ID = "sign_key_id";
    public static final String EXTRA_PASSPHRASE = "passphrase";
    public static final String EXTRA_ORIGINAL_FILENAME = "original_filename";
    public static final String EXTRA_ENABLE_COMPRESSION = "enable_compression";
    public static final String EXTRA_USER_ID = "user_id";
    public static final String EXTRA_KEY_ID = "key_id";
    public static final String RESULT_KEY_IDS = "key_ids";
    public static final String RESULT_CODE = "result_code";
    public static final int RESULT_CODE_ERROR = 0;
    public static final int RESULT_CODE_SUCCESS = 1;
    public static final int RESULT_CODE_USER_INTERACTION_REQUIRED = 2;
    public static final String RESULT_ERROR = "error";
    public static final String RESULT_INTENT = "intent";
    public static final String EXTRA_DETACHED_SIGNATURE = "detached_signature";
    public static final String RESULT_SIGNATURE = "signature";
    public static final String RESULT_DECRYPTION = "decryption";
    public static final String RESULT_METADATA = "metadata";
    public static final String RESULT_CHARSET = "charset";
    public static final String EXTRA_CALL_UUID1 = "call_uuid1";
    public static final String EXTRA_CALL_UUID2 = "call_uuid2";
    IOpenPgpService2 mService;
    Context mContext;
    final AtomicInteger mPipeIdGen = new AtomicInteger();

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpApi$IOpenPgpCallback.class */
    public interface IOpenPgpCallback {
        void onReturn(Intent intent);
    }

    public OpenPgpApi(Context context, IOpenPgpService2 service) {
        this.mContext = context;
        this.mService = service;
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpApi$OpenPgpAsyncTask.class */
    private class OpenPgpAsyncTask extends AsyncTask<Void, Integer, Intent> {
        Intent data;
        InputStream is;
        OutputStream os;
        IOpenPgpCallback callback;

        private OpenPgpAsyncTask(Intent data, InputStream is, OutputStream os, IOpenPgpCallback callback) {
            this.data = data;
            this.is = is;
            this.os = os;
            this.callback = callback;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Intent doInBackground(Void... unused) {
            return OpenPgpApi.this.executeApi(this.data, this.is, this.os);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Intent result) {
            this.callback.onReturn(result);
        }
    }

    @TargetApi(11)
    public void executeApiAsync(Intent data, InputStream is, OutputStream os, IOpenPgpCallback callback) {
        OpenPgpAsyncTask task = new OpenPgpAsyncTask(data, is, os, callback);
        if (Build.VERSION.SDK_INT >= 11) {
            task.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, (Void[]) null);
        } else {
            task.execute((Void[]) null);
        }
    }

    /* JADX WARN: Finally extract failed */
    public Intent executeApi(Intent data, InputStream is, OutputStream os) {
        ParcelFileDescriptor input = null;
        ParcelFileDescriptor output = null;
        try {
            try {
                data.putExtra(EXTRA_API_VERSION, 9);
                if (is != null) {
                    input = ParcelFileDescriptorUtil.pipeFrom(is);
                }
                Thread pumpThread = null;
                int outputPipeId = 0;
                if (os != null) {
                    outputPipeId = this.mPipeIdGen.incrementAndGet();
                    output = this.mService.createOutputPipe(outputPipeId);
                    pumpThread = ParcelFileDescriptorUtil.pipeTo(os, output);
                }
                Intent result = this.mService.execute(data, input, outputPipeId);
                result.setExtrasClassLoader(this.mContext.getClassLoader());
                if (pumpThread != null) {
                    pumpThread.join();
                }
                if (output != null) {
                    try {
                        output.close();
                    } catch (IOException e) {
                        Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e);
                    }
                }
                if (input != null) {
                    try {
                        input.close();
                    } catch (IOException e2) {
                        Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e2);
                    }
                }
                return result;
            } catch (Exception e3) {
                Log.e(TAG, "Exception in executeApi call", e3);
                Intent result2 = new Intent();
                result2.putExtra(RESULT_CODE, 0);
                result2.putExtra(RESULT_ERROR, new OpenPgpError(-1, e3.getMessage()));
                if (output != null) {
                    try {
                        output.close();
                    } catch (IOException e4) {
                        Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e4);
                    }
                }
                if (input != null) {
                    try {
                        input.close();
                    } catch (IOException e5) {
                        Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e5);
                    }
                }
                return result2;
            }
        } catch (Throwable th) {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e6) {
                    Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e6);
                }
            }
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e7) {
                    Log.e(TAG, "IOException when closing ParcelFileDescriptor!", e7);
                }
            }
            throw th;
        }
    }
}
