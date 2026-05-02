package com.facebook.stetho.inspector.elements.android;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Predicate;
import com.facebook.stetho.common.ThreadBound;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.common.android.ViewUtil;
import com.facebook.stetho.inspector.elements.Descriptor;
import com.facebook.stetho.inspector.elements.DescriptorMap;
import com.facebook.stetho.inspector.elements.DocumentProvider;
import com.facebook.stetho.inspector.elements.DocumentProviderListener;
import com.facebook.stetho.inspector.elements.NodeDescriptor;
import com.facebook.stetho.inspector.elements.ObjectDescriptor;
import com.facebook.stetho.inspector.helper.ThreadBoundProxy;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/AndroidDocumentProvider.class */
final class AndroidDocumentProvider extends ThreadBoundProxy implements DocumentProvider, AndroidDescriptorHost {
    private static final int INSPECT_OVERLAY_COLOR = 1090519039;
    private static final int INSPECT_HOVER_COLOR = 1077952767;
    private final Application mApplication;
    private final DescriptorMap mDescriptorMap;
    private final AndroidDocumentRoot mDocumentRoot;
    private final ViewHighlighter mHighlighter;
    private final InspectModeHandler mInspectModeHandler;

    @Nullable
    private DocumentProviderListener mListener;
    private static final long REPORT_CHANGED_INTERVAL_MS = 1000;
    private boolean mIsReportChangesTimerPosted;
    private final Runnable mReportChangesTimer;

