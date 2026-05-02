package com.devspark.appmsg;

import android.R;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import java.lang.ref.WeakReference;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.WeakHashMap;

/* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/MsgManager.class */
class MsgManager extends Handler implements Comparator<AppMsg> {
    private static final int MESSAGE_DISPLAY = 794631;
    private static final int MESSAGE_ADD_VIEW = -1040157475;
    private static final int MESSAGE_REMOVE = -1040155167;
    private static WeakHashMap<Activity, MsgManager> sManagers;
    private static ReleaseCallbacks sReleaseCallbacks;
    private final Queue<AppMsg> msgQueue = new PriorityQueue(1, this);
    private final Queue<AppMsg> stickyQueue = new LinkedList();

    /* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/MsgManager$ReleaseCallbacks.class */
    interface ReleaseCallbacks {
        void register(Application application);
    }

    private MsgManager() {
    }

    static synchronized MsgManager obtain(Activity activity) {
        if (sManagers == null) {
            sManagers = new WeakHashMap<>(1);
        }
        MsgManager manager = sManagers.get(activity);
        if (manager == null) {
            manager = new MsgManager();
            ensureReleaseOnDestroy(activity);
            sManagers.put(activity, manager);
        }
        return manager;
    }

    static void ensureReleaseOnDestroy(Activity activity) {
        if (Build.VERSION.SDK_INT < 14) {
            return;
        }
        if (sReleaseCallbacks == null) {
            sReleaseCallbacks = new ReleaseCallbacksIcs();
        }
        sReleaseCallbacks.register(activity.getApplication());
    }

    static synchronized void release(Activity activity) {
        MsgManager manager;
        if (sManagers != null && (manager = sManagers.remove(activity)) != null) {
            manager.clearAllMsg();
        }
    }

    static synchronized void clearAll() {
        if (sManagers != null) {
            Iterator<MsgManager> iterator = sManagers.values().iterator();
            while (iterator.hasNext()) {
                MsgManager manager = iterator.next();
                if (manager != null) {
                    manager.clearAllMsg();
                }
                iterator.remove();
            }
            sManagers.clear();
        }
    }

    void add(AppMsg appMsg) {
        this.msgQueue.add(appMsg);
        if (appMsg.mInAnimation == null) {
            appMsg.mInAnimation = AnimationUtils.loadAnimation(appMsg.getActivity(), R.anim.fade_in);
        }
        if (appMsg.mOutAnimation == null) {
            appMsg.mOutAnimation = AnimationUtils.loadAnimation(appMsg.getActivity(), R.anim.fade_out);
        }
        displayMsg();
    }

    void clearMsg(AppMsg appMsg) {
        if (this.msgQueue.contains(appMsg) || this.stickyQueue.contains(appMsg)) {
            removeMessages(MESSAGE_DISPLAY, appMsg);
            removeMessages(MESSAGE_ADD_VIEW, appMsg);
            removeMessages(MESSAGE_REMOVE, appMsg);
            this.msgQueue.remove(appMsg);
            this.stickyQueue.remove(appMsg);
            removeMsg(appMsg);
        }
    }

    void clearAllMsg() {
        removeMessages(MESSAGE_DISPLAY);
        removeMessages(MESSAGE_ADD_VIEW);
        removeMessages(MESSAGE_REMOVE);
        clearShowing();
        this.msgQueue.clear();
        this.stickyQueue.clear();
    }

    void clearShowing() {
        Collection<AppMsg> showing = new HashSet<>();
        obtainShowing(this.msgQueue, showing);
        obtainShowing(this.stickyQueue, showing);
        for (AppMsg msg : showing) {
            clearMsg(msg);
        }
    }

    static void obtainShowing(Collection<AppMsg> from, Collection<AppMsg> appendTo) {
        for (AppMsg msg : from) {
            if (msg.isShowing()) {
                appendTo.add(msg);
            }
        }
    }

    private void displayMsg() {
        if (this.msgQueue.isEmpty()) {
            return;
        }
        AppMsg appMsg = this.msgQueue.peek();
        if (!appMsg.isShowing()) {
            Message msg = obtainMessage(MESSAGE_ADD_VIEW);
            msg.obj = appMsg;
            sendMessage(msg);
        } else if (appMsg.getDuration() != -1) {
            sendMessageDelayed(obtainMessage(MESSAGE_DISPLAY), appMsg.getDuration() + appMsg.mInAnimation.getDuration() + appMsg.mOutAnimation.getDuration());
        }
    }

