package android.support.v7.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.annotation.XmlRes;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewCompat;
import android.support.v7.preference.DialogPreference;
import android.support.v7.preference.PreferenceManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.android.support.preference-v7.23.2.1.jar:android/support/v7/preference/PreferenceFragmentCompat.class */
public abstract class PreferenceFragmentCompat extends Fragment implements PreferenceManager.OnPreferenceTreeClickListener, PreferenceManager.OnDisplayPreferenceDialogListener, PreferenceManager.OnNavigateToScreenListener, DialogPreference.TargetFragment {
    public static final String ARG_PREFERENCE_ROOT = "android.support.v7.preference.PreferenceFragmentCompat.PREFERENCE_ROOT";
    private static final String PREFERENCES_TAG = "android:preferences";
    private static final String DIALOG_FRAGMENT_TAG = "android.support.v7.preference.PreferenceFragment.DIALOG";
    private PreferenceManager mPreferenceManager;
    private RecyclerView mList;
    private boolean mHavePrefs;
    private boolean mInitDone;
    private Context mStyledContext;
    private static final int MSG_BIND_PREFERENCES = 1;
    private int mLayoutResId = R.layout.preference_list_fragment;
    private final DividerDecoration mDividerDecoration = new DividerDecoration();
    private Handler mHandler = new Handler() { // from class: android.support.v7.preference.PreferenceFragmentCompat.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    PreferenceFragmentCompat.this.bindPreferences();
                    break;
            }
        }
    };
    private final Runnable mRequestFocus = new Runnable() { // from class: android.support.v7.preference.PreferenceFragmentCompat.2
        @Override // java.lang.Runnable
        public void run() {
            PreferenceFragmentCompat.this.mList.focusableViewAvailable(PreferenceFragmentCompat.this.mList);
        }
    };

    /* loaded from: com.android.support.preference-v7.23.2.1.jar:android/support/v7/preference/PreferenceFragmentCompat$OnPreferenceDisplayDialogCallback.class */
    public interface OnPreferenceDisplayDialogCallback {
        boolean onPreferenceDisplayDialog(PreferenceFragmentCompat preferenceFragmentCompat, Preference preference);
    }

    /* loaded from: com.android.support.preference-v7.23.2.1.jar:android/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartFragmentCallback.class */
    public interface OnPreferenceStartFragmentCallback {
        boolean onPreferenceStartFragment(PreferenceFragmentCompat preferenceFragmentCompat, Preference preference);
    }

    /* loaded from: com.android.support.preference-v7.23.2.1.jar:android/support/v7/preference/PreferenceFragmentCompat$OnPreferenceStartScreenCallback.class */
    public interface OnPreferenceStartScreenCallback {
        boolean onPreferenceStartScreen(PreferenceFragmentCompat preferenceFragmentCompat, PreferenceScreen preferenceScreen);
    }

    public abstract void onCreatePreferences(Bundle bundle, String str);

    public void onCreate(Bundle savedInstanceState) {
        String rootKey;
        super.onCreate(savedInstanceState);
        TypedValue tv = new TypedValue();
        getActivity().getTheme().resolveAttribute(R.attr.preferenceTheme, tv, true);
        int theme = tv.resourceId;
        if (theme <= 0) {
            throw new IllegalStateException("Must specify preferenceTheme in theme");
        }
        this.mStyledContext = new ContextThemeWrapper((Context) getActivity(), theme);
        this.mPreferenceManager = new PreferenceManager(this.mStyledContext);
        this.mPreferenceManager.setOnNavigateToScreenListener(this);
        Bundle args = getArguments();
        if (args != null) {
            rootKey = getArguments().getString(ARG_PREFERENCE_ROOT);
        } else {
            rootKey = null;
        }
        onCreatePreferences(savedInstanceState, rootKey);
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        TypedArray a = this.mStyledContext.obtainStyledAttributes(null, R.styleable.PreferenceFragmentCompat, R.attr.preferenceFragmentCompatStyle, 0);
        this.mLayoutResId = a.getResourceId(R.styleable.PreferenceFragmentCompat_android_layout, this.mLayoutResId);
        Drawable divider = a.getDrawable(R.styleable.PreferenceFragmentCompat_android_divider);
        int dividerHeight = a.getInt(R.styleable.PreferenceFragmentCompat_android_dividerHeight, -1);
        a.recycle();
        TypedValue tv = new TypedValue();
        getActivity().getTheme().resolveAttribute(R.attr.preferenceTheme, tv, true);
        int theme = tv.resourceId;
        Context themedContext = new ContextThemeWrapper(inflater.getContext(), theme);
        LayoutInflater themedInflater = inflater.cloneInContext(themedContext);
        View view = themedInflater.inflate(this.mLayoutResId, container, false);
        View rawListContainer = view.findViewById(R.id.list_container);
        if (!(rawListContainer instanceof ViewGroup)) {
            throw new RuntimeException("Content has view with id attribute 'R.id.list_container' that is not a ViewGroup class");
        }
        ViewGroup listContainer = (ViewGroup) rawListContainer;
        RecyclerView listView = onCreateRecyclerView(themedInflater, listContainer, savedInstanceState);
        if (listView == null) {
            throw new RuntimeException("Could not create RecyclerView");
        }
        this.mList = listView;
        listView.addItemDecoration(this.mDividerDecoration);
        setDivider(divider);
        if (dividerHeight != -1) {
            setDividerHeight(dividerHeight);
        }
        listContainer.addView(this.mList);
        this.mHandler.post(this.mRequestFocus);
        return view;
    }

    public void setDivider(Drawable divider) {
        this.mDividerDecoration.setDivider(divider);
    }

    public void setDividerHeight(int height) {
        this.mDividerDecoration.setDividerHeight(height);
    }

    public void onActivityCreated(Bundle savedInstanceState) {
        Bundle container;
        PreferenceScreen preferenceScreen;
        super.onActivityCreated(savedInstanceState);
        if (this.mHavePrefs) {
            bindPreferences();
        }
        this.mInitDone = true;
        if (savedInstanceState != null && (container = savedInstanceState.getBundle(PREFERENCES_TAG)) != null && (preferenceScreen = getPreferenceScreen()) != null) {
            preferenceScreen.restoreHierarchyState(container);
        }
    }

    public void onStart() {
        super.onStart();
        this.mPreferenceManager.setOnPreferenceTreeClickListener(this);
        this.mPreferenceManager.setOnDisplayPreferenceDialogListener(this);
    }

    public void onStop() {
        super.onStop();
        this.mPreferenceManager.setOnPreferenceTreeClickListener(null);
        this.mPreferenceManager.setOnDisplayPreferenceDialogListener(null);
    }

    public void onDestroyView() {
        this.mList = null;
        this.mHandler.removeCallbacks(this.mRequestFocus);
        this.mHandler.removeMessages(1);
        super.onDestroyView();
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        if (preferenceScreen != null) {
            Bundle container = new Bundle();
            preferenceScreen.saveHierarchyState(container);
            outState.putBundle(PREFERENCES_TAG, container);
        }
    }

    public PreferenceManager getPreferenceManager() {
        return this.mPreferenceManager;
    }

    public void setPreferenceScreen(PreferenceScreen preferenceScreen) {
        if (this.mPreferenceManager.setPreferences(preferenceScreen) && preferenceScreen != null) {
            onUnbindPreferences();
            this.mHavePrefs = true;
            if (this.mInitDone) {
                postBindPreferences();
            }
        }
    }

    public PreferenceScreen getPreferenceScreen() {
        return this.mPreferenceManager.getPreferenceScreen();
    }

    public void addPreferencesFromResource(@XmlRes int preferencesResId) {
        requirePreferenceManager();
        setPreferenceScreen(this.mPreferenceManager.inflateFromResource(this.mStyledContext, preferencesResId, getPreferenceScreen()));
    }

    public void setPreferencesFromResource(@XmlRes int preferencesResId, @Nullable String key) {
        Preference root;
        requirePreferenceManager();
        PreferenceScreen xmlRoot = this.mPreferenceManager.inflateFromResource(this.mStyledContext, preferencesResId, null);
        if (key != null) {
            root = xmlRoot.findPreference(key);
            if (!(root instanceof PreferenceScreen)) {
                throw new IllegalArgumentException("Preference object with key " + key + " is not a PreferenceScreen");
            }
        } else {
            root = xmlRoot;
        }
        setPreferenceScreen((PreferenceScreen) root);
    }

    @Override // android.support.v7.preference.PreferenceManager.OnPreferenceTreeClickListener
    public boolean onPreferenceTreeClick(Preference preference) {
        if (preference.getFragment() != null) {
            boolean handled = false;
            if (getCallbackFragment() instanceof OnPreferenceStartFragmentCallback) {
                handled = getCallbackFragment().onPreferenceStartFragment(this, preference);
            }
            if (!handled && (getActivity() instanceof OnPreferenceStartFragmentCallback)) {
                handled = getActivity().onPreferenceStartFragment(this, preference);
            }
            return handled;
        }
        return false;
    }

    @Override // android.support.v7.preference.PreferenceManager.OnNavigateToScreenListener
    public void onNavigateToScreen(PreferenceScreen preferenceScreen) {
        boolean handled = false;
        if (getCallbackFragment() instanceof OnPreferenceStartScreenCallback) {
            handled = getCallbackFragment().onPreferenceStartScreen(this, preferenceScreen);
        }
        if (!handled && (getActivity() instanceof OnPreferenceStartScreenCallback)) {
            getActivity().onPreferenceStartScreen(this, preferenceScreen);
        }
    }

    @Override // android.support.v7.preference.DialogPreference.TargetFragment
    public Preference findPreference(CharSequence key) {
        if (this.mPreferenceManager == null) {
            return null;
        }
        return this.mPreferenceManager.findPreference(key);
    }

    private void requirePreferenceManager() {
        if (this.mPreferenceManager == null) {
            throw new RuntimeException("This should be called after super.onCreate.");
        }
    }

    private void postBindPreferences() {
        if (this.mHandler.hasMessages(1)) {
            return;
        }
        this.mHandler.obtainMessage(1).sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bindPreferences() {
        PreferenceScreen preferenceScreen = getPreferenceScreen();
        if (preferenceScreen != null) {
            getListView().setAdapter(onCreateAdapter(preferenceScreen));
            preferenceScreen.onAttached();
        }
        onBindPreferences();
    }

    protected void onBindPreferences() {
    }

    protected void onUnbindPreferences() {
    }

    public final RecyclerView getListView() {
        return this.mList;
    }

    public RecyclerView onCreateRecyclerView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        RecyclerView recyclerView = inflater.inflate(R.layout.preference_recyclerview, parent, false);
        recyclerView.setLayoutManager(onCreateLayoutManager());
        return recyclerView;
    }

    public RecyclerView.LayoutManager onCreateLayoutManager() {
        return new LinearLayoutManager(getActivity());
    }

    protected RecyclerView.Adapter onCreateAdapter(PreferenceScreen preferenceScreen) {
        return new PreferenceGroupAdapter(preferenceScreen);
    }

    @Override // android.support.v7.preference.PreferenceManager.OnDisplayPreferenceDialogListener
    public void onDisplayPreferenceDialog(Preference preference) {
        DialogFragment f;
        boolean handled = false;
        if (getCallbackFragment() instanceof OnPreferenceDisplayDialogCallback) {
            handled = getCallbackFragment().onPreferenceDisplayDialog(this, preference);
        }
        if (!handled && (getActivity() instanceof OnPreferenceDisplayDialogCallback)) {
            handled = getActivity().onPreferenceDisplayDialog(this, preference);
        }
        if (handled || getFragmentManager().findFragmentByTag(DIALOG_FRAGMENT_TAG) != null) {
            return;
        }
        if (preference instanceof EditTextPreference) {
            f = EditTextPreferenceDialogFragmentCompat.newInstance(preference.getKey());
        } else if (preference instanceof ListPreference) {
            f = ListPreferenceDialogFragmentCompat.newInstance(preference.getKey());
        } else {
            throw new IllegalArgumentException("Tried to display dialog for unknown preference type. Did you forget to override onDisplayPreferenceDialog()?");
        }
        f.setTargetFragment(this, 0);
        f.show(getFragmentManager(), DIALOG_FRAGMENT_TAG);
    }

    public Fragment getCallbackFragment() {
        return null;
    }

    /* loaded from: com.android.support.preference-v7.23.2.1.jar:android/support/v7/preference/PreferenceFragmentCompat$DividerDecoration.class */
    private class DividerDecoration extends RecyclerView.ItemDecoration {
        private Drawable mDivider;
        private int mDividerHeight;

        private DividerDecoration() {
        }

        public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
            if (this.mDivider == null) {
                return;
            }
            int childCount = parent.getChildCount();
            int width = parent.getWidth();
            for (int childViewIndex = 0; childViewIndex < childCount; childViewIndex++) {
                View view = parent.getChildAt(childViewIndex);
                if (shouldDrawDividerAbove(view, parent)) {
                    int top = (int) ViewCompat.getY(view);
                    this.mDivider.setBounds(0, top, width, top + this.mDividerHeight);
                    this.mDivider.draw(c);
                }
                if (shouldDrawDividerBelow(view, parent)) {
                    int top2 = ((int) ViewCompat.getY(view)) + view.getHeight();
                    this.mDivider.setBounds(0, top2, width, top2 + this.mDividerHeight);
                    this.mDivider.draw(c);
                }
            }
        }

        public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
            if (shouldDrawDividerAbove(view, parent)) {
                outRect.top = this.mDividerHeight;
            }
            if (shouldDrawDividerBelow(view, parent)) {
                outRect.bottom = this.mDividerHeight;
            }
        }

        private boolean shouldDrawDividerAbove(View view, RecyclerView parent) {
            RecyclerView.ViewHolder holder = parent.getChildViewHolder(view);
            return holder.getAdapterPosition() == 0 && ((PreferenceViewHolder) holder).isDividerAllowedAbove();
        }

        private boolean shouldDrawDividerBelow(View view, RecyclerView parent) {
            PreferenceViewHolder holder = (PreferenceViewHolder) parent.getChildViewHolder(view);
            boolean nextAllowed = true;
            int index = parent.indexOfChild(view);
            if (index < parent.getChildCount() - 1) {
                View nextView = parent.getChildAt(index + 1);
                PreferenceViewHolder nextHolder = (PreferenceViewHolder) parent.getChildViewHolder(nextView);
                nextAllowed = nextHolder.isDividerAllowedAbove();
            }
            return nextAllowed && holder.isDividerAllowedBelow();
        }

        public void setDivider(Drawable divider) {
            if (divider != null) {
                this.mDividerHeight = divider.getIntrinsicHeight();
            } else {
                this.mDividerHeight = 0;
            }
            this.mDivider = divider;
            PreferenceFragmentCompat.this.mList.invalidateItemDecorations();
        }

        public void setDividerHeight(int dividerHeight) {
            this.mDividerHeight = dividerHeight;
            PreferenceFragmentCompat.this.mList.invalidateItemDecorations();
        }
    }
}
