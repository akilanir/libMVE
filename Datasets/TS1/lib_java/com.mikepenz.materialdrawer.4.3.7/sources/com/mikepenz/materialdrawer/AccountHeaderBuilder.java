package com.mikepenz.materialdrawer;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.materialdrawer.AccountHeader;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.holder.DimenHolder;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.icons.MaterialDrawerFont;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.util.DrawerImageLoader;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialdrawer.util.IdDistributor;
import com.mikepenz.materialdrawer.view.BezelImageView;
import com.mikepenz.materialize.util.UIUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Stack;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/AccountHeaderBuilder.class */
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
    protected DimenHolder mHeight;
    protected ColorHolder mTextColor;
    protected String mSelectionFirstLine;
    protected String mSelectionSecondLine;
    protected ImageHolder mHeaderBackground;
    protected AccountHeader.OnAccountHeaderSelectionViewClickListener mOnAccountHeaderSelectionViewClickListener;
    protected View mAccountHeaderContainer;
    protected ArrayList<IProfile> mProfiles;
    protected AccountHeader.OnAccountHeaderListener mOnAccountHeaderListener;
    protected Drawer mDrawer;
    protected Bundle mSavedInstance;
    protected boolean mSelectionListShown = false;
    protected int mAccountHeaderTextSectionBackgroundResource = -1;
    protected boolean mCompactStyle = false;
    protected boolean mCurrentHiddenInList = false;
    protected boolean mSelectionFirstLineShown = true;
    protected boolean mSelectionSecondLineShown = true;
    protected boolean mDividerBelowHeader = true;
    protected boolean mTranslucentStatusBar = true;
    protected ImageView.ScaleType mHeaderBackgroundScaleType = null;
    protected boolean mProfileImagesVisible = true;
    protected boolean mOnlyMainProfileImageVisible = false;
    protected Boolean mCloseDrawerOnProfileListClick = null;
    protected boolean mResetDrawerOnProfileListClick = true;
    protected boolean mProfileImagesClickable = true;
    protected boolean mAlternativeProfileHeaderSwitching = false;
    protected boolean mThreeSmallProfileImages = false;
    protected boolean mSelectionListEnabledForSingleProfile = true;
    protected boolean mSelectionListEnabled = true;
    private View.OnClickListener onCurrentProfileClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.AccountHeaderBuilder.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AccountHeaderBuilder.this.onProfileClick(v, true);
        }
    };
    private View.OnClickListener onProfileClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.AccountHeaderBuilder.2
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            AccountHeaderBuilder.this.onProfileClick(v, false);
        }
    };
    private View.OnClickListener onSelectionClickListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.AccountHeaderBuilder.4
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            boolean consumed = false;
            if (AccountHeaderBuilder.this.mOnAccountHeaderSelectionViewClickListener != null) {
                consumed = AccountHeaderBuilder.this.mOnAccountHeaderSelectionViewClickListener.onClick(v, (IProfile) v.getTag(R.id.material_drawer_profile_header));
            }
            if (AccountHeaderBuilder.this.mAccountSwitcherArrow.getVisibility() == 0 && !consumed) {
                AccountHeaderBuilder.this.toggleSelectionList(v.getContext());
            }
        }
    };
    private Drawer.OnDrawerItemClickListener onDrawerItemClickListener = new Drawer.OnDrawerItemClickListener() { // from class: com.mikepenz.materialdrawer.AccountHeaderBuilder.5
        @Override // com.mikepenz.materialdrawer.Drawer.OnDrawerItemClickListener
        public boolean onItemClick(View view, int position, IDrawerItem drawerItem) {
            boolean isCurrentSelectedProfile;
            if (drawerItem != null && (drawerItem instanceof IProfile) && drawerItem.isSelectable()) {
                isCurrentSelectedProfile = AccountHeaderBuilder.this.switchProfiles((IProfile) drawerItem);
            } else {
                isCurrentSelectedProfile = false;
            }
            if (AccountHeaderBuilder.this.mResetDrawerOnProfileListClick) {
                AccountHeaderBuilder.this.mDrawer.setOnDrawerItemClickListener(null);
            }
            if (AccountHeaderBuilder.this.mResetDrawerOnProfileListClick && AccountHeaderBuilder.this.mDrawer != null && view != null && view.getContext() != null) {
                AccountHeaderBuilder.this.resetDrawerContent(view.getContext());
            }
            boolean consumed = false;
            if (drawerItem != null && (drawerItem instanceof IProfile) && AccountHeaderBuilder.this.mOnAccountHeaderListener != null) {
                consumed = AccountHeaderBuilder.this.mOnAccountHeaderListener.onProfileChanged(view, (IProfile) drawerItem, isCurrentSelectedProfile);
            }
            if (AccountHeaderBuilder.this.mCloseDrawerOnProfileListClick != null) {
                return !AccountHeaderBuilder.this.mCloseDrawerOnProfileListClick.booleanValue();
            }
            return consumed;
        }
    };

    public AccountHeaderBuilder withActivity(@NonNull Activity activity) {
        this.mActivity = activity;
        return this;
    }

    public AccountHeaderBuilder withCompactStyle(boolean compactStyle) {
        this.mCompactStyle = compactStyle;
        return this;
    }

    public AccountHeaderBuilder withTypeface(@NonNull Typeface typeface) {
        this.mTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withNameTypeface(@NonNull Typeface typeface) {
        this.mNameTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withEmailTypeface(@NonNull Typeface typeface) {
        this.mEmailTypeface = typeface;
        return this;
    }

    public AccountHeaderBuilder withHeightPx(int heightPx) {
        this.mHeight = DimenHolder.fromPixel(heightPx);
        return this;
    }

    public AccountHeaderBuilder withHeightDp(int heightDp) {
        this.mHeight = DimenHolder.fromDp(heightDp);
        return this;
    }

    public AccountHeaderBuilder withHeightRes(@DimenRes int heightRes) {
        this.mHeight = DimenHolder.fromResource(heightRes);
        return this;
    }

    public AccountHeaderBuilder withTextColor(@ColorInt int textColor) {
        this.mTextColor = ColorHolder.fromColor(textColor);
        return this;
    }

    public AccountHeaderBuilder withTextColorRes(@ColorRes int textColorRes) {
        this.mTextColor = ColorHolder.fromColorRes(textColorRes);
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

    public AccountHeaderBuilder withDividerBelowHeader(boolean dividerBelowHeader) {
        this.mDividerBelowHeader = dividerBelowHeader;
        return this;
    }

    public AccountHeaderBuilder withTranslucentStatusBar(boolean translucentStatusBar) {
        this.mTranslucentStatusBar = translucentStatusBar;
        return this;
    }

    public AccountHeaderBuilder withHeaderBackground(Drawable headerBackground) {
        this.mHeaderBackground = new ImageHolder(headerBackground);
        return this;
    }

    public AccountHeaderBuilder withHeaderBackground(@DrawableRes int headerBackgroundRes) {
        this.mHeaderBackground = new ImageHolder(headerBackgroundRes);
        return this;
    }

    public AccountHeaderBuilder withHeaderBackground(ImageHolder headerBackground) {
        this.mHeaderBackground = headerBackground;
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

    public AccountHeaderBuilder withOnlyMainProfileImageVisible(boolean onlyMainProfileImageVisible) {
        this.mOnlyMainProfileImageVisible = onlyMainProfileImageVisible;
        return this;
    }

    public AccountHeaderBuilder withCloseDrawerOnProfileListClick(boolean closeDrawerOnProfileListClick) {
        this.mCloseDrawerOnProfileListClick = Boolean.valueOf(closeDrawerOnProfileListClick);
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

    public AccountHeaderBuilder withAccountHeader(@NonNull View accountHeader) {
        this.mAccountHeaderContainer = accountHeader;
        return this;
    }

    public AccountHeaderBuilder withAccountHeader(@LayoutRes int resLayout) {
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

    public AccountHeaderBuilder withProfiles(@NonNull ArrayList<IProfile> profiles) {
        this.mProfiles = IdDistributor.checkIds(profiles);
        return this;
    }

    public AccountHeaderBuilder addProfiles(@NonNull IProfile... profiles) {
        if (this.mProfiles == null) {
            this.mProfiles = new ArrayList<>();
        }
        Collections.addAll(this.mProfiles, IdDistributor.checkIds(profiles));
        return this;
    }

    public AccountHeaderBuilder withOnAccountHeaderListener(@NonNull AccountHeader.OnAccountHeaderListener onAccountHeaderListener) {
        this.mOnAccountHeaderListener = onAccountHeaderListener;
        return this;
    }

    public AccountHeaderBuilder withDrawer(@NonNull Drawer drawer) {
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
            View accountHeader = this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header);
            if (accountHeader != null) {
                ViewGroup.LayoutParams params2 = accountHeader.getLayoutParams();
                params2.height = height;
                accountHeader.setLayoutParams(params2);
            }
            View accountHeaderBackground = this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header_background);
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
                this.mAccountHeaderContainer.setTag(R.id.material_drawer_profile_header, profile);
                return;
            } else {
                this.mAccountHeaderTextSection.setBackgroundResource(this.mAccountHeaderTextSectionBackgroundResource);
                this.mAccountHeaderTextSection.setOnClickListener(this.onSelectionClickListener);
                this.mAccountHeaderTextSection.setTag(R.id.material_drawer_profile_header, profile);
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
        this.mAccountHeader = this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header);
        if (this.mHeight != null) {
            height = this.mHeight.asPixel(this.mActivity);
        } else if (this.mCompactStyle) {
            height = this.mActivity.getResources().getDimensionPixelSize(R.dimen.material_drawer_account_header_height_compact);
        } else {
            height = (int) (DrawerUIUtils.getOptimalDrawerWidth(this.mActivity) * 0.5625d);
            if (Build.VERSION.SDK_INT < 19) {
                int tempHeight = height - UIUtils.getStatusBarHeight(this.mActivity, true);
                if (UIUtils.convertPixelsToDp(tempHeight, this.mActivity) > 140.0f) {
                    height = tempHeight;
                }
            }
        }
        if (this.mTranslucentStatusBar) {
            this.mAccountHeader.setPadding(this.mAccountHeader.getPaddingLeft(), this.mAccountHeader.getPaddingTop() + UIUtils.getStatusBarHeight(this.mActivity), this.mAccountHeader.getPaddingRight(), this.mAccountHeader.getPaddingBottom());
            if (this.mCompactStyle) {
                height += UIUtils.getStatusBarHeight(this.mActivity);
            }
        }
        setHeaderHeight(height);
        this.mAccountHeaderBackground = (ImageView) this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header_background);
        ImageHolder.applyTo(this.mHeaderBackground, this.mAccountHeaderBackground, DrawerImageLoader.Tags.ACCOUNT_HEADER.name());
        if (this.mHeaderBackgroundScaleType != null) {
            this.mAccountHeaderBackground.setScaleType(this.mHeaderBackgroundScaleType);
        }
        int textColor = ColorHolder.color(this.mTextColor, this.mActivity, R.attr.material_drawer_header_selection_text, R.color.material_drawer_header_selection_text);
        if (this.mCompactStyle) {
            this.mAccountHeaderTextSection = this.mAccountHeader;
        } else {
            this.mAccountHeaderTextSection = this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header_text_section);
        }
        this.mAccountHeaderTextSectionBackgroundResource = DrawerUIUtils.getSelectableBackground(this.mActivity);
        handleSelectionView(this.mCurrentProfile, true);
        this.mAccountSwitcherArrow = (ImageView) this.mAccountHeaderContainer.findViewById(R.id.material_drawer_account_header_text_switcher);
        this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(this.mActivity, MaterialDrawerFont.Icon.mdf_arrow_drop_down).sizeRes(R.dimen.material_drawer_account_header_dropdown).paddingRes(R.dimen.material_drawer_account_header_dropdown_padding).color(textColor));
        this.mCurrentProfileView = (BezelImageView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_current);
        this.mCurrentProfileName = (TextView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_name);
        this.mCurrentProfileEmail = (TextView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_email);
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
        this.mCurrentProfileName.setTextColor(textColor);
        this.mCurrentProfileEmail.setTextColor(textColor);
        this.mProfileFirstView = (BezelImageView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_small_first);
        this.mProfileSecondView = (BezelImageView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_small_second);
        this.mProfileThirdView = (BezelImageView) this.mAccountHeader.findViewById(R.id.material_drawer_account_header_small_third);
        calculateProfiles();
        buildProfiles();
        if (this.mSavedInstance != null && (selection = this.mSavedInstance.getInt("bundle_selection_header", -1)) != -1 && this.mProfiles != null && selection > -1 && selection < this.mProfiles.size()) {
            switchProfiles(this.mProfiles.get(selection));
        }
        if (this.mDrawer != null) {
            this.mDrawer.setHeader(this.mAccountHeaderContainer, this.mDividerBelowHeader);
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
        this.mProfileFirstView.setVisibility(8);
        this.mProfileFirstView.setOnClickListener(null);
        this.mProfileSecondView.setVisibility(8);
        this.mProfileSecondView.setOnClickListener(null);
        this.mProfileThirdView.setVisibility(8);
        this.mProfileThirdView.setOnClickListener(null);
        this.mCurrentProfileName.setText(BuildConfig.FLAVOR);
        this.mCurrentProfileEmail.setText(BuildConfig.FLAVOR);
        handleSelectionView(this.mCurrentProfile, true);
        if (this.mCurrentProfile != null) {
            if (this.mProfileImagesVisible || this.mOnlyMainProfileImageVisible) {
                setImageOrPlaceholder(this.mCurrentProfileView, this.mCurrentProfile.getIcon());
                if (this.mProfileImagesClickable) {
                    this.mCurrentProfileView.setOnClickListener(this.onProfileClickListener);
                    this.mCurrentProfileView.disableTouchFeedback(false);
                } else {
                    this.mCurrentProfileView.disableTouchFeedback(true);
                }
                this.mCurrentProfileView.setVisibility(0);
                this.mCurrentProfileView.invalidate();
            } else if (this.mCompactStyle) {
                this.mCurrentProfileView.setVisibility(8);
            }
            this.mAccountHeaderTextSection.setVisibility(0);
            handleSelectionView(this.mCurrentProfile, true);
            this.mAccountSwitcherArrow.setVisibility(0);
            this.mCurrentProfileView.setTag(R.id.material_drawer_profile_header, this.mCurrentProfile);
            StringHolder.applyTo(this.mCurrentProfile.getName(), this.mCurrentProfileName);
            StringHolder.applyTo(this.mCurrentProfile.getEmail(), this.mCurrentProfileEmail);
            if (this.mProfileFirst != null && this.mProfileImagesVisible && !this.mOnlyMainProfileImageVisible) {
                setImageOrPlaceholder(this.mProfileFirstView, this.mProfileFirst.getIcon());
                this.mProfileFirstView.setTag(R.id.material_drawer_profile_header, this.mProfileFirst);
                if (this.mProfileImagesClickable) {
                    this.mProfileFirstView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileFirstView.disableTouchFeedback(false);
                } else {
                    this.mProfileFirstView.disableTouchFeedback(true);
                }
                this.mProfileFirstView.setVisibility(0);
                this.mProfileFirstView.invalidate();
            }
            if (this.mProfileSecond != null && this.mProfileImagesVisible && !this.mOnlyMainProfileImageVisible) {
                setImageOrPlaceholder(this.mProfileSecondView, this.mProfileSecond.getIcon());
                this.mProfileSecondView.setTag(R.id.material_drawer_profile_header, this.mProfileSecond);
                if (this.mProfileImagesClickable) {
                    this.mProfileSecondView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileSecondView.disableTouchFeedback(false);
                } else {
                    this.mProfileSecondView.disableTouchFeedback(true);
                }
                this.mProfileSecondView.setVisibility(0);
                this.mProfileSecondView.invalidate();
            }
            if (this.mProfileThird != null && this.mThreeSmallProfileImages && this.mProfileImagesVisible && !this.mOnlyMainProfileImageVisible) {
                setImageOrPlaceholder(this.mProfileThirdView, this.mProfileThird.getIcon());
                this.mProfileThirdView.setTag(R.id.material_drawer_profile_header, this.mProfileThird);
                if (this.mProfileImagesClickable) {
                    this.mProfileThirdView.setOnClickListener(this.onProfileClickListener);
                    this.mProfileThirdView.disableTouchFeedback(false);
                } else {
                    this.mProfileThirdView.disableTouchFeedback(true);
                }
                this.mProfileThirdView.setVisibility(0);
                this.mProfileThirdView.invalidate();
            }
        } else if (this.mProfiles != null && this.mProfiles.size() > 0) {
            IProfile profile = this.mProfiles.get(0);
            this.mAccountHeaderTextSection.setTag(R.id.material_drawer_profile_header, profile);
            this.mAccountHeaderTextSection.setVisibility(0);
            handleSelectionView(this.mCurrentProfile, true);
            this.mAccountSwitcherArrow.setVisibility(0);
            if (this.mCurrentProfile != null) {
                StringHolder.applyTo(this.mCurrentProfile.getName(), this.mCurrentProfileName);
                StringHolder.applyTo(this.mCurrentProfile.getEmail(), this.mCurrentProfileEmail);
            }
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

    private void setImageOrPlaceholder(ImageView iv, ImageHolder imageHolder) {
        DrawerImageLoader.getInstance().cancelImage(iv);
        iv.setImageDrawable(DrawerUIUtils.getPlaceHolder(iv.getContext()));
        ImageHolder.applyTo(imageHolder, iv, DrawerImageLoader.Tags.PROFILE.name());
    }

    protected void onProfileClick(View v, boolean current) {
        IProfile profile = (IProfile) v.getTag(R.id.material_drawer_profile_header);
        switchProfiles(profile);
        resetDrawerContent(v.getContext());
        boolean consumed = false;
        if (this.mOnAccountHeaderListener != null) {
            consumed = this.mOnAccountHeaderListener.onProfileChanged(v, profile, current);
        }
        if (!consumed) {
            new Handler().postDelayed(new Runnable() { // from class: com.mikepenz.materialdrawer.AccountHeaderBuilder.3
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
                this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(ctx, MaterialDrawerFont.Icon.mdf_arrow_drop_up).sizeRes(R.dimen.material_drawer_account_header_dropdown).paddingRes(R.dimen.material_drawer_account_header_dropdown_padding).color(ColorHolder.color(this.mTextColor, ctx, R.attr.material_drawer_header_selection_text, R.color.material_drawer_header_selection_text)));
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
                        selectedPosition = position + this.mDrawer.getAdapter().getHeaderOffset();
                    }
                }
                if (profile instanceof IDrawerItem) {
                    ((IDrawerItem) profile).withSetSelected(false);
                    profileDrawerItems.add((IDrawerItem) profile);
                }
                position++;
            }
        }
        this.mDrawer.switchDrawerContent(this.onDrawerItemClickListener, profileDrawerItems, selectedPosition);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetDrawerContent(Context ctx) {
        if (this.mDrawer != null) {
            this.mDrawer.resetDrawerContent();
        }
        this.mAccountSwitcherArrow.setImageDrawable(new IconicsDrawable(ctx, MaterialDrawerFont.Icon.mdf_arrow_drop_down).sizeRes(R.dimen.material_drawer_account_header_dropdown).paddingRes(R.dimen.material_drawer_account_header_dropdown_padding).color(ColorHolder.color(this.mTextColor, ctx, R.attr.material_drawer_header_selection_text, R.color.material_drawer_header_selection_text)));
    }

    protected void updateHeaderAndList() {
        calculateProfiles();
        buildProfiles();
        if (this.mSelectionListShown) {
            buildDrawerSelectionList();
        }
    }
}
