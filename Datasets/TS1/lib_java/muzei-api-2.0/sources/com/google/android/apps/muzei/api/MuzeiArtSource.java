package com.google.android.apps.muzei.api;

import android.app.AlarmManager;
import android.app.IntentService;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.apps.muzei.api.internal.ProtocolConstants;
import com.google.android.apps.muzei.api.internal.SourceState;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/MuzeiArtSource.class */
public abstract class MuzeiArtSource extends IntentService {
    private static final String TAG = "MuzeiArtSource";
    public static final String ACTION_MUZEI_ART_SOURCE = "com.google.android.apps.muzei.api.MuzeiArtSource";
    public static final String EXTRA_FROM_MUZEI_SETTINGS = "com.google.android.apps.muzei.api.extra.FROM_MUZEI_SETTINGS";
    private static final int FIRST_BUILTIN_COMMAND_ID = 1000;
    public static final int BUILTIN_COMMAND_ID_NEXT_ARTWORK = 1001;
    protected static final int MAX_CUSTOM_COMMAND_ID = 999;
    public static final int UPDATE_REASON_OTHER = 0;
    public static final int UPDATE_REASON_INITIAL = 1;
    public static final int UPDATE_REASON_USER_NEXT = 2;
    public static final int UPDATE_REASON_SCHEDULED = 3;
    private static final String PREF_STATE = "state";
    private static final String PREF_SUBSCRIPTIONS = "subscriptions";
    private static final String PREF_SCHEDULED_UPDATE_TIME_MILLIS = "scheduled_update_time_millis";
    private static final String URI_SCHEME_COMMAND = "muzeicommand";
    private static final int MSG_PUBLISH_CURRENT_STATE = 1;
    private SharedPreferences mSharedPrefs;
    private final String mName;
    private Map<ComponentName, String> mSubscriptions;
    private SourceState mCurrentState;
    private Handler mHandler;

    protected abstract void onUpdate(int i);

