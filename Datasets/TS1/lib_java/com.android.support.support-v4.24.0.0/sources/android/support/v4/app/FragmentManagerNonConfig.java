package android.support.v4.app;

import java.util.List;

/* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/app/FragmentManagerNonConfig.class */
public class FragmentManagerNonConfig {
    private final List<Fragment> mFragments;
    private final List<FragmentManagerNonConfig> mChildNonConfigs;

    FragmentManagerNonConfig(List<Fragment> fragments, List<FragmentManagerNonConfig> childNonConfigs) {
        this.mFragments = fragments;
        this.mChildNonConfigs = childNonConfigs;
    }

    List<Fragment> getFragments() {
        return this.mFragments;
    }

    List<FragmentManagerNonConfig> getChildNonConfigs() {
        return this.mChildNonConfigs;
    }
}
