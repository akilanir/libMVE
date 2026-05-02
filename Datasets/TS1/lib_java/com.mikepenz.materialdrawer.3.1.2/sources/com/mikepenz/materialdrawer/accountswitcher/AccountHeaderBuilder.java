package com.mikepenz.materialdrawer.accountswitcher;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.mikepenz.google_material_typeface_library.GoogleMaterial;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.utils.Utils;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.accountswitcher.AccountHeader;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.util.UIUtils;
import com.mikepenz.materialdrawer.view.BezelImageView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Stack;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder.class */
public class AccountHeaderBuilder {
    protected View mAccountHeader;
    protected ImageView mAccountHeaderBackground;
    protected BezelImageView mCurrentProfileView;
    protected View mAccountHeaderTextSection;
    protected ImageView mAccountSwitcherArrow;
    protected TextView mCurrentProfileName;
    protected TextView mCurrentProfileEmail;
    protected BezelImageView mProfileFirstView;
    protected BezelImageView mProfileSecondView;
    protected BezelImageView mProfileThirdView;
    protected IProfile mCurrentProfile;
    protected IProfile mProfileFirst;
    protected IProfile mProfileSecond;
    protected IProfile mProfileThird;
    protected Activity mActivity;
    protected Typeface mTypeface;
    protected Typeface mNameTypeface;
    protected Typeface mEmailTypeface;
    protected String mSelectionFirstLine;
    protected String mSelectionSecondLine;
    protected AccountHeader.OnAccountHeaderSelectionViewClickListener mOnAccountHeaderSelectionViewClickListener;
    protected View mAccountHeaderContainer;
    protected ArrayList<IProfile> mProfiles;
    protected AccountHeader.OnAccountHeaderListener mOnAccountHeaderListener;
    protected Drawer mDrawer;
    protected Bundle mSavedInstance;
    protected boolean mSelectionListShown = false;
    protected int mAccountHeaderTextSectionBackgroundResource = -1;
    protected boolean mCompactStyle = false;
    protected int mHeightPx = -1;
    protected int mHeightDp = -1;
    protected int mHeightRes = -1;
    protected int mTextColor = 0;
    protected int mTextColorRes = -1;
    protected boolean mCurrentHiddenInList = false;
    protected boolean mSelectionFirstLineShown = true;
    protected boolean mSelectionSecondLineShown = true;
    protected boolean mTranslucentStatusBar = true;
    protected Drawable mHeaderBackground = null;
    protected int mHeaderBackgroundRes = -1;
    protected ImageView.ScaleType mHeaderBackgroundScaleType = null;
    protected boolean mProfileImagesVisible = true;
    protected boolean mCloseDrawerOnProfileListClick = true;
    protected boolean mResetDrawerOnProfileListClick = true;
    protected boolean mProfileImagesClickable = true;
    protected boolean mAlternativeProfileHeaderSwitching = false;
    protected boolean mThreeSmallProfileImages = false;
    protected boolean mSelectionListEnabledForSingleProfile = true;
    protected boolean mSelectionListEnabled = true;
    private View.OnClickListener onCurrentProfileClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AccountHeaderBuilder.this.onProfileClick(v, true);
        }
    };
    private View.OnClickListener onProfileClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.2
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AccountHeaderBuilder.this.onProfileClick(v, false);
        }
    };
    private View.OnClickListener onSelectionClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.4
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            boolean consumed = false;
            if (AccountHeaderBuilder.this.mOnAccountHeaderSelectionViewClickListener != null) {
                consumed = AccountHeaderBuilder.this.mOnAccountHeaderSelectionViewClickListener.onClick(v, (IProfile) v.getTag(R.id.profile_header));
            }
            if (AccountHeaderBuilder.this.mAccountSwitcherArrow.getVisibility() == 0 && !consumed) {
                AccountHeaderBuilder.this.toggleSelectionList(v.getContext());
            }
        }
    };
    private Drawer.OnDrawerItemClickListener onDrawerItemClickListener = new Drawer.OnDrawerItemClickListener() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.5
        @Override // com.mikepenz.materialdrawer.Drawer.OnDrawerItemClickListener
        public boolean onItemClick(AdapterView<?> parent, final View view, int position, long id, final IDrawerItem drawerItem) {
            boolean isCurrentSelectedProfile;
            if (drawerItem != null && (drawerItem instanceof IProfile) && ((IProfile) drawerItem).isSelectable()) {
                isCurrentSelectedProfile = AccountHeaderBuilder.this.switchProfiles((IProfile) drawerItem);
            } else {
                isCurrentSelectedProfile = false;
            }
            if (AccountHeaderBuilder.this.mResetDrawerOnProfileListClick) {
                AccountHeaderBuilder.this.mDrawer.setOnDrawerItemClickListener(null);
            }
            final boolean z = isCurrentSelectedProfile;
            new Handler().postDelayed(new Runnable() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.5.1
                @Override // java.lang.Runnable
                public void run() {
                    if (AccountHeaderBuilder.this.mResetDrawerOnProfileListClick && AccountHeaderBuilder.this.mDrawer != null && view != null && view.getContext() != null) {
                        AccountHeaderBuilder.this.resetDrawerContent(view.getContext());
                    }
                    if (drawerItem != null && (drawerItem instanceof IProfile) && AccountHeaderBuilder.this.mOnAccountHeaderListener != null) {
                        AccountHeaderBuilder.this.mOnAccountHeaderListener.onProfileChanged(view, (IProfile) drawerItem, z);
                    }
                }
            }, 350L);
            return !AccountHeaderBuilder.this.mCloseDrawerOnProfileListClick;
        }
    };

    public AccountHeaderBuilder withActivity(Activity activity) {
        this.mActivity = activity;
        return this;
    }

    public AccountHeaderBuilder withCompactStyle(boolean compactStyle) {
        this.mCompactStyle = compactStyle;
        return this;
    }

    public AccountHeaderBuilder withTypeface(Typeface typeface) {
        this.mTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withNameTypeface(Typeface typeface) {
        this.mNameTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withEmailTypeface(Typeface typeface) {
        this.mEmailTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withHeightPx(int heightPx) {
        this.mHeightPx = heightPx;
        return this;
    }

    public AccountHeaderBuilder withHeightDp(int heightDp) {
        this.mHeightDp = heightDp;
        return this;
    }

    public AccountHeaderBuilder withHeightRes(int heightRes) {
        this.mHeightRes = heightRes;
        return this;
    }

    public AccountHeaderBuilder withTextColor(int textColor) {
        this.mTextColor = textColor;
        return this;
    }

    public AccountHeaderBuilder withTextColorRes(int textColorRes) {
        this.mTextColorRes = textColorRes;
        return this;
    }

    public AccountHeaderBuilder withCurrentProfileHiddenInList(boolean currentProfileHiddenInList) {
        this.mCurrentHiddenInList = currentProfileHiddenInList;
        return this;
    }

    @Deprecated
    public AccountHeaderBuilder withSelectionFistLineShown(boolean selectionFirstLineShown) {
        this.mSelectionFirstLineShown = selectionFirstLineShown;
        return this;
    }

    public AccountHeaderBuilder withSelectionFirstLineShown(boolean selectionFirstLineShown) {
        this.mSelectionFirstLineShown = selectionFirstLineShown;
        return this;
    }

    public AccountHeaderBuilder withSelectionSecondLineShown(boolean selectionSecondLineShown) {
        this.mSelectionSecondLineShown = selectionSecondLineShown;
        return this;
    }

    public AccountHeaderBuilder withSelectionFirstLine(String selectionFirstLine) {
        this.mSelectionFirstLine = selectionFirstLine;
        return this;
    }

    public AccountHeaderBuilder withSelectionSecondLine(String selectionSecondLine) {
        this.mSelectionSecondLine = selectionSecondLine;
        return this;
    }

    public AccountHeaderBuilder withTranslucentStatusBar(boolean translucentStatusBar) {
        this.mTranslucentStatusBar = translucentStatusBar;
        return this;
    }

    public AccountHeaderBuilder withHeaderBackground(Drawable headerBackground) {
        this.mHeaderBackground = headerBackground;
        return this;
    }

    public AccountHeaderBuilder withHeaderBackground(int headerBackgroundRes) {
        this.mHeaderBackgroundRes = headerBackgroundRes;
        return this;
    }

    public AccountHeaderBuilder withHeaderBackgroundScaleType(ImageView.ScaleType headerBackgroundScaleType) {
        this.mHeaderBackgroundScaleType = headerBackgroundScaleType;
        return this;
    }

    public AccountHeaderBuilder withProfileImagesVisible(boolean profileImagesVisible) {
        this.mProfileImagesVisible = profileImagesVisible;
        return this;
    }

    public AccountHeaderBuilder withCloseDrawerOnProfileListClick(boolean closeDrawerOnProfileListClick) {
        this.mCloseDrawerOnProfileListClick = closeDrawerOnProfileListClick;
        return this;
    }

    public AccountHeaderBuilder withResetDrawerOnProfileListClick(boolean resetDrawerOnProfileListClick) {
        this.mResetDrawerOnProfileListClick = resetDrawerOnProfileListClick;
        return this;
    }

    public AccountHeaderBuilder withProfileImagesClickable(boolean profileImagesClickable) {
        this.mProfileImagesClickable = profileImagesClickable;
        return this;
    }

    public AccountHeaderBuilder withAlternativeProfileHeaderSwitching(boolean alternativeProfileHeaderSwitching) {
        this.mAlternativeProfileHeaderSwitching = alternativeProfileHeaderSwitching;
        return this;
    }

    public AccountHeaderBuilder withThreeSmallProfileImages(boolean threeSmallProfileImages) {
        this.mThreeSmallProfileImages = threeSmallProfileImages;
        return this;
    }

    public AccountHeaderBuilder withOnAccountHeaderSelectionViewClickListener(AccountHeader.OnAccountHeaderSelectionViewClickListener onAccountHeaderSelectionViewClickListener) {
        this.mOnAccountHeaderSelectionViewClickListener = onAccountHeaderSelectionViewClickListener;
        return this;
    }

    public AccountHeaderBuilder withSelectionListEnabledForSingleProfile(boolean selectionListEnabledForSingleProfile) {
        this.mSelectionListEnabledForSingleProfile = selectionListEnabledForSingleProfile;
        return this;
    }

    public AccountHeaderBuilder withSelectionListEnabled(boolean selectionListEnabled) {
        this.mSelectionListEnabled = selectionListEnabled;
        return this;
    }

    public AccountHeaderBuilder withAccountHeader(View accountHeader) {
        this.mAccountHeaderContainer = accountHeader;
        return this;
    }

    public AccountHeaderBuilder withAccountHeader(int resLayout) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (resLayout != -1) {
            this.mAccountHeaderContainer = this.mActivity.getLayoutInflater().inflate(resLayout, (ViewGroup) null, false);
        } else if (this.mCompactStyle) {
            this.mAccountHeaderContainer = this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_compact_header, (ViewGroup) null, false);
        } else {
            this.mAccountHeaderContainer = this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_header, (ViewGroup) null, false);
        }
        return this;
    }

    public AccountHeaderBuilder withProfiles(ArrayList<IProfile> profiles) {
        this.mProfiles = profiles;
        return this;
    }

    public AccountHeaderBuilder addProfiles(IProfile... profiles) {
        if (this.mProfiles == null) {
            this.mProfiles = new ArrayList<>();
        }
        if (profiles != null) {
            Collections.addAll(this.mProfiles, profiles);
        }
        return this;
    }

    public AccountHeaderBuilder withOnAccountHeaderListener(AccountHeader.OnAccountHeaderListener onAccountHeaderListener) {
        this.mOnAccountHeaderListener = onAccountHeaderListener;
        return this;
    }

    public AccountHeaderBuilder withDrawer(Drawer drawer) {
        this.mDrawer = drawer;
        return this;
    }

    public AccountHeaderBuilder withSavedInstance(Bundle savedInstance) {
        this.mSavedInstance = savedInstance;
        return this;
    }

    private void setHeaderHeight(int height) {
        if (this.mAccountHeaderContainer != null) {
            ViewGroup.LayoutParams params = this.mAccountHeaderContainer.getLayoutParams();
            if (params != null) {
                params.height = height;
                this.mAccountHeaderContainer.setLayoutParams(params);
            }
            View accountHeader = this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer);
            if (accountHeader != null) {
                ViewGroup.LayoutParams params2 = accountHeader.getLayoutParams();
                params2.height = height;
                accountHeader.setLayoutParams(params2);
            }
            View accountHeaderBackground = this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer_background);
            if (accountHeaderBackground != null) {
                ViewGroup.LayoutParams params3 = accountHeaderBackground.getLayoutParams();
                params3.height = height;
                accountHeaderBackground.setLayoutParams(params3);
            }
        }
    }

    private void handleSelectionView(IProfile profile, boolean on) {
        if (on) {
            if (Build.VERSION.SDK_INT >= 21) {
                ((FrameLayout) this.mAccountHeaderContainer).setForeground(UIUtils.getCompatDrawable(this.mAccountHeaderContainer.getContext(), this.mAccountHeaderTextSectionBackgroundResource));
                this.mAccountHeaderContainer.setOnClickListener(this.onSelectionClickListener);
                this.mAccountHeaderContainer.setTag(R.id.profile_header, profile);
                return;
            } else {
                this.mAccountHeaderTextSection.setBackgroundResource(this.mAccountHeaderTextSectionBackgroundResource);
                this.mAccountHeaderTextSection.setOnClickListener(this.onSelectionClickListener);
                this.mAccountHeaderTextSection.setTag(R.id.profile_header, profile);
                return;
            }
        }
        if (Build.VERSION.SDK_INT >= 21) {
            ((FrameLayout) this.mAccountHeaderContainer).setForeground(null);
            this.mAccountHeaderContainer.setOnClickListener(null);
        } else {
            UIUtils.setBackground(this.mAccountHeaderTextSection, (Drawable) null);
            this.mAccountHeaderTextSection.setOnClickListener(null);
        }
    }

    public AccountHeader build() {
        int height;
        int selection;
        if (this.mAccountHeaderContainer == null) {
            withAccountHeader(-1);
        }
        this.mAccountHeader = this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer);
        if (this.mHeightPx != -1) {
            height = this.mHeightPx;
        } else if (this.mHeightDp != -1) {
            height = Utils.convertDpToPx(this.mActivity, this.mHeightDp);
        } else if (this.mHeightRes != -1) {
            height = this.mActivity.getResources().getDimensionPixelSize(this.mHeightRes);
        } else if (this.mCompactStyle) {
            height = this.mActivity.getResources().getDimensionPixelSize(R.dimen.material_drawer_account_header_height_compact);
        } else {
            height = (int) (UIUtils.getOptimalDrawerWidth(this.mActivity) * 0.5625d);
            if (Build.VERSION.SDK_INT < 19) {
                int tempHeight = height - UIUtils.getStatusBarHeight(this.mActivity, true);
                if (UIUtils.convertPixelsToDp(tempHeight, this.mActivity) > 140.0f) {
                    height = tempHeight;
                }
            }
        }
        if (this.mTranslucentStatusBar) {
            this.mAccountHeader.setPadding(0, UIUtils.getStatusBarHeight(this.mActivity), 0, 0);
            if (this.mCompactStyle) {
                height += UIUtils.getStatusBarHeight(this.mActivity);
            }
        }
        setHeaderHeight(height);
        this.mAccountHeaderBackground = (ImageView) this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer_background);
        if (this.mHeaderBackground != null) {
            this.mAccountHeaderBackground.setImageDrawable(this.mHeaderBackground);
        } else if (this.mHeaderBackgroundRes != -1) {
            this.mAccountHeaderBackground.setImageResource(this.mHeaderBackgroundRes);
        }
        if (this.mHeaderBackgroundScaleType != null) {
            this.mAccountHeaderBackground.setScaleType(this.mHeaderBackgroundScaleType);
        }
        if (this.mTextColor == 0 && this.mTextColorRes != -1) {
            this.mTextColor = this.mActivity.getResources().getColor(this.mTextColorRes);
        } else if (this.mTextColor == 0) {
            this.mTextColor = UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_header_selection_text, R.color.material_drawer_header_selection_text);
        }
        if (this.mCompactStyle) {
            this.mAccountHeaderTextSection = this.mAccountHeader;
        } else {
            this.mAccountHeaderTextSection = this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer_text_section);
        }
        this.mAccountHeaderTextSectionBackgroundResource = UIUtils.getSelectableBackground(this.mActivity);
        handleSelectionView(this.mCurrentProfile, true);
        this.mAccountSwitcherArrow = (ImageView) this.mAccountHeaderContainer.findViewById(R.id.account_header_drawer_text_switcher);
        this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(this.mActivity, GoogleMaterial.Icon.gmd_arrow_drop_down).sizeDp(24).paddingDp(6).color(this.mTextColor));
        this.mCurrentProfileView = (BezelImageView) this.mAccountHeader.findViewById(R.id.account_header_drawer_current);
        this.mCurrentProfileName = (TextView) this.mAccountHeader.findViewById(R.id.account_header_drawer_name);
        this.mCurrentProfileEmail = (TextView) this.mAccountHeader.findViewById(R.id.account_header_drawer_email);
        if (this.mNameTypeface != null) {
            this.mCurrentProfileName.setTypeface(this.mNameTypeface);
        } else if (this.mTypeface != null) {
            this.mCurrentProfileName.setTypeface(this.mTypeface);
        }
        if (this.mEmailTypeface != null) {
            this.mCurrentProfileEmail.setTypeface(this.mEmailTypeface);
        } else if (this.mTypeface != null) {
            this.mCurrentProfileEmail.setTypeface(this.mTypeface);
        }
        this.mCurrentProfileName.setTextColor(this.mTextColor);
        this.mCurrentProfileEmail.setTextColor(this.mTextColor);
        this.mProfileFirstView = (BezelImageView) this.mAccountHeader.findViewById(R.id.account_header_drawer_small_first);
        this.mProfileSecondView = (BezelImageView) this.mAccountHeader.findViewById(R.id.account_header_drawer_small_second);
        this.mProfileThirdView = (BezelImageView) this.mAccountHeader.findViewById(R.id.account_header_drawer_small_third);
        calculateProfiles();
        buildProfiles();
        if (this.mSavedInstance != null && (selection = this.mSavedInstance.getInt("bundle_selection_header", -1)) != -1 && this.mProfiles != null && selection > -1 && selection < this.mProfiles.size()) {
            switchProfiles(this.mProfiles.get(selection));
        }
        if (this.mDrawer != null) {
            this.mDrawer.setHeader(this.mAccountHeaderContainer);
        }
        this.mActivity = null;
        return new AccountHeader(this);
    }

    protected void calculateProfiles() {
        if (this.mProfiles == null) {
            this.mProfiles = new ArrayList<>();
        }
        if (this.mCurrentProfile == null) {
            int setCount = 0;
            for (int i = 0; i < this.mProfiles.size(); i++) {
                if (this.mProfiles.size() > i && this.mProfiles.get(i).isSelectable()) {
                    if (setCount == 0 && this.mCurrentProfile == null) {
                        this.mCurrentProfile = this.mProfiles.get(i);
                    } else if (setCount == 1 && this.mProfileFirst == null) {
                        this.mProfileFirst = this.mProfiles.get(i);
                    } else if (setCount == 2 && this.mProfileSecond == null) {
                        this.mProfileSecond = this.mProfiles.get(i);
                    } else if (setCount == 3 && this.mProfileThird == null) {
                        this.mProfileThird = this.mProfiles.get(i);
                    }
                    setCount++;
                }
            }
            return;
        }
        IProfile[] previousActiveProfiles = {this.mCurrentProfile, this.mProfileFirst, this.mProfileSecond, this.mProfileThird};
        IProfile[] newActiveProfiles = new IProfile[4];
        Stack<IProfile> unusedProfiles = new Stack<>();
        for (int i2 = 0; i2 < this.mProfiles.size(); i2++) {
            IProfile p = this.mProfiles.get(i2);
            if (p.isSelectable()) {
                boolean used = false;
                int j = 0;
                while (true) {
                    if (j >= 4) {
                        break;
                    }
                    if (previousActiveProfiles[j] != p) {
                        j++;
                    } else {
                        newActiveProfiles[j] = p;
                        used = true;
                        break;
                    }
                }
                if (!used) {
                    unusedProfiles.push(p);
                }
            }
        }
        Stack<IProfile> activeProfiles = new Stack<>();
        for (int i3 = 0; i3 < 4; i3++) {
            if (newActiveProfiles[i3] != null) {
                activeProfiles.push(newActiveProfiles[i3]);
            } else if (!unusedProfiles.isEmpty()) {
                activeProfiles.push(unusedProfiles.pop());
            }
        }
        Stack<IProfile> reversedActiveProfiles = new Stack<>();
        while (!activeProfiles.empty()) {
            reversedActiveProfiles.push(activeProfiles.pop());
        }
        if (reversedActiveProfiles.isEmpty()) {
            this.mCurrentProfile = null;
        } else {
            this.mCurrentProfile = reversedActiveProfiles.pop();
        }
        if (reversedActiveProfiles.isEmpty()) {
            this.mProfileFirst = null;
        } else {
            this.mProfileFirst = reversedActiveProfiles.pop();
        }
        if (reversedActiveProfiles.isEmpty()) {
            this.mProfileSecond = null;
        } else {
            this.mProfileSecond = reversedActiveProfiles.pop();
        }
        if (reversedActiveProfiles.isEmpty()) {
            this.mProfileThird = null;
        } else {
            this.mProfileThird = reversedActiveProfiles.pop();
        }
    }

    protected boolean switchProfiles(IProfile newSelection) {
        if (newSelection == null) {
            return false;
        }
        if (this.mCurrentProfile == newSelection) {
            return true;
        }
        if (this.mAlternativeProfileHeaderSwitching) {
            int prevSelection = -1;
            if (this.mProfileFirst == newSelection) {
                prevSelection = 1;
            } else if (this.mProfileSecond == newSelection) {
                prevSelection = 2;
            } else if (this.mProfileThird == newSelection) {
                prevSelection = 3;
            }
            IProfile tmp = this.mCurrentProfile;
            this.mCurrentProfile = newSelection;
            if (prevSelection == 1) {
                this.mProfileFirst = tmp;
            } else if (prevSelection == 2) {
                this.mProfileSecond = tmp;
            } else if (prevSelection == 3) {
                this.mProfileThird = tmp;
            }
        } else if (this.mProfiles != null) {
            ArrayList<IProfile> previousActiveProfiles = new ArrayList<>(Arrays.asList(this.mCurrentProfile, this.mProfileFirst, this.mProfileSecond, this.mProfileThird));
            if (previousActiveProfiles.contains(newSelection)) {
                int position = -1;
                int i = 0;
                while (true) {
                    if (i >= 4) {
                        break;
                    }
                    if (previousActiveProfiles.get(i) != newSelection) {
                        i++;
                    } else {
                        position = i;
                        break;
                    }
                }
                if (position != -1) {
                    previousActiveProfiles.remove(position);
                    previousActiveProfiles.add(0, newSelection);
                    this.mCurrentProfile = previousActiveProfiles.get(0);
                    this.mProfileFirst = previousActiveProfiles.get(1);
                    this.mProfileSecond = previousActiveProfiles.get(2);
                    this.mProfileThird = previousActiveProfiles.get(3);
                }
            } else {
                this.mProfileThird = this.mProfileSecond;
                this.mProfileSecond = this.mProfileFirst;
                this.mProfileFirst = this.mCurrentProfile;
                this.mCurrentProfile = newSelection;
            }
        }
        buildProfiles();
        return false;
    }

    protected void buildProfiles() {
        this.mCurrentProfileView.setVisibility(4);
        this.mAccountHeaderTextSection.setVisibility(4);
        this.mAccountSwitcherArrow.setVisibility(4);
        this.mProfileFirstView.setVisibility(4);
        this.mProfileFirstView.setOnClickListener(null);
        this.mProfileSecondView.setVisibility(4);
        this.mProfileSecondView.setOnClickListener(null);
        this.mProfileThirdView.setVisibility(4);
        this.mProfileThirdView.setOnClickListener(null);
        handleSelectionView(this.mCurrentProfile, true);
        if (this.mCurrentProfile != null) {
            if (this.mProfileImagesVisible) {
                setImageOrPlaceholder(this.mCurrentProfileView, this.mCurrentProfile.getIcon(), this.mCurrentProfile.getIconBitmap(), this.mCurrentProfile.getIconUri());
                if (this.mProfileImagesClickable) {
                    this.mCurrentProfileView.setOnClickListener(this.onProfileClickListener);
                    this.mCurrentProfileView.disableTouchFeedback(false);
                } else {
                    this.mCurrentProfileView.disableTouchFeedback(true);
                }
                this.mCurrentProfileView.setVisibility(0);
            } else if (this.mCompactStyle) {
                this.mCurrentProfileView.setVisibility(8);
            }
            this.mAccountHeaderTextSection.setVisibility(0);
            handleSelectionView(this.mCurrentProfile, true);
            this.mAccountSwitcherArrow.setVisibility(0);
            this.mCurrentProfileView.setTag(R.id.profile_header, this.mCurrentProfile);
            this.mCurrentProfileName.setText(this.mCurrentProfile.getName());
            this.mCurrentProfileEmail.setText(this.mCurrentProfile.getEmail());
            if (this.mProfileFirst != null && this.mProfileImagesVisible) {
                setImageOrPlaceholder(this.mProfileFirstView, this.mProfileFirst.getIcon(), this.mProfileFirst.getIconBitmap(), this.mProfileFirst.getIconUri());
                this.mProfileFirstView.setTag(R.id.profile_header, this.mProfileFirst);
                if (this.mProfileImagesClickable) {
                    this.mProfileFirstView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileFirstView.disableTouchFeedback(false);
                } else {
                    this.mProfileFirstView.disableTouchFeedback(true);
                }
                this.mProfileFirstView.setVisibility(0);
            }
            if (this.mProfileSecond != null && this.mProfileImagesVisible) {
                setImageOrPlaceholder(this.mProfileSecondView, this.mProfileSecond.getIcon(), this.mProfileSecond.getIconBitmap(), this.mProfileSecond.getIconUri());
                this.mProfileSecondView.setTag(R.id.profile_header, this.mProfileSecond);
                if (this.mProfileImagesClickable) {
                    this.mProfileSecondView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileSecondView.disableTouchFeedback(false);
                } else {
                    this.mProfileSecondView.disableTouchFeedback(true);
                }
                this.mProfileSecondView.setVisibility(0);
                alignParentLayoutParam(this.mProfileFirstView, 0);
            } else {
                alignParentLayoutParam(this.mProfileFirstView, 1);
            }
            if (this.mProfileThird != null && this.mThreeSmallProfileImages && this.mProfileImagesVisible) {
                setImageOrPlaceholder(this.mProfileThirdView, this.mProfileThird.getIcon(), this.mProfileThird.getIconBitmap(), this.mProfileThird.getIconUri());
                this.mProfileThirdView.setTag(R.id.profile_header, this.mProfileThird);
                if (this.mProfileImagesClickable) {
                    this.mProfileThirdView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileThirdView.disableTouchFeedback(false);
                } else {
                    this.mProfileThirdView.disableTouchFeedback(true);
                }
                this.mProfileThirdView.setVisibility(0);
                alignParentLayoutParam(this.mProfileSecondView, 0);
            } else {
                alignParentLayoutParam(this.mProfileSecondView, 1);
            }
        } else if (this.mProfiles != null && this.mProfiles.size() > 0) {
            IProfile profile = this.mProfiles.get(0);
            this.mAccountHeaderTextSection.setTag(R.id.profile_header, profile);
            this.mAccountHeaderTextSection.setVisibility(0);
            handleSelectionView(this.mCurrentProfile, true);
            this.mAccountSwitcherArrow.setVisibility(0);
            this.mCurrentProfileName.setText(profile.getName());
            this.mCurrentProfileEmail.setText(profile.getEmail());
        }
        if (!this.mSelectionFirstLineShown) {
            this.mCurrentProfileName.setVisibility(8);
        }
        if (!TextUtils.isEmpty(this.mSelectionFirstLine)) {
            this.mCurrentProfileName.setText(this.mSelectionFirstLine);
            this.mAccountHeaderTextSection.setVisibility(0);
        }
        if (!this.mSelectionSecondLineShown) {
            this.mCurrentProfileEmail.setVisibility(8);
        }
        if (!TextUtils.isEmpty(this.mSelectionSecondLine)) {
            this.mCurrentProfileEmail.setText(this.mSelectionSecondLine);
            this.mAccountHeaderTextSection.setVisibility(0);
        }
        if (!this.mSelectionListEnabled) {
            this.mAccountSwitcherArrow.setVisibility(4);
            handleSelectionView(null, false);
        }
        if (!this.mSelectionListEnabledForSingleProfile && this.mProfileFirst == null && (this.mProfiles == null || this.mProfiles.size() == 1)) {
            this.mAccountSwitcherArrow.setVisibility(4);
            handleSelectionView(null, false);
        }
        if (this.mOnAccountHeaderSelectionViewClickListener != null) {
            handleSelectionView(this.mCurrentProfile, true);
        }
    }

    private void alignParentLayoutParam(View view, int add) {
        RelativeLayout.LayoutParams lp = (RelativeLayout.LayoutParams) view.getLayoutParams();
        lp.addRule(11, add);
        if (Build.VERSION.SDK_INT >= 17) {
            lp.addRule(21, add);
        }
        view.setLayoutParams(lp);
    }

    private void setImageOrPlaceholder(ImageView iv, Drawable d, Bitmap b, Uri uri) {
        if (uri != null) {
            iv.setImageDrawable(UIUtils.getPlaceHolder(iv.getContext()));
            iv.setImageURI(uri);
        } else if (d == null && b == null) {
            iv.setImageDrawable(UIUtils.getPlaceHolder(iv.getContext()));
        } else if (b == null) {
            iv.setImageDrawable(d);
        } else {
            iv.setImageBitmap(b);
        }
    }

    protected void onProfileClick(View v, boolean current) {
        IProfile profile = (IProfile) v.getTag(R.id.profile_header);
        switchProfiles(profile);
        boolean consumed = false;
        if (this.mOnAccountHeaderListener != null) {
            consumed = this.mOnAccountHeaderListener.onProfileChanged(v, profile, current);
        }
        if (!consumed) {
            resetDrawerContent(v.getContext());
            new Handler().postDelayed(new Runnable() { // from class: com.mikepenz.materialdrawer.accountswitcher.AccountHeaderBuilder.3
                @Override // java.lang.Runnable
                public void run() {
                    if (AccountHeaderBuilder.this.mDrawer != null) {
                        AccountHeaderBuilder.this.mDrawer.closeDrawer();
                    }
                }
            }, 200L);
        }
    }

    protected int getCurrentSelection() {
        if (this.mCurrentProfile != null && this.mProfiles != null) {
            int i = 0;
            Iterator<IProfile> it = this.mProfiles.iterator();
            while (it.hasNext()) {
                IProfile profile = it.next();
                if (profile == this.mCurrentProfile) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        return -1;
    }

    protected void toggleSelectionList(Context ctx) {
        if (this.mDrawer != null) {
            if (this.mDrawer.switchedDrawerContent()) {
                resetDrawerContent(ctx);
                this.mSelectionListShown = false;
            } else {
                buildDrawerSelectionList();
                this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(ctx, GoogleMaterial.Icon.gmd_arrow_drop_up).sizeDp(24).paddingDp(6).color(this.mTextColor));
                this.mSelectionListShown = true;
            }
        }
    }

    protected void buildDrawerSelectionList() {
        int selectedPosition = -1;
        int position = 0;
        ArrayList<IDrawerItem> profileDrawerItems = new ArrayList<>();
        if (this.mProfiles != null) {
            Iterator<IProfile> it = this.mProfiles.iterator();
            while (it.hasNext()) {
                IProfile profile = it.next();
                if (profile == this.mCurrentProfile) {
                    if (!this.mCurrentHiddenInList) {
                        selectedPosition = position;
                    }
                }
                if (profile instanceof IDrawerItem) {
                    profileDrawerItems.add((IDrawerItem) profile);
                }
                position++;
            }
        }
        this.mDrawer.switchDrawerContent(this.onDrawerItemClickListener, profileDrawerItems, selectedPosition);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetDrawerContent(Context ctx) {
        this.mDrawer.resetDrawerContent();
        this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(ctx, GoogleMaterial.Icon.gmd_arrow_drop_down).sizeDp(24).paddingDp(6).color(this.mTextColor));
    }

    protected void updateHeaderAndList() {
        calculateProfiles();
        buildProfiles();
        if (this.mSelectionListShown) {
            buildDrawerSelectionList();
        }
    }
}