    public MuzeiArtSource(String name) {
        super(name);
        this.mHandler = new Handler() { // from class: com.google.android.apps.muzei.api.MuzeiArtSource.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                super.handleMessage(msg);
                if (msg.what == 1) {
                    MuzeiArtSource.this.publishCurrentState();
                    MuzeiArtSource.this.saveState();
                }
            }
        };
        this.mName = name;
    }

    @Override // android.app.IntentService, android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mSharedPrefs = getSharedPreferences();
        loadSubscriptions();
        loadState();
    }

    protected boolean onAllowSubscription(ComponentName subscriber) {
        return true;
    }

    protected void onSubscriberAdded(ComponentName subscriber) {
    }

    protected void onSubscriberRemoved(ComponentName subscriber) {
    }

    protected void onEnabled() {
    }

    protected void onDisabled() {
    }

    protected void onCustomCommand(int id) {
    }

    protected void onNetworkAvailable() {
    }

    protected final void publishArtwork(Artwork artwork) {
        this.mCurrentState.setCurrentArtwork(artwork);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void setDescription(String description) {
        this.mCurrentState.setDescription(description);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void setUserCommands(UserCommand... commands) {
        this.mCurrentState.setUserCommands(Arrays.asList(commands));
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void setUserCommands(List<UserCommand> commands) {
        this.mCurrentState.setUserCommands(commands);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void setUserCommands(int... commands) {
        this.mCurrentState.setUserCommands(commands);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void removeAllUserCommands() {
        this.mCurrentState.setUserCommands((int[]) null);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final void setWantsNetworkAvailable(boolean wantsNetworkAvailable) {
        this.mCurrentState.setWantsNetworkAvailable(wantsNetworkAvailable);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(1);
    }

    protected final Artwork getCurrentArtwork() {
        if (this.mCurrentState != null) {
            return this.mCurrentState.getCurrentArtwork();
        }
        return null;
    }

    protected final void scheduleUpdate(long scheduledUpdateTimeMillis) {
        getSharedPreferences().edit().putLong(PREF_SCHEDULED_UPDATE_TIME_MILLIS, scheduledUpdateTimeMillis).commit();
        setUpdateAlarm(scheduledUpdateTimeMillis);
    }

    protected final void unscheduleUpdate() {
        getSharedPreferences().edit().remove(PREF_SCHEDULED_UPDATE_TIME_MILLIS).apply();
        clearUpdateAlarm();
    }

    protected final synchronized boolean isEnabled() {
        return this.mSubscriptions.size() > 0;
    }

    protected static SharedPreferences getSharedPreferences(Context context, String sourceName) {
        return context.getSharedPreferences("muzeiartsource_" + sourceName, 0);
    }

    protected final SharedPreferences getSharedPreferences() {
        return getSharedPreferences(this, this.mName);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        if (intent == null) {
            return;
        }
        String action = intent.getAction();
        if (ProtocolConstants.ACTION_SUBSCRIBE.equals(action)) {
            processSubscribe((ComponentName) intent.getParcelableExtra(ProtocolConstants.EXTRA_SUBSCRIBER_COMPONENT), intent.getStringExtra(ProtocolConstants.EXTRA_TOKEN));
            return;
        }
        if (ProtocolConstants.ACTION_HANDLE_COMMAND.equals(action)) {
            int commandId = intent.getIntExtra(ProtocolConstants.EXTRA_COMMAND_ID, 0);
            processHandleCommand(commandId, intent.getExtras());
        } else if (ProtocolConstants.ACTION_NETWORK_AVAILABLE.equals(action)) {
            processNetworkAvailable();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void processSubscribe(ComponentName subscriber, String token) {
        if (subscriber == null) {
            Log.w(TAG, "No subscriber given.");
            return;
        }
        String oldToken = this.mSubscriptions.get(subscriber);
        if (TextUtils.isEmpty(token)) {
            if (oldToken == null) {
                return;
            }
            this.mSubscriptions.remove(subscriber);
            processAndDispatchSubscriberRemoved(subscriber);
        } else {
            if (!TextUtils.isEmpty(oldToken)) {
                this.mSubscriptions.remove(subscriber);
                processAndDispatchSubscriberRemoved(subscriber);
            }
            if (!onAllowSubscription(subscriber)) {
                return;
            }
            this.mSubscriptions.put(subscriber, token);
            processAndDispatchSubscriberAdded(subscriber);
        }
        saveSubscriptions();
    }

    private synchronized void processAndDispatchSubscriberAdded(ComponentName subscriber) {
        boolean updateDueToSchedule = false;
        if (this.mSubscriptions.size() == 1) {
            onEnabled();
            long updateTimeMillis = this.mSharedPrefs.getLong(PREF_SCHEDULED_UPDATE_TIME_MILLIS, 0L);
            if (updateTimeMillis > 0) {
                if (updateTimeMillis < System.currentTimeMillis()) {
                    updateDueToSchedule = true;
                    unscheduleUpdate();
                    onUpdate(3);
                } else {
                    setUpdateAlarm(updateTimeMillis);
                }
            }
        }
        onSubscriberAdded(subscriber);
        if (!updateDueToSchedule && this.mSubscriptions.size() == 1 && this.mCurrentState.getCurrentArtwork() == null) {
            onUpdate(1);
        }
        publishCurrentState(subscriber);
    }

    private synchronized void processAndDispatchSubscriberRemoved(ComponentName subscriber) {
        onSubscriberRemoved(subscriber);
        if (this.mSubscriptions.size() == 0) {
            clearUpdateAlarm();
            onDisabled();
        }
    }

    private void processHandleCommand(int commandId, Bundle extras) {
        Log.d(TAG, "Received handle command intent, command ID: " + commandId + ", id=" + this.mName);
        if (commandId == 1001) {
            int reason = extras.getBoolean(ProtocolConstants.EXTRA_SCHEDULED, false) ? 3 : 2;
            if (reason == 3) {
                unscheduleUpdate();
            }
            onUpdate(reason);
            return;
        }
        onCustomCommand(commandId);
    }

    private void processNetworkAvailable() {
        onNetworkAvailable();
    }

    private void setUpdateAlarm(long nextTimeMillis) {
        if (!isEnabled()) {
            Log.w(TAG, "Source has no subscribers, not actually scheduling next update, id=" + this.mName);
        } else {
            if (nextTimeMillis < System.currentTimeMillis()) {
                Log.w(TAG, "Refusing to schedule next artwork in the past, id=" + this.mName);
                return;
            }
            AlarmManager am = (AlarmManager) getSystemService("alarm");
            am.set(1, nextTimeMillis, getHandleNextCommandPendingIntent(this));
            Log.i(TAG, "Scheduling next artwork (source " + this.mName + ") at " + new Date(nextTimeMillis));
        }
    }

    private void clearUpdateAlarm() {
        AlarmManager am = (AlarmManager) getSystemService("alarm");
        am.cancel(getHandleNextCommandPendingIntent(this));
    }

    private PendingIntent getHandleNextCommandPendingIntent(Context context) {
        return PendingIntent.getService(context, 0, new Intent(ProtocolConstants.ACTION_HANDLE_COMMAND).setComponent(new ComponentName(context, getClass())).setData(Uri.fromParts(URI_SCHEME_COMMAND, Integer.toString(BUILTIN_COMMAND_ID_NEXT_ARTWORK), null)).putExtra(ProtocolConstants.EXTRA_COMMAND_ID, BUILTIN_COMMAND_ID_NEXT_ARTWORK).putExtra(ProtocolConstants.EXTRA_SCHEDULED, true), 134217728);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void publishCurrentState() {
        for (ComponentName subscription : this.mSubscriptions.keySet()) {
            publishCurrentState(subscription);
        }
    }

    private synchronized void publishCurrentState(final ComponentName subscriber) {
        String token = this.mSubscriptions.get(subscriber);
        if (TextUtils.isEmpty(token)) {
            Log.w(TAG, "Not active, canceling update, id=" + this.mName);
            return;
        }
        Intent intent = new Intent(ProtocolConstants.ACTION_PUBLISH_STATE).setComponent(subscriber).putExtra(ProtocolConstants.EXTRA_TOKEN, token).putExtra(ProtocolConstants.EXTRA_STATE, this.mCurrentState != null ? this.mCurrentState.toBundle() : null);
        try {
            ComponentName returnedSubscriber = startService(intent);
            if (returnedSubscriber == null) {
                Log.e(TAG, "Update wasn't published because subscriber no longer exists, id=" + this.mName);
                this.mHandler.post(new Runnable() { // from class: com.google.android.apps.muzei.api.MuzeiArtSource.2
                    @Override // java.lang.Runnable
                    public void run() {
                        MuzeiArtSource.this.processSubscribe(subscriber, null);
                    }
                });
            }
        } catch (SecurityException e) {
            Log.e(TAG, "Couldn't publish update, id=" + this.mName, e);
        }
    }

    private synchronized void loadSubscriptions() {
        this.mSubscriptions = new HashMap();
        Set<String> serializedSubscriptions = this.mSharedPrefs.getStringSet(PREF_SUBSCRIPTIONS, null);
        if (serializedSubscriptions != null) {
            for (String serializedSubscription : serializedSubscriptions) {
                String[] arr = serializedSubscription.split("\\|", 2);
                ComponentName subscriber = ComponentName.unflattenFromString(arr[0]);
                String token = arr[1];
                this.mSubscriptions.put(subscriber, token);
            }
        }
    }

    private synchronized void saveSubscriptions() {
        Set<String> serializedSubscriptions = new HashSet<>();
        for (ComponentName subscriber : this.mSubscriptions.keySet()) {
            serializedSubscriptions.add(subscriber.flattenToShortString() + "|" + this.mSubscriptions.get(subscriber));
        }
        this.mSharedPrefs.edit().putStringSet(PREF_SUBSCRIPTIONS, serializedSubscriptions).commit();
    }

    private void loadState() {
        String stateString = this.mSharedPrefs.getString(PREF_STATE, null);
        if (stateString != null) {
            try {
                this.mCurrentState = SourceState.fromJson((JSONObject) new JSONTokener(stateString).nextValue());
                return;
            } catch (JSONException e) {
                Log.e(TAG, "Couldn't deserialize current state, id=" + this.mName, e);
                return;
            }
        }
        this.mCurrentState = new SourceState();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void saveState() {
        try {
            this.mSharedPrefs.edit().putString(PREF_STATE, this.mCurrentState.toJson().toString()).commit();
        } catch (JSONException e) {
            Log.e(TAG, "Couldn't serialize current state, id=" + this.mName, e);
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }
}