    public AndroidDocumentProvider(Application application, ThreadBound enforcer) {
        super(enforcer);
        this.mIsReportChangesTimerPosted = false;
        this.mReportChangesTimer = new Runnable() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.1
            @Override // java.lang.Runnable
            public void run() {
                AndroidDocumentProvider.this.mIsReportChangesTimerPosted = false;
                if (AndroidDocumentProvider.this.mListener != null) {
                    AndroidDocumentProvider.this.mListener.onPossiblyChanged();
                    AndroidDocumentProvider.this.mIsReportChangesTimerPosted = true;
                    AndroidDocumentProvider.this.postDelayed(this, AndroidDocumentProvider.REPORT_CHANGED_INTERVAL_MS);
                }
            }
        };
        this.mApplication = (Application) Util.throwIfNull(application);
        this.mDocumentRoot = new AndroidDocumentRoot(application);
        this.mDescriptorMap = new DescriptorMap().beginInit().register(Activity.class, new ActivityDescriptor()).register(AndroidDocumentRoot.class, this.mDocumentRoot).register(Application.class, new ApplicationDescriptor()).register(Dialog.class, new DialogDescriptor());
        DialogFragmentDescriptor.register(this.mDescriptorMap);
        FragmentDescriptor.register(this.mDescriptorMap).register(Object.class, new ObjectDescriptor()).register(TextView.class, new TextViewDescriptor()).register(View.class, new ViewDescriptor()).register(ViewGroup.class, new ViewGroupDescriptor()).register(Window.class, new WindowDescriptor()).setHost(this).endInit();
        this.mHighlighter = ViewHighlighter.newInstance();
        this.mInspectModeHandler = new InspectModeHandler();
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void dispose() {
        verifyThreadAccess();
        this.mHighlighter.clearHighlight();
        this.mInspectModeHandler.disable();
        removeCallbacks(this.mReportChangesTimer);
        this.mIsReportChangesTimerPosted = false;
        this.mListener = null;
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setListener(DocumentProviderListener listener) {
        verifyThreadAccess();
        this.mListener = listener;
        if (this.mListener == null && this.mIsReportChangesTimerPosted) {
            this.mIsReportChangesTimerPosted = false;
            removeCallbacks(this.mReportChangesTimer);
        } else if (this.mListener != null && !this.mIsReportChangesTimerPosted) {
            this.mIsReportChangesTimerPosted = true;
            postDelayed(this.mReportChangesTimer, REPORT_CHANGED_INTERVAL_MS);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public Object getRootElement() {
        verifyThreadAccess();
        return this.mDocumentRoot;
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public NodeDescriptor getNodeDescriptor(Object element) {
        verifyThreadAccess();
        return getDescriptor(element);
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void highlightElement(Object element, int color) {
        verifyThreadAccess();
        View highlightingView = getHighlightingView(element);
        if (highlightingView == null) {
            this.mHighlighter.clearHighlight();
        } else {
            this.mHighlighter.setHighlightedView(highlightingView, color);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void hideHighlight() {
        verifyThreadAccess();
        this.mHighlighter.clearHighlight();
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setInspectModeEnabled(boolean enabled) {
        verifyThreadAccess();
        if (enabled) {
            this.mInspectModeHandler.enable();
        } else {
            this.mInspectModeHandler.disable();
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setAttributesAsText(Object element, String text) {
        verifyThreadAccess();
        Descriptor descriptor = this.mDescriptorMap.get(element.getClass());
        if (descriptor != null) {
            descriptor.setAttributesAsText(element, text);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public Descriptor getDescriptor(Object element) {
        if (element == null) {
            return null;
        }
        return this.mDescriptorMap.get(element.getClass());
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public void onAttributeModified(Object element, String name, String value) {
        if (this.mListener != null) {
            this.mListener.onAttributeModified(element, name, value);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public void onAttributeRemoved(Object element, String name) {
        if (this.mListener != null) {
            this.mListener.onAttributeRemoved(element, name);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.AndroidDescriptorHost
    public View getHighlightingView(Object element) {
        if (element == null) {
            return null;
        }
        View highlightingView = null;
        ThreadBound lastDescriptor = null;
        for (Class<?> theClass = element.getClass(); highlightingView == null && theClass != null; theClass = theClass.getSuperclass()) {
            ThreadBound threadBound = this.mDescriptorMap.get(theClass);
            if (threadBound == null) {
                return null;
            }
            if (threadBound != lastDescriptor && (threadBound instanceof HighlightableDescriptor)) {
                highlightingView = ((HighlightableDescriptor) threadBound).getViewForHighlighting(element);
            }
            lastDescriptor = threadBound;
        }
        return highlightingView;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getWindows(final Accumulator<Window> accumulator) {
        Descriptor appDescriptor = getDescriptor(this.mApplication);
        if (appDescriptor != null) {
            Accumulator<Object> elementAccumulator = new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.2
                @Override // com.facebook.stetho.common.Accumulator
                public void store(Object element) {
                    if (element instanceof Window) {
                        accumulator.store((Window) element);
                        return;
                    }
                    Descriptor elementDescriptor = AndroidDocumentProvider.this.getDescriptor(element);
                    if (elementDescriptor != null) {
                        elementDescriptor.getChildren(element, this);
                    }
                }
            };
            appDescriptor.getChildren(this.mApplication, elementAccumulator);
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler.class */
    private final class InspectModeHandler {
        private final Predicate<View> mViewSelector;
        private List<View> mOverlays;

        private InspectModeHandler() {
            this.mViewSelector = new Predicate<View>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.InspectModeHandler.1
                @Override // com.facebook.stetho.common.Predicate
                public boolean apply(View view) {
                    return !(view instanceof DocumentHiddenView);
                }
            };
        }

        public void enable() {
            AndroidDocumentProvider.this.verifyThreadAccess();
            if (this.mOverlays != null) {
                disable();
            }
            this.mOverlays = new ArrayList();
            AndroidDocumentProvider.this.getWindows(new Accumulator<Window>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.InspectModeHandler.2
                @Override // com.facebook.stetho.common.Accumulator
                public void store(Window object) {
                    if (object.peekDecorView() instanceof ViewGroup) {
                        ViewGroup decorView = (ViewGroup) object.peekDecorView();
                        OverlayView overlayView = InspectModeHandler.this.new OverlayView(AndroidDocumentProvider.this.mApplication);
                        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams();
                        layoutParams.width = -1;
                        layoutParams.height = -1;
                        decorView.addView(overlayView, layoutParams);
                        decorView.bringChildToFront(overlayView);
                        InspectModeHandler.this.mOverlays.add(overlayView);
                    }
                }
            });
        }

        public void disable() {
            AndroidDocumentProvider.this.verifyThreadAccess();
            if (this.mOverlays == null) {
                return;
            }
            for (int i = 0; i < this.mOverlays.size(); i++) {
                View overlayView = this.mOverlays.get(i);
                ViewGroup decorViewGroup = (ViewGroup) overlayView.getParent();
                decorViewGroup.removeView(overlayView);
            }
            this.mOverlays = null;
        }

        /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$OverlayView.class */
        private final class OverlayView extends DocumentHiddenView {
            public OverlayView(Context context) {
                super(context);
            }

            @Override // android.view.View
            protected void onDraw(Canvas canvas) {
                canvas.drawColor(AndroidDocumentProvider.INSPECT_OVERLAY_COLOR);
                super.onDraw(canvas);
            }

            @Override // android.view.View
            public boolean onTouchEvent(MotionEvent event) {
                if (getParent() instanceof View) {
                    View parent = (View) getParent();
                    View view = ViewUtil.hitTest(parent, event.getX(), event.getY(), InspectModeHandler.this.mViewSelector);
                    if (event.getAction() != 3 && view != null) {
                        AndroidDocumentProvider.this.mHighlighter.setHighlightedView(view, AndroidDocumentProvider.INSPECT_HOVER_COLOR);
                        if (event.getAction() == 1 && AndroidDocumentProvider.this.mListener != null) {
                            AndroidDocumentProvider.this.mListener.onInspectRequested(view);
                            return true;
                        }
                        return true;
                    }
                    return true;
                }
                return true;
            }
        }
    }
}
