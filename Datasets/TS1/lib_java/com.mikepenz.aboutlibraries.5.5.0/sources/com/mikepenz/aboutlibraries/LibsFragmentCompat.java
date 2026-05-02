package com.mikepenz.aboutlibraries;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.aboutlibraries.entity.Library;
import com.mikepenz.aboutlibraries.ui.item.HeaderItem;
import com.mikepenz.aboutlibraries.ui.item.LibraryItem;
import com.mikepenz.fastadapter.adapters.FastItemAdapter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/LibsFragmentCompat.class */
public class LibsFragmentCompat {
    private RecyclerView mRecyclerView;
    private FastItemAdapter mAdapter;
    private LibsBuilder builder = null;
    private static ArrayList<Library> libraries;
    private Comparator<Library> comparator;
    private LibraryTask mLibTask;

    public void setLibraryComparator(Comparator<Library> comparator) {
        this.comparator = comparator;
    }

    public View onCreateView(Context context, LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState, Bundle arguments) {
        if (arguments != null) {
            this.builder = (LibsBuilder) arguments.getSerializable("data");
        } else {
            Log.e("AboutLibraries", "The AboutLibraries fragment can't be build without the bundle containing the LibsBuilder");
        }
        View view = inflater.inflate(R.layout.fragment_opensource, container, false);
        if (LibsConfiguration.getInstance().getUiListener() != null) {
            view = LibsConfiguration.getInstance().getUiListener().preOnCreateView(view);
        }
        if (view.getId() == R.id.cardListView) {
            this.mRecyclerView = (RecyclerView) view;
        } else {
            this.mRecyclerView = view.findViewById(R.id.cardListView);
        }
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(context));
        if (LibsConfiguration.getInstance().getItemAnimator() != null) {
            this.mRecyclerView.setItemAnimator(LibsConfiguration.getInstance().getItemAnimator());
        } else {
            this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        }
        if (this.builder != null) {
            this.mAdapter = new FastItemAdapter();
            this.mRecyclerView.setAdapter(this.mAdapter);
        }
        if (LibsConfiguration.getInstance().getUiListener() != null) {
            view = LibsConfiguration.getInstance().getUiListener().postOnCreateView(view);
        }
        return view;
    }

    public void onViewCreated(View view, Bundle savedInstanceState) {
        if (view.getContext() != null && this.builder != null) {
            this.mLibTask = new LibraryTask(view.getContext());
            executeLibTask(this.mLibTask);
        }
    }

    protected void executeLibTask(LibraryTask libraryTask) {
        if (libraryTask != null) {
            if (Build.VERSION.SDK_INT >= 11) {
                switch (this.builder.libTaskExecutor) {
                    case THREAD_POOL_EXECUTOR:
                        libraryTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new String[0]);
                        break;
                    case SERIAL_EXECUTOR:
                        libraryTask.executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, new String[0]);
                        break;
                    case DEFAULT_EXECUTOR:
                    default:
                        libraryTask.execute(new String[0]);
                        break;
                }
            }
            libraryTask.execute(new String[0]);
        }
    }

    public void onDestroyView() {
        if (this.mLibTask != null) {
            this.mLibTask.cancel(true);
            this.mLibTask = null;
        }
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask.class */
    public class LibraryTask extends AsyncTask<String, String, String> {
        Context ctx;
        String versionName;
        Integer versionCode;
        Drawable icon = null;

        public LibraryTask(Context ctx) {
            this.ctx = ctx;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            if (LibsConfiguration.getInstance().getLibTaskCallback() != null) {
                LibsConfiguration.getInstance().getLibTaskCallback().onLibTaskStarted();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... strings) {
            Libs libs;
            if (LibsFragmentCompat.this.builder.fields == null) {
                libs = new Libs(this.ctx);
            } else {
                libs = new Libs(this.ctx, LibsFragmentCompat.this.builder.fields);
            }
            LibsFragmentCompat.this.builder.aboutShowIcon = LibsFragmentCompat.this.extractBooleanBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutShowIcon, "aboutLibraries_description_showIcon");
            LibsFragmentCompat.this.builder.aboutShowVersion = LibsFragmentCompat.this.extractBooleanBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutShowVersion, "aboutLibraries_description_showVersion");
            LibsFragmentCompat.this.builder.aboutShowVersionName = LibsFragmentCompat.this.extractBooleanBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutShowVersionName, "aboutLibraries_description_showVersionName");
            LibsFragmentCompat.this.builder.aboutShowVersionCode = LibsFragmentCompat.this.extractBooleanBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutShowVersionCode, "aboutLibraries_description_showVersionCode");
            LibsFragmentCompat.this.builder.aboutAppName = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppName, "aboutLibraries_description_name");
            LibsFragmentCompat.this.builder.aboutDescription = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutDescription, "aboutLibraries_description_text");
            LibsFragmentCompat.this.builder.aboutAppSpecial1 = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial1, "aboutLibraries_description_special1_name");
            LibsFragmentCompat.this.builder.aboutAppSpecial1Description = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial1Description, "aboutLibraries_description_special1_text");
            LibsFragmentCompat.this.builder.aboutAppSpecial2 = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial2, "aboutLibraries_description_special2_name");
            LibsFragmentCompat.this.builder.aboutAppSpecial2Description = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial2Description, "aboutLibraries_description_special2_text");
            LibsFragmentCompat.this.builder.aboutAppSpecial3 = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial3, "aboutLibraries_description_special3_name");
            LibsFragmentCompat.this.builder.aboutAppSpecial3Description = LibsFragmentCompat.this.extractStringBundleOrResource(this.ctx, libs, LibsFragmentCompat.this.builder.aboutAppSpecial3Description, "aboutLibraries_description_special3_text");
            if (LibsFragmentCompat.libraries == null) {
                libs.modifyLibraries(LibsFragmentCompat.this.builder.libraryModification);
                boolean doDefaultSort = LibsFragmentCompat.this.builder.sort.booleanValue() && null == LibsFragmentCompat.this.builder.libraryComparator && null == LibsFragmentCompat.this.comparator;
                ArrayList unused = LibsFragmentCompat.libraries = libs.prepareLibraries(this.ctx, LibsFragmentCompat.this.builder.internalLibraries, LibsFragmentCompat.this.builder.excludeLibraries, LibsFragmentCompat.this.builder.autoDetect.booleanValue(), doDefaultSort);
                if (LibsFragmentCompat.this.comparator != null) {
                    Collections.sort(LibsFragmentCompat.libraries, LibsFragmentCompat.this.comparator);
                } else if (LibsFragmentCompat.this.builder.libraryComparator != null) {
                    Collections.sort(LibsFragmentCompat.libraries, LibsFragmentCompat.this.builder.libraryComparator);
                }
            }
            if (LibsFragmentCompat.this.builder.aboutShowIcon != null) {
                if (LibsFragmentCompat.this.builder.aboutShowVersion != null || LibsFragmentCompat.this.builder.aboutShowVersionName != null || LibsFragmentCompat.this.builder.aboutShowVersionCode.booleanValue()) {
                    PackageManager pm = this.ctx.getPackageManager();
                    String packageName = this.ctx.getPackageName();
                    ApplicationInfo appInfo = null;
                    PackageInfo packageInfo = null;
                    try {
                        appInfo = pm.getApplicationInfo(packageName, 0);
                        packageInfo = pm.getPackageInfo(packageName, 0);
                    } catch (Exception e) {
                    }
                    if (LibsFragmentCompat.this.builder.aboutShowIcon.booleanValue() && appInfo != null) {
                        this.icon = appInfo.loadIcon(pm);
                    }
                    this.versionName = null;
                    this.versionCode = null;
                    if (packageInfo != null) {
                        this.versionName = packageInfo.versionName;
                        this.versionCode = Integer.valueOf(packageInfo.versionCode);
                        return null;
                    }
                    return null;
                }
                return null;
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String s) {
            if (LibsFragmentCompat.this.builder.aboutShowIcon != null && (LibsFragmentCompat.this.builder.aboutShowVersion != null || LibsFragmentCompat.this.builder.aboutShowVersionName != null || LibsFragmentCompat.this.builder.aboutShowVersionCode.booleanValue())) {
                LibsFragmentCompat.this.mAdapter.add(new HeaderItem().withLibsBuilder(LibsFragmentCompat.this.builder).withAboutVersionName(this.versionName).withAboutVersionCode(this.versionCode).withAboutIcon(this.icon));
            }
            List<LibraryItem> libraryItems = new ArrayList<>();
            Iterator it = LibsFragmentCompat.libraries.iterator();
            while (it.hasNext()) {
                Library library = (Library) it.next();
                libraryItems.add(new LibraryItem().withLibrary(library).withLibsBuilder(LibsFragmentCompat.this.builder));
            }
            LibsFragmentCompat.this.mAdapter.add(libraryItems);
            super.onPostExecute((LibraryTask) s);
            if (LibsConfiguration.getInstance().getLibTaskCallback() != null) {
                LibsConfiguration.getInstance().getLibTaskCallback().onLibTaskFinished();
            }
            this.ctx = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Boolean extractBooleanBundleOrResource(Context ctx, Libs libs, Boolean value, String resName) {
        Boolean result = null;
        if (value != null) {
            result = value;
        } else {
            String descriptionShowVersion = libs.getStringResourceByName(ctx, resName);
            if (!TextUtils.isEmpty(descriptionShowVersion)) {
                try {
                    result = Boolean.valueOf(Boolean.parseBoolean(descriptionShowVersion));
                } catch (Exception e) {
                }
            }
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String extractStringBundleOrResource(Context ctx, Libs libs, String value, String resName) {
        String result = null;
        if (value != null) {
            result = value;
        } else {
            String descriptionShowVersion = libs.getStringResourceByName(ctx, resName);
            if (!TextUtils.isEmpty(descriptionShowVersion)) {
                result = descriptionShowVersion;
            }
        }
        return result;
    }
}
