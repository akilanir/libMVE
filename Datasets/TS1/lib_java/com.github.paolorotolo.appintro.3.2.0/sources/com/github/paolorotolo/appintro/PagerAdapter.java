package com.github.paolorotolo.appintro;

import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import java.util.List;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/PagerAdapter.class */
class PagerAdapter extends FragmentPagerAdapter {
    private List<Fragment> fragments;

    public PagerAdapter(FragmentManager fm, @NonNull List<Fragment> fragments) {
        super(fm);
        this.fragments = fragments;
    }

    public Fragment getItem(int position) {
        return this.fragments.get(position);
    }

    public int getCount() {
        return this.fragments.size();
    }

    @NonNull
    public List<Fragment> getFragments() {
        return this.fragments;
    }
}
