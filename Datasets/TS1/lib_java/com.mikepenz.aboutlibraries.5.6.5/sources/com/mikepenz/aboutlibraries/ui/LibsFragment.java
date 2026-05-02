package com.mikepenz.aboutlibraries.ui;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.aboutlibraries.LibsFragmentCompat;

@TargetApi(11)
/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/ui/LibsFragment.class */
public class LibsFragment extends Fragment {
    private LibsFragmentCompat libsFragmentCompat = new LibsFragmentCompat();

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return this.libsFragmentCompat.onCreateView(container.getContext(), inflater, container, savedInstanceState, getArguments());
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.libsFragmentCompat.onViewCreated(view, savedInstanceState);
    }

    @Override // android.app.Fragment
    public void onDestroyView() {
        this.libsFragmentCompat.onDestroyView();
        super.onDestroyView();
    }
}
