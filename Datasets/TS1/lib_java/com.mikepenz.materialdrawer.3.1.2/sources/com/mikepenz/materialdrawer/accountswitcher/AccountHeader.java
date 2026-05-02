package com.mikepenz.materialdrawer.accountswitcher;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.model.interfaces.Identifyable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/accountswitcher/AccountHeader.class */
public class AccountHeader {
    protected static final double NAVIGATION_DRAWER_ACCOUNT_ASPECT_RATIO = 0.5625d;
    protected static final String BUNDLE_SELECTION_HEADER = "bundle_selection_header";
    private final AccountHeaderBuilder mAccountHeaderBuilder;

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener.class */
    public interface OnAccountHeaderListener {
        boolean onProfileChanged(View view, IProfile iProfile, boolean z);
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener.class */
    public interface OnAccountHeaderSelectionViewClickListener {
        boolean onClick(View view, IProfile iProfile);
    }

    protected AccountHeader(AccountHeaderBuilder accountHeaderBuilder) {
        this.mAccountHeaderBuilder = accountHeaderBuilder;
    }

    public View getView() {
        return this.mAccountHeaderBuilder.mAccountHeaderContainer;
    }

    public void setDrawer(Drawer drawer) {
        this.mAccountHeaderBuilder.mDrawer = drawer;
    }

    public ImageView getHeaderBackgroundView() {
        return this.mAccountHeaderBuilder.mAccountHeaderBackground;
    }

    public void setBackground(Drawable headerBackground) {
        this.mAccountHeaderBuilder.mAccountHeaderBackground.setImageDrawable(headerBackground);
    }

    public void setBackgroundRes(int headerBackgroundRes) {
        this.mAccountHeaderBuilder.mAccountHeaderBackground.setImageResource(headerBackgroundRes);
    }

    public void toggleSelectionList(Context ctx) {
        this.mAccountHeaderBuilder.toggleSelectionList(ctx);
    }

    public boolean isSelectionListShown() {
        return this.mAccountHeaderBuilder.mSelectionListShown;
    }

    public ArrayList<IProfile> getProfiles() {
        return this.mAccountHeaderBuilder.mProfiles;
    }

    public void setProfiles(ArrayList<IProfile> profiles) {
        this.mAccountHeaderBuilder.mProfiles = profiles;
        this.mAccountHeaderBuilder.updateHeaderAndList();
    }

    public void setActiveProfile(IProfile profile) {
        setActiveProfile(profile, false);
    }

    public void setActiveProfile(IProfile profile, boolean fireOnProfileChanged) {
        boolean isCurrentSelectedProfile = this.mAccountHeaderBuilder.switchProfiles(profile);
        if (fireOnProfileChanged && this.mAccountHeaderBuilder.mOnAccountHeaderListener != null) {
            this.mAccountHeaderBuilder.mOnAccountHeaderListener.onProfileChanged(null, profile, isCurrentSelectedProfile);
        }
    }

    public void setActiveProfile(int identifier) {
        setActiveProfile(identifier, false);
    }

    public void setActiveProfile(int identifier, boolean fireOnProfileChanged) {
        if (this.mAccountHeaderBuilder.mProfiles != null) {
            Iterator<IProfile> it = this.mAccountHeaderBuilder.mProfiles.iterator();
            while (it.hasNext()) {
                IProfile profile = it.next();
                if ((profile instanceof Identifyable) && profile.getIdentifier() == identifier) {
                    setActiveProfile(profile, fireOnProfileChanged);
                    return;
                }
            }
        }
    }

    public void updateProfileByIdentifier(IProfile newProfile) {
        if (this.mAccountHeaderBuilder.mProfiles != null && newProfile != null && newProfile.getIdentifier() >= 0) {
            int found = -1;
            int i = 0;
            while (true) {
                if (i < this.mAccountHeaderBuilder.mProfiles.size()) {
                    if (!(this.mAccountHeaderBuilder.mProfiles.get(i) instanceof Identifyable) || this.mAccountHeaderBuilder.mProfiles.get(i).getIdentifier() != newProfile.getIdentifier()) {
                        i++;
                    } else {
                        found = i;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (found > -1) {
                this.mAccountHeaderBuilder.mProfiles.set(found, newProfile);
                this.mAccountHeaderBuilder.updateHeaderAndList();
            }
        }
    }

    public void addProfiles(IProfile... profiles) {
        if (this.mAccountHeaderBuilder.mProfiles == null) {
            this.mAccountHeaderBuilder.mProfiles = new ArrayList<>();
        }
        if (profiles != null) {
            Collections.addAll(this.mAccountHeaderBuilder.mProfiles, profiles);
        }
        this.mAccountHeaderBuilder.updateHeaderAndList();
    }

    public void addProfile(IProfile profile, int position) {
        if (this.mAccountHeaderBuilder.mProfiles == null) {
            this.mAccountHeaderBuilder.mProfiles = new ArrayList<>();
        }
        this.mAccountHeaderBuilder.mProfiles.add(position, profile);
        this.mAccountHeaderBuilder.updateHeaderAndList();
    }

    public void removeProfile(int position) {
        if (this.mAccountHeaderBuilder.mProfiles != null && this.mAccountHeaderBuilder.mProfiles.size() > position) {
            this.mAccountHeaderBuilder.mProfiles.remove(position);
        }
        this.mAccountHeaderBuilder.updateHeaderAndList();
    }

    public void removeProfile(IProfile profile) {
        if (this.mAccountHeaderBuilder.mProfiles != null) {
            this.mAccountHeaderBuilder.mProfiles.remove(profile);
        }
        this.mAccountHeaderBuilder.updateHeaderAndList();
    }

    public void clear() {
        this.mAccountHeaderBuilder.mProfiles = null;
        this.mAccountHeaderBuilder.calculateProfiles();
        this.mAccountHeaderBuilder.buildProfiles();
    }

    public Bundle saveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            savedInstanceState.putInt(BUNDLE_SELECTION_HEADER, this.mAccountHeaderBuilder.getCurrentSelection());
        }
        return savedInstanceState;
    }
}
