package com.mikepenz.aboutlibraries.ui;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.LayoutAnimationController;
import com.mikepenz.aboutlibraries.Libs;
import com.mikepenz.aboutlibraries.LibsBuilder;
import com.mikepenz.aboutlibraries.LibsConfiguration;
import com.mikepenz.aboutlibraries.R;
import com.mikepenz.aboutlibraries.entity.Library;
import com.mikepenz.aboutlibraries.ui.adapter.LibsRecyclerViewAdapter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/ui/LibsFragment.class */
public class LibsFragment extends Fragment {
    private RecyclerView mRecyclerView;
    private LibsRecyclerViewAdapter mAdapter;
    LibsBuilder builder = null;
    private ArrayList<Library> libraries;
    private Comparator<Library> comparator;

    public void setLibraryComparator(Comparator<Library> comparator) {
        this.comparator = comparator;
    }

    public void onAttach(Activity activity) {
        Libs libs;
        super.onAttach(activity);
        Bundle bundle = getArguments();
        if (bundle != null) {
            this.builder = (LibsBuilder) bundle.getSerializable("data");
        }
        if (this.builder.fields == null) {
            libs = new Libs(getActivity());
        } else {
            libs = new Libs(getActivity(), this.builder.fields);
        }
        this.builder.aboutShowIcon = extractBooleanBundleOrResource(libs, this.builder.aboutShowIcon, "aboutLibraries_description_showIcon");
        this.builder.aboutShowVersion = extractBooleanBundleOrResource(libs, this.builder.aboutShowVersion, "aboutLibraries_description_showVersion");
        this.builder.aboutShowVersionName = extractBooleanBundleOrResource(libs, this.builder.aboutShowVersionName, "aboutLibraries_description_showVersionName");
        this.builder.aboutShowVersionCode = extractBooleanBundleOrResource(libs, this.builder.aboutShowVersionCode, "aboutLibraries_description_showVersionCode");
        this.builder.aboutAppName = extractStringBundleOrResource(libs, this.builder.aboutAppName, "aboutLibraries_description_name");
        this.builder.aboutDescription = extractStringBundleOrResource(libs, this.builder.aboutDescription, "aboutLibraries_description_text");
        this.builder.aboutAppSpecial1 = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial1, "aboutLibraries_description_special1_name");
        this.builder.aboutAppSpecial1Description = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial1Description, "aboutLibraries_description_special1_text");
        this.builder.aboutAppSpecial2 = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial2, "aboutLibraries_description_special2_name");
        this.builder.aboutAppSpecial2Description = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial2Description, "aboutLibraries_description_special2_text");
        this.builder.aboutAppSpecial3 = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial3, "aboutLibraries_description_special3_name");
        this.builder.aboutAppSpecial3Description = extractStringBundleOrResource(libs, this.builder.aboutAppSpecial3Description, "aboutLibraries_description_special3_text");
        libs.modifyLibraries(this.builder.libraryModification);
        boolean doDefaultSort = this.builder.sort.booleanValue() && null == this.builder.libraryComparator && null == this.comparator;
        this.libraries = libs.prepareLibraries(getActivity(), this.builder.internalLibraries, this.builder.excludeLibraries, this.builder.autoDetect.booleanValue(), doDefaultSort);
        if (this.comparator != null) {
            Collections.sort(this.libraries, this.comparator);
        } else if (this.builder.libraryComparator != null) {
            Collections.sort(this.libraries, this.builder.libraryComparator);
        }
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_opensource, container, false);
        if (LibsConfiguration.getInstance().getUiListener() != null) {
            view = LibsConfiguration.getInstance().getUiListener().preOnCreateView(view);
        }
        if (view.getId() == R.id.cardListView) {
            this.mRecyclerView = (RecyclerView) view;
        } else {
            this.mRecyclerView = view.findViewById(R.id.cardListView);
        }
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));
        this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
        this.mAdapter = new LibsRecyclerViewAdapter(this.builder);
        this.mRecyclerView.setAdapter(this.mAdapter);
        generateAboutThisAppSection();
        if (LibsConfiguration.getInstance().getUiListener() != null) {
            view = LibsConfiguration.getInstance().getUiListener().postOnCreateView(view);
        }
        return view;
    }

    public void onViewCreated(View view, Bundle savedInstanceState) {
        LayoutAnimationController layoutAnimationController;
        this.mAdapter.addLibs(this.libraries);
        if (this.builder.animate.booleanValue()) {
            if (LibsConfiguration.getInstance().getLayoutAnimationController() == null) {
                Animation fadeIn = AnimationUtils.loadAnimation(getActivity(), android.R.anim.slide_in_left);
                fadeIn.setDuration(500L);
                layoutAnimationController = new LayoutAnimationController(fadeIn);
            } else {
                layoutAnimationController = LibsConfiguration.getInstance().getLayoutAnimationController();
            }
            this.mRecyclerView.setLayoutAnimation(layoutAnimationController);
            this.mRecyclerView.startLayoutAnimation();
        }
        super.onViewCreated(view, savedInstanceState);
    }

    private void generateAboutThisAppSection() {
        if (this.builder.aboutShowIcon != null) {
            if (this.builder.aboutShowVersion != null || this.builder.aboutShowVersionName != null || this.builder.aboutShowVersionCode.booleanValue()) {
                PackageManager pm = getActivity().getPackageManager();
                String packageName = getActivity().getPackageName();
                ApplicationInfo appInfo = null;
                PackageInfo packageInfo = null;
                try {
                    appInfo = pm.getApplicationInfo(packageName, 0);
                    packageInfo = pm.getPackageInfo(packageName, 0);
                } catch (Exception e) {
                }
                Drawable icon = null;
                if (this.builder.aboutShowIcon.booleanValue() && appInfo != null) {
                    icon = appInfo.loadIcon(pm);
                }
                String versionName = null;
                Integer versionCode = null;
                if (packageInfo != null) {
                    versionName = packageInfo.versionName;
                    versionCode = Integer.valueOf(packageInfo.versionCode);
                }
                this.mAdapter.setHeader(versionName, versionCode, icon);
            }
        }
    }

    private Boolean extractBooleanBundleOrResource(Libs libs, Boolean value, String resName) {
        Boolean result = null;
        if (value != null) {
            result = value;
        } else {
            String descriptionShowVersion = libs.getStringResourceByName(getActivity(), resName);
            if (!TextUtils.isEmpty(descriptionShowVersion)) {
                try {
                    result = Boolean.valueOf(Boolean.parseBoolean(descriptionShowVersion));
                } catch (Exception e) {
                }
            }
        }
        return result;
    }

    private String extractStringBundleOrResource(Libs libs, String value, String resName) {
        String result = null;
        if (value != null) {
            result = value;
        } else {
            String descriptionShowVersion = libs.getStringResourceByName(getActivity(), resName);
            if (!TextUtils.isEmpty(descriptionShowVersion)) {
                result = descriptionShowVersion;
            }
        }
        return result;
    }
}