    private void removeMsg(AppMsg appMsg) {
        clearMsg(appMsg);
        View view = appMsg.getView();
        ViewGroup parent = (ViewGroup) view.getParent();
        if (parent != null) {
            appMsg.mOutAnimation.setAnimationListener(new OutAnimationListener(appMsg));
            view.clearAnimation();
            view.startAnimation(appMsg.mOutAnimation);
        }
        Message msg = obtainMessage(MESSAGE_DISPLAY);
        sendMessage(msg);
    }

    private void addMsgToView(AppMsg appMsg) {
        View view = appMsg.getView();
        if (view.getParent() == null) {
            ViewGroup targetParent = appMsg.getParent();
            ViewGroup.LayoutParams params = appMsg.getLayoutParams();
            if (targetParent != null) {
                targetParent.addView(view, params);
            } else {
                appMsg.getActivity().addContentView(view, params);
            }
        }
        view.clearAnimation();
        view.startAnimation(appMsg.mInAnimation);
        if (view.getVisibility() != 0) {
            view.setVisibility(0);
        }
        int duration = appMsg.getDuration();
        if (duration != -1) {
            Message msg = obtainMessage(MESSAGE_REMOVE);
            msg.obj = appMsg;
            sendMessageDelayed(msg, duration);
            return;
        }
        this.stickyQueue.add(this.msgQueue.poll());
    }

    @Override // android.os.Handler
    public void handleMessage(Message msg) {
        switch (msg.what) {
            case MESSAGE_ADD_VIEW /* -1040157475 */:
                AppMsg appMsg = (AppMsg) msg.obj;
                addMsgToView(appMsg);
                break;
            case MESSAGE_REMOVE /* -1040155167 */:
                AppMsg appMsg2 = (AppMsg) msg.obj;
                removeMsg(appMsg2);
                break;
            case MESSAGE_DISPLAY /* 794631 */:
                displayMsg();
                break;
            default:
                super.handleMessage(msg);
                break;
        }
    }

    @Override // java.util.Comparator
    public int compare(AppMsg lhs, AppMsg rhs) {
        return inverseCompareInt(lhs.mPriority, rhs.mPriority);
    }

    static int inverseCompareInt(int lhs, int rhs) {
        if (lhs < rhs) {
            return 1;
        }
        return lhs == rhs ? 0 : -1;
    }

    /* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/MsgManager$OutAnimationListener.class */
    private static class OutAnimationListener implements Animation.AnimationListener {
        private final AppMsg appMsg;

        private OutAnimationListener(AppMsg appMsg) {
            this.appMsg = appMsg;
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationStart(Animation animation) {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationEnd(Animation animation) {
            final View view = this.appMsg.getView();
            if (this.appMsg.isFloating()) {
                final ViewGroup parent = (ViewGroup) view.getParent();
                if (parent != null) {
                    parent.post(new Runnable() { // from class: com.devspark.appmsg.MsgManager.OutAnimationListener.1
                        @Override // java.lang.Runnable
                        public void run() {
                            parent.removeView(view);
                        }
                    });
                    return;
                }
                return;
            }
            view.setVisibility(8);
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationRepeat(Animation animation) {
        }
    }

    @TargetApi(14)
    /* loaded from: com.github.johnkil.android-appmsg.appmsg.1.2.0.jar:com/devspark/appmsg/MsgManager$ReleaseCallbacksIcs.class */
    static class ReleaseCallbacksIcs implements Application.ActivityLifecycleCallbacks, ReleaseCallbacks {
        private WeakReference<Application> mLastApp;

        ReleaseCallbacksIcs() {
        }

        @Override // com.devspark.appmsg.MsgManager.ReleaseCallbacks
        public void register(Application app) {
            if (this.mLastApp != null && this.mLastApp.get() == app) {
                return;
            }
            this.mLastApp = new WeakReference<>(app);
            app.registerActivityLifecycleCallbacks(this);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
            MsgManager.release(activity);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }
    }
}
