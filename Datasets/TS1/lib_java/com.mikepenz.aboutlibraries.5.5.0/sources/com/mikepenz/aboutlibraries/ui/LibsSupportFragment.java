package com.mikepenz.aboutlibraries.ui;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.aboutlibraries.LibsFragmentCompat;

/* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/ui/LibsSupportFragment.class */
public class LibsSupportFragment extends Fragment {
    private LibsFragmentCompat libsFragmentCompat = new LibsFragmentCompat();

    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return this.libsFragmentCompat.onCreateView(container.getContext(), inflater, container, savedInstanceState, getArguments());
    }

    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.libsFragmentCompat.onViewCreated(view, savedInstanceState);
    }

    public void onDestroyView() {
        this.libsFragmentCompat.onDestroyView();
        super.onDestroyView();
    }
}
