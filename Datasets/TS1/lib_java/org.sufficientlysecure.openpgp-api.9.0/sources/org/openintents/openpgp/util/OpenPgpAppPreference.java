package org.openintents.openpgp.util;

import android.R;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.openintents.openpgp.BuildConfig;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpAppPreference.class */
public class OpenPgpAppPreference extends DialogPreference {
    private ArrayList<OpenPgpProviderEntry> mLegacyList;
    private ArrayList<OpenPgpProviderEntry> mList;
    private String mSelectedPackage;
    private static final String MARKET_INTENT_URI_BASE = "market://details?id=%s";
    private static final String OPENKEYCHAIN_PACKAGE = "org.sufficientlysecure.keychain";
    private static final Intent MARKET_INTENT = new Intent("android.intent.action.VIEW", Uri.parse(String.format(MARKET_INTENT_URI_BASE, OPENKEYCHAIN_PACKAGE)));
    private static final ArrayList<String> PROVIDER_BLACKLIST = new ArrayList<>();

    static {
        PROVIDER_BLACKLIST.add("org.thialfihar.android.apg");
    }

    public OpenPgpAppPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mLegacyList = new ArrayList<>();
        this.mList = new ArrayList<>();
        populateAppList();
    }

    public OpenPgpAppPreference(Context context) {
        this(context, null);
    }

    public void addLegacyProvider(int position, String packageName, String simpleName, Drawable icon) {
        this.mLegacyList.add(position, new OpenPgpProviderEntry(packageName, simpleName, icon));
    }

    @Override // android.preference.DialogPreference
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        populateAppList();
        ListAdapter adapter = new ArrayAdapter<OpenPgpProviderEntry>(getContext(), R.layout.select_dialog_singlechoice, R.id.text1, this.mList) { // from class: org.openintents.openpgp.util.OpenPgpAppPreference.1
            @Override // android.widget.ArrayAdapter, android.widget.Adapter
            public View getView(int position, View convertView, ViewGroup parent) {
                View v = super.getView(position, convertView, parent);
                TextView tv = (TextView) v.findViewById(R.id.text1);
                tv.setCompoundDrawablesWithIntrinsicBounds(((OpenPgpProviderEntry) OpenPgpAppPreference.this.mList.get(position)).icon, (Drawable) null, (Drawable) null, (Drawable) null);
                int dp10 = (int) ((10.0f * getContext().getResources().getDisplayMetrics().density) + 0.5f);
                tv.setCompoundDrawablePadding(dp10);
                return v;
            }
        };
        builder.setSingleChoiceItems(adapter, getIndexOfProviderList(this.mSelectedPackage), new DialogInterface.OnClickListener() { // from class: org.openintents.openpgp.util.OpenPgpAppPreference.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                OpenPgpProviderEntry entry = (OpenPgpProviderEntry) OpenPgpAppPreference.this.mList.get(which);
                if (entry.intent == null) {
                    OpenPgpAppPreference.this.mSelectedPackage = entry.packageName;
                    OpenPgpAppPreference.this.onClick(dialog, -1);
                    dialog.dismiss();
                    return;
                }
                OpenPgpAppPreference.this.getContext().startActivity(entry.intent);
            }
        });
        builder.setPositiveButton((CharSequence) null, (DialogInterface.OnClickListener) null);
    }

    @Override // android.preference.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);
        if (positiveResult && this.mSelectedPackage != null) {
            save();
        }
    }

    private void save() {
        if (!callChangeListener(this.mSelectedPackage)) {
            return;
        }
        setAndPersist(this.mSelectedPackage);
    }

    private void setAndPersist(String packageName) {
        this.mSelectedPackage = packageName;
        persistString(this.mSelectedPackage);
        notifyChanged();
        updateSummary(this.mSelectedPackage);
    }

    private void updateSummary(String packageName) {
        String summary = getEntryByValue(packageName);
        setSummary(summary);
    }

    @Override // android.preference.Preference
    public CharSequence getSummary() {
        return getEntryByValue(this.mSelectedPackage);
    }

    private int getIndexOfProviderList(String packageName) {
        Iterator i$ = this.mList.iterator();
        while (i$.hasNext()) {
            OpenPgpProviderEntry app = i$.next();
            if (app.packageName.equals(packageName)) {
                return this.mList.indexOf(app);
            }
        }
        return 0;
    }

    public String getEntry() {
        return getEntryByValue(this.mSelectedPackage);
    }

    public String getValue() {
        return this.mSelectedPackage;
    }

    public void setValue(String packageName) {
        setAndPersist(packageName);
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return a.getString(index);
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        if (restoreValue) {
            this.mSelectedPackage = getPersistedString(this.mSelectedPackage);
            updateSummary(this.mSelectedPackage);
        } else {
            String value = (String) defaultValue;
            setAndPersist(value);
            updateSummary(value);
        }
    }

    public String getEntryByValue(String packageName) {
        Iterator i$ = this.mList.iterator();
        while (i$.hasNext()) {
            OpenPgpProviderEntry app = i$.next();
            if (app.packageName.equals(packageName) && app.intent == null) {
                return app.simpleName;
            }
        }
        return getContext().getString(org.openintents.openpgp.R.string.openpgp_list_preference_none);
    }

    private void populateAppList() {
        this.mList.clear();
        this.mList.add(0, new OpenPgpProviderEntry(BuildConfig.FLAVOR, getContext().getString(org.openintents.openpgp.R.string.openpgp_list_preference_none), getContext().getResources().getDrawable(org.openintents.openpgp.R.drawable.ic_action_cancel_launchersize)));
        this.mList.addAll(this.mLegacyList);
        ArrayList<OpenPgpProviderEntry> providerList = new ArrayList<>();
        Intent intent = new Intent(OpenPgpApi.SERVICE_INTENT_2);
        List<ResolveInfo> resInfo = getContext().getPackageManager().queryIntentServices(intent, 0);
        if (!resInfo.isEmpty()) {
            for (ResolveInfo resolveInfo : resInfo) {
                if (resolveInfo.serviceInfo != null) {
                    String packageName = resolveInfo.serviceInfo.packageName;
                    String simpleName = String.valueOf(resolveInfo.serviceInfo.loadLabel(getContext().getPackageManager()));
                    Drawable icon = resolveInfo.serviceInfo.loadIcon(getContext().getPackageManager());
                    if (!PROVIDER_BLACKLIST.contains(packageName)) {
                        providerList.add(new OpenPgpProviderEntry(packageName, simpleName, icon));
                    }
                }
            }
        }
        if (providerList.isEmpty()) {
            for (ResolveInfo resolveInfo2 : getContext().getPackageManager().queryIntentActivities(MARKET_INTENT, 0)) {
                Intent marketIntent = new Intent(MARKET_INTENT);
                marketIntent.setPackage(resolveInfo2.activityInfo.packageName);
                Drawable icon2 = resolveInfo2.activityInfo.loadIcon(getContext().getPackageManager());
                String marketName = String.valueOf(resolveInfo2.activityInfo.applicationInfo.loadLabel(getContext().getPackageManager()));
                String simpleName2 = String.format(getContext().getString(org.openintents.openpgp.R.string.openpgp_install_openkeychain_via), marketName);
                this.mList.add(new OpenPgpProviderEntry(OPENKEYCHAIN_PACKAGE, simpleName2, icon2, marketIntent));
            }
            return;
        }
        this.mList.addAll(providerList);
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry.class */
    private static class OpenPgpProviderEntry {
        private String packageName;
        private String simpleName;
        private Drawable icon;
        private Intent intent;

        public OpenPgpProviderEntry(String packageName, String simpleName, Drawable icon) {
            this.packageName = packageName;
            this.simpleName = simpleName;
            this.icon = icon;
        }

        public OpenPgpProviderEntry(String packageName, String simpleName, Drawable icon, Intent intent) {
            this(packageName, simpleName, icon);
            this.intent = intent;
        }

        public String toString() {
            return this.simpleName;
        }
    }
}
