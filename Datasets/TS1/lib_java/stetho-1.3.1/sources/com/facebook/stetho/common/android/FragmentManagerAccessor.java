package com.facebook.stetho.common.android;

import java.util.List;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/android/FragmentManagerAccessor.class */
public interface FragmentManagerAccessor<FRAGMENT_MANAGER, FRAGMENT> {
    @Nullable
    List<FRAGMENT> getAddedFragments(FRAGMENT_MANAGER fragment_manager);
}
