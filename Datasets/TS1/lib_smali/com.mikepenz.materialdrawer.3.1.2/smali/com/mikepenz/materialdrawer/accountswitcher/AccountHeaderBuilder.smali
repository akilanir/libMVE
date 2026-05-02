.class public Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"


# instance fields
.field protected mAccountHeader:Landroid/view/View;

.field protected mAccountHeaderBackground:Landroid/widget/ImageView;

.field protected mAccountHeaderContainer:Landroid/view/View;

.field protected mAccountHeaderTextSection:Landroid/view/View;

.field protected mAccountHeaderTextSectionBackgroundResource:I

.field protected mAccountSwitcherArrow:Landroid/widget/ImageView;

.field protected mActivity:Landroid/app/Activity;

.field protected mAlternativeProfileHeaderSwitching:Z

.field protected mCloseDrawerOnProfileListClick:Z

.field protected mCompactStyle:Z

.field protected mCurrentHiddenInList:Z

.field protected mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

.field protected mCurrentProfileEmail:Landroid/widget/TextView;

.field protected mCurrentProfileName:Landroid/widget/TextView;

.field protected mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field protected mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

.field protected mEmailTypeface:Landroid/graphics/Typeface;

.field protected mHeaderBackground:Landroid/graphics/drawable/Drawable;

.field protected mHeaderBackgroundRes:I

.field protected mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

.field protected mHeightDp:I

.field protected mHeightPx:I

.field protected mHeightRes:I

.field protected mNameTypeface:Landroid/graphics/Typeface;

.field protected mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

.field protected mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;

.field protected mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

.field protected mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field protected mProfileImagesClickable:Z

.field protected mProfileImagesVisible:Z

.field protected mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

.field protected mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field protected mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

.field protected mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field protected mProfiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;",
            ">;"
        }
    .end annotation
.end field

.field protected mResetDrawerOnProfileListClick:Z

.field protected mSavedInstance:Landroid/os/Bundle;

.field protected mSelectionFirstLine:Ljava/lang/String;

.field protected mSelectionFirstLineShown:Z

.field protected mSelectionListEnabled:Z

.field protected mSelectionListEnabledForSingleProfile:Z

.field protected mSelectionListShown:Z

.field protected mSelectionSecondLine:Ljava/lang/String;

.field protected mSelectionSecondLineShown:Z

.field protected mTextColor:I

.field protected mTextColorRes:I

.field protected mThreeSmallProfileImages:Z

.field protected mTranslucentStatusBar:Z

.field protected mTypeface:Landroid/graphics/Typeface;

.field private onCurrentProfileClickListener:Landroid/view/View$OnClickListener;

.field private onDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

.field private onProfileClickListener:Landroid/view/View$OnClickListener;

.field private onSelectionClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    const/4 v0, 0x1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListShown:Z

    .line 61
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    .line 78
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    .line 138
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightPx:I

    .line 139
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightDp:I

    .line 140
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightRes:I

    .line 177
    iput v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    .line 178
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColorRes:I

    .line 203
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    .line 217
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 218
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    .line 286
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    .line 300
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackground:Landroid/graphics/drawable/Drawable;

    .line 301
    iput v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundRes:I

    .line 326
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    .line 340
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    .line 354
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Z

    .line 368
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    .line 382
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    .line 396
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    .line 410
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    .line 438
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    .line 452
    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabled:Z

    .line 1090
    new-instance v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$1;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$1;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onCurrentProfileClickListener:Landroid/view/View$OnClickListener;

    .line 1100
    new-instance v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$2;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    .line 1152
    new-instance v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$4;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$4;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    .line 1216
    new-instance v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;Landroid/content/Context;)V
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    return-void
.end method

.method private alignParentLayoutParam(Landroid/view/View;I)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "add"    # I

    .prologue
    .line 1058
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1059
    .local v0, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xb

    invoke-virtual {v0, v1, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1060
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_16

    .line 1061
    const/16 v1, 0x15

    invoke-virtual {v0, v1, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 1063
    :cond_16
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1064
    return-void
.end method

.method private handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V
    .registers 6
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .param p2, "on"    # Z

    .prologue
    const/16 v2, 0x15

    const/4 v1, 0x0

    .line 609
    if-eqz p2, :cond_41

    .line 610
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_2b

    .line 611
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 612
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 613
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 628
    :goto_2a
    return-void

    .line 615
    :cond_2b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    iget v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 616
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 617
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_2a

    .line 620
    :cond_41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_52

    .line 621
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 622
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2a

    .line 624
    :cond_52
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 625
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2a
.end method

.method private resetDrawerContent(Landroid/content/Context;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1254
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/Drawer;->resetDrawerContent()V

    .line 1255
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v2, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->gmd_arrow_drop_down:Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    invoke-direct {v1, p1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    const/16 v2, 0x18

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1256
    return-void
.end method

.method private setHeaderHeight(I)V
    .registers 7
    .param p1, "height"    # I

    .prologue
    .line 580
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    if-eqz v3, :cond_39

    .line 581
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 582
    .local v2, "params":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v2, :cond_13

    .line 583
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 584
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 587
    :cond_13
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 588
    .local v0, "accountHeader":Landroid/view/View;
    if-eqz v0, :cond_26

    .line 589
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 590
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 591
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 594
    :cond_26
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_background:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 595
    .local v1, "accountHeaderBackground":Landroid/view/View;
    if-eqz v1, :cond_39

    .line 596
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 597
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 598
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 601
    .end local v0    # "accountHeader":Landroid/view/View;
    .end local v1    # "accountHeaderBackground":Landroid/view/View;
    .end local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_39
    return-void
.end method

.method private setImageOrPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Landroid/net/Uri;)V
    .registers 6
    .param p1, "iv"    # Landroid/widget/ImageView;
    .param p2, "d"    # Landroid/graphics/drawable/Drawable;
    .param p3, "b"    # Landroid/graphics/Bitmap;
    .param p4, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1075
    if-eqz p4, :cond_11

    .line 1076
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1077
    invoke-virtual {p1, p4}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 1085
    :goto_10
    return-void

    .line 1078
    :cond_11
    if-nez p2, :cond_21

    if-nez p3, :cond_21

    .line 1079
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_10

    .line 1080
    :cond_21
    if-nez p3, :cond_27

    .line 1081
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_10

    .line 1083
    :cond_27
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_10
.end method


# virtual methods
.method public varargs addProfiles([Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 3
    .param p1, "profiles"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 524
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 525
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 528
    :cond_b
    if-eqz p1, :cond_12

    .line 529
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 531
    :cond_12
    return-object p0
.end method

.method public build()Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;
    .registers 11

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 637
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    if-nez v3, :cond_a

    .line 638
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->withAccountHeader(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    .line 642
    :cond_a
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    .line 645
    const/4 v0, -0x1

    .line 646
    .local v0, "height":I
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightPx:I

    if-eq v3, v7, :cond_15d

    .line 647
    iget v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightPx:I

    .line 671
    :cond_1b
    :goto_1b
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    if-eqz v3, :cond_35

    .line 672
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v8, v4, v8, v8}, Landroid/view/View;->setPadding(IIII)V

    .line 674
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v3, :cond_35

    .line 675
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v3

    add-int/2addr v0, v3

    .line 680
    :cond_35
    invoke-direct {p0, v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->setHeaderHeight(I)V

    .line 683
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_background:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    .line 685
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_1b9

    .line 686
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 691
    :cond_4f
    :goto_4f
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v3, :cond_5a

    .line 692
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 696
    :cond_5a
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    if-nez v3, :cond_1c6

    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColorRes:I

    if-eq v3, v7, :cond_1c6

    .line 697
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColorRes:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    .line 703
    :cond_70
    :goto_70
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v3, :cond_1d8

    .line 704
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    .line 709
    :goto_78
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v3

    iput v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    .line 710
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v3, v9}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 713
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_text_switcher:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    .line 714
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v4, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    sget-object v6, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->gmd_arrow_drop_down:Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    invoke-direct {v4, v5, v6}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    const/16 v5, 0x18

    invoke-virtual {v4, v5}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v4

    const/4 v5, 0x6

    invoke-virtual {v4, v5}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v4

    iget v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    invoke-virtual {v4, v5}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 717
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_current:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 718
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_name:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    .line 719
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_email:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    .line 722
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    if-eqz v3, :cond_1e4

    .line 723
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 728
    :cond_df
    :goto_df
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    if-eqz v3, :cond_1f1

    .line 729
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 734
    :cond_ea
    :goto_ea
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 735
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 737
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_small_first:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 738
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_small_second:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 739
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_small_third:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 742
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->calculateProfiles()V

    .line 745
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildProfiles()V

    .line 748
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v3, :cond_149

    .line 749
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v4, "bundle_selection_header"

    invoke-virtual {v3, v4, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 750
    .local v1, "selection":I
    if-eq v1, v7, :cond_149

    .line 752
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v3, :cond_149

    if-le v1, v7, :cond_149

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_149

    .line 753
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {p0, v3}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    .line 759
    .end local v1    # "selection":I
    :cond_149
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v3, :cond_154

    .line 760
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v3, v4}, Lcom/mikepenz/materialdrawer/Drawer;->setHeader(Landroid/view/View;)V

    .line 764
    :cond_154
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    .line 766
    new-instance v3, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    invoke-direct {v3, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    return-object v3

    .line 648
    :cond_15d
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightDp:I

    if-eq v3, v7, :cond_16c

    .line 649
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightDp:I

    int-to-float v4, v4

    invoke-static {v3, v4}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    goto/16 :goto_1b

    .line 650
    :cond_16c
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightRes:I

    if-eq v3, v7, :cond_17e

    .line 651
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightRes:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto/16 :goto_1b

    .line 653
    :cond_17e
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v3, :cond_190

    .line 654
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_height_compact:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto/16 :goto_1b

    .line 657
    :cond_190
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getOptimalDrawerWidth(Landroid/content/Context;)I

    move-result v3

    int-to-double v3, v3

    const-wide/high16 v5, 0x3fe2000000000000L    # 0.5625

    mul-double/2addr v3, v5

    double-to-int v0, v3

    .line 661
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-ge v3, v4, :cond_1b

    .line 662
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3, v9}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v3

    sub-int v2, v0, v3

    .line 663
    .local v2, "tempHeight":I
    int-to-float v3, v2

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->convertPixelsToDp(FLandroid/content/Context;)F

    move-result v3

    const/high16 v4, 0x430c0000    # 140.0f

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1b

    .line 664
    move v0, v2

    goto/16 :goto_1b

    .line 687
    .end local v2    # "tempHeight":I
    :cond_1b9
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundRes:I

    if-eq v3, v7, :cond_4f

    .line 688
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    iget v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundRes:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4f

    .line 698
    :cond_1c6
    iget v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    if-nez v3, :cond_70

    .line 699
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_header_selection_text:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_header_selection_text:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    iput v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    goto/16 :goto_70

    .line 706
    :cond_1d8
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->account_header_drawer_text_section:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    goto/16 :goto_78

    .line 724
    :cond_1e4
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v3, :cond_df

    .line 725
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto/16 :goto_df

    .line 730
    :cond_1f1
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v3, :cond_ea

    .line 731
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto/16 :goto_ea
.end method

.method protected buildDrawerSelectionList()V
    .registers 7

    .prologue
    .line 1192
    const/4 v3, -0x1

    .line 1193
    .local v3, "selectedPosition":I
    const/4 v0, 0x0

    .line 1194
    .local v0, "position":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1195
    .local v2, "profileDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v4, :cond_32

    .line 1196
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_11
    :goto_11
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1197
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v1, v5, :cond_26

    .line 1198
    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    if-nez v5, :cond_11

    .line 1201
    move v3, v0

    .line 1204
    :cond_26
    instance-of v5, v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    if-eqz v5, :cond_2f

    .line 1205
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1207
    :cond_2f
    add-int/lit8 v0, v0, 0x1

    .line 1208
    goto :goto_11

    .line 1210
    :cond_32
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-virtual {v4, v5, v2, v3}, Lcom/mikepenz/materialdrawer/Drawer;->switchDrawerContent(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;Ljava/util/ArrayList;I)V

    .line 1211
    return-void
.end method

.method protected buildProfiles()V
    .registers 11

    .prologue
    const/16 v9, 0x8

    const/4 v8, 0x0

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 938
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v7}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 939
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 940
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 941
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v7}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 942
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 943
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v7}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 944
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 945
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v7}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 946
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 948
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 950
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_200

    .line 951
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_1d2

    .line 952
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    .line 953
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1cb

    .line 954
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 955
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 959
    :goto_67
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 964
    :cond_6c
    :goto_6c
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 965
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 966
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 967
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 968
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 969
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 971
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_d7

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_d7

    .line 972
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    .line 973
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 974
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1dd

    .line 975
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 976
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 980
    :goto_d2
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 982
    :cond_d7
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_1eb

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_1eb

    .line 983
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    .line 984
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 985
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1e4

    .line 986
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 987
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 991
    :goto_10f
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 992
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->alignParentLayoutParam(Landroid/view/View;I)V

    .line 996
    :goto_119
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_1f9

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    if-eqz v1, :cond_1f9

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_1f9

    .line 997
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIconUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    .line 998
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 999
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1f2

    .line 1000
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1001
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 1005
    :goto_155
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 1006
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->alignParentLayoutParam(Landroid/view/View;I)V

    .line 1020
    :cond_15f
    :goto_15f
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    if-nez v1, :cond_168

    .line 1021
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1023
    :cond_168
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_17c

    .line 1024
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1025
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1027
    :cond_17c
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    if-nez v1, :cond_185

    .line 1028
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-virtual {v1, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1030
    :cond_185
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_199

    .line 1031
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1032
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1036
    :cond_199
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabled:Z

    if-nez v1, :cond_1a5

    .line 1037
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1038
    invoke-direct {p0, v8, v5}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1040
    :cond_1a5
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    if-nez v1, :cond_1c1

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v1, :cond_1c1

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_1b9

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v6, :cond_1c1

    .line 1041
    :cond_1b9
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1042
    invoke-direct {p0, v8, v5}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1046
    :cond_1c1
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    if-eqz v1, :cond_1ca

    .line 1047
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1049
    :cond_1ca
    return-void

    .line 957
    :cond_1cb
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_67

    .line 960
    :cond_1d2
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v1, :cond_6c

    .line 961
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v9}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    goto/16 :goto_6c

    .line 978
    :cond_1dd
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_d2

    .line 989
    :cond_1e4
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_10f

    .line 994
    :cond_1eb
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->alignParentLayoutParam(Landroid/view/View;I)V

    goto/16 :goto_119

    .line 1003
    :cond_1f2
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_155

    .line 1008
    :cond_1f9
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->alignParentLayoutParam(Landroid/view/View;I)V

    goto/16 :goto_15f

    .line 1010
    :cond_200
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_15f

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_15f

    .line 1011
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1012
    .local v0, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    invoke-virtual {v1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 1013
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1014
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v6}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1015
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1016
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1017
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_15f
.end method

.method protected calculateProfiles()V
    .registers 13

    .prologue
    .line 773
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v10, :cond_b

    .line 774
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 777
    :cond_b
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_7a

    .line 778
    const/4 v7, 0x0

    .line 779
    .local v7, "setCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_121

    .line 780
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-le v10, v1, :cond_41

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v10}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->isSelectable()Z

    move-result v10

    if-eqz v10, :cond_41

    .line 781
    if-nez v7, :cond_44

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_44

    .line 782
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 790
    :cond_3f
    :goto_3f
    add-int/lit8 v7, v7, 0x1

    .line 779
    :cond_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 783
    :cond_44
    const/4 v10, 0x1

    if-ne v7, v10, :cond_56

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_56

    .line 784
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 785
    :cond_56
    const/4 v10, 0x2

    if-ne v7, v10, :cond_68

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_68

    .line 786
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 787
    :cond_68
    const/4 v10, 0x3

    if-ne v7, v10, :cond_3f

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_3f

    .line 788
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 797
    .end local v1    # "i":I
    .end local v7    # "setCount":I
    :cond_7a
    const/4 v10, 0x4

    new-array v5, v10, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x3

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    .line 804
    .local v5, "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    const/4 v10, 0x4

    new-array v3, v10, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 805
    .local v3, "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    new-instance v8, Ljava/util/Stack;

    invoke-direct {v8}, Ljava/util/Stack;-><init>()V

    .line 808
    .local v8, "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_9a
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_c7

    .line 809
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 810
    .local v4, "p":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->isSelectable()Z

    move-result v10

    if-eqz v10, :cond_c1

    .line 811
    const/4 v9, 0x0

    .line 812
    .local v9, "used":Z
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_b2
    const/4 v10, 0x4

    if-ge v2, v10, :cond_bc

    .line 813
    aget-object v10, v5, v2

    if-ne v10, v4, :cond_c4

    .line 814
    aput-object v4, v3, v2

    .line 815
    const/4 v9, 0x1

    .line 819
    :cond_bc
    if-nez v9, :cond_c1

    .line 820
    invoke-virtual {v8, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    .end local v2    # "j":I
    .end local v9    # "used":Z
    :cond_c1
    add-int/lit8 v1, v1, 0x1

    goto :goto_9a

    .line 812
    .restart local v2    # "j":I
    .restart local v9    # "used":Z
    :cond_c4
    add-int/lit8 v2, v2, 0x1

    goto :goto_b2

    .line 825
    .end local v2    # "j":I
    .end local v4    # "p":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v9    # "used":Z
    :cond_c7
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 827
    .local v0, "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    const/4 v1, 0x0

    :goto_cd
    const/4 v10, 0x4

    if-ge v1, v10, :cond_ea

    .line 828
    aget-object v10, v3, v1

    if-eqz v10, :cond_dc

    .line 829
    aget-object v10, v3, v1

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 827
    :cond_d9
    :goto_d9
    add-int/lit8 v1, v1, 0x1

    goto :goto_cd

    .line 830
    :cond_dc
    invoke-virtual {v8}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_d9

    .line 831
    invoke-virtual {v8}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d9

    .line 835
    :cond_ea
    new-instance v6, Ljava/util/Stack;

    invoke-direct {v6}, Ljava/util/Stack;-><init>()V

    .line 836
    .local v6, "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :goto_ef
    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v10

    if-nez v10, :cond_fd

    .line 837
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ef

    .line 841
    :cond_fd
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_122

    .line 842
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 846
    :goto_106
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_12b

    .line 847
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 851
    :goto_10f
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_134

    .line 852
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 856
    :goto_118
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_13d

    .line 857
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 861
    .end local v0    # "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .end local v3    # "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v5    # "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v6    # "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .end local v8    # "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :cond_121
    :goto_121
    return-void

    .line 844
    .restart local v0    # "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .restart local v3    # "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .restart local v5    # "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .restart local v6    # "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .restart local v8    # "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :cond_122
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_106

    .line 849
    :cond_12b
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_10f

    .line 854
    :cond_134
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_118

    .line 859
    :cond_13d
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_121
.end method

.method protected getCurrentSelection()I
    .registers 5

    .prologue
    .line 1137
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v2, :cond_23

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_23

    .line 1138
    const/4 v0, 0x0

    .line 1139
    .local v0, "i":I
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1140
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v1, v3, :cond_20

    .line 1146
    .end local v0    # "i":I
    .end local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :goto_1f
    return v0

    .line 1143
    .restart local v0    # "i":I
    .restart local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_20
    add-int/lit8 v0, v0, 0x1

    .line 1144
    goto :goto_f

    .line 1146
    .end local v0    # "i":I
    .end local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_23
    const/4 v0, -0x1

    goto :goto_1f
.end method

.method protected onProfileClick(Landroid/view/View;Z)V
    .registers 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "current"    # Z

    .prologue
    .line 1108
    sget v2, Lcom/mikepenz/materialdrawer/R$id;->profile_header:I

    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1109
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    .line 1111
    const/4 v0, 0x0

    .line 1112
    .local v0, "consumed":Z
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    if-eqz v2, :cond_16

    .line 1113
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    invoke-interface {v2, p1, v1, p2}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    move-result v0

    .line 1116
    :cond_16
    if-nez v0, :cond_2e

    .line 1118
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    .line 1120
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;

    invoke-direct {v3, p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V

    const-wide/16 v4, 0xc8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1129
    :cond_2e
    return-void
.end method

.method protected switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z
    .registers 14
    .param p1, "newSelection"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 870
    if-nez p1, :cond_9

    move v5, v6

    .line 931
    :goto_8
    return v5

    .line 873
    :cond_9
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_f

    move v5, v7

    .line 874
    goto :goto_8

    .line 877
    :cond_f
    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    if-eqz v5, :cond_3c

    .line 878
    const/4 v2, -0x1

    .line 879
    .local v2, "prevSelection":I
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_26

    .line 880
    const/4 v2, 0x1

    .line 887
    :cond_19
    :goto_19
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 888
    .local v4, "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 890
    if-ne v2, v7, :cond_32

    .line 891
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 929
    .end local v2    # "prevSelection":I
    .end local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_21
    :goto_21
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildProfiles()V

    move v5, v6

    .line 931
    goto :goto_8

    .line 881
    .restart local v2    # "prevSelection":I
    :cond_26
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_2c

    .line 882
    const/4 v2, 0x2

    goto :goto_19

    .line 883
    :cond_2c
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_19

    .line 884
    const/4 v2, 0x3

    goto :goto_19

    .line 892
    .restart local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_32
    if-ne v2, v9, :cond_37

    .line 893
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 894
    :cond_37
    if-ne v2, v10, :cond_21

    .line 895
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 898
    .end local v2    # "prevSelection":I
    .end local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_3c
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v5, :cond_21

    .line 899
    new-instance v3, Ljava/util/ArrayList;

    new-array v5, v11, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v6

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v7

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v9

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v10

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 901
    .local v3, "previousActiveProfiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_99

    .line 902
    const/4 v1, -0x1

    .line 904
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_63
    if-ge v0, v11, :cond_6c

    .line 905
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p1, :cond_96

    .line 906
    move v1, v0

    .line 911
    :cond_6c
    const/4 v5, -0x1

    if-eq v1, v5, :cond_21

    .line 912
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 913
    invoke-virtual {v3, v6, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 915
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 916
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 917
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 918
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 904
    :cond_96
    add-int/lit8 v0, v0, 0x1

    goto :goto_63

    .line 921
    .end local v0    # "i":I
    .end local v1    # "position":I
    :cond_99
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 922
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 923
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 924
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto/16 :goto_21
.end method

.method protected toggleSelectionList(Landroid/content/Context;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1172
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_12

    .line 1174
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1175
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    .line 1176
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListShown:Z

    .line 1186
    :cond_12
    :goto_12
    return-void

    .line 1179
    :cond_13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildDrawerSelectionList()V

    .line 1182
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v2, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->gmd_arrow_drop_up:Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    invoke-direct {v1, p1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    const/16 v2, 0x18

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListShown:Z

    goto :goto_12
.end method

.method protected updateHeaderAndList()V
    .registers 2

    .prologue
    .line 1263
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->calculateProfiles()V

    .line 1265
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildProfiles()V

    .line 1267
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListShown:Z

    if-eqz v0, :cond_d

    .line 1268
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildDrawerSelectionList()V

    .line 1270
    :cond_d
    return-void
.end method

.method public withAccountHeader(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 6
    .param p1, "resLayout"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 486
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_e

    .line 487
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    :cond_e
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1e

    .line 491
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, p1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    .line 500
    :goto_1d
    return-object p0

    .line 493
    :cond_1e
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v0, :cond_31

    .line 494
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_compact_header:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    goto :goto_1d

    .line 496
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_header:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    goto :goto_1d
.end method

.method public withAccountHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "accountHeader"    # Landroid/view/View;

    .prologue
    .line 475
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    .line 476
    return-object p0
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    .line 74
    return-object p0
.end method

.method public withAlternativeProfileHeaderSwitching(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "alternativeProfileHeaderSwitching"    # Z

    .prologue
    .line 405
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    .line 406
    return-object p0
.end method

.method public withCloseDrawerOnProfileListClick(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "closeDrawerOnProfileListClick"    # Z

    .prologue
    .line 363
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Z

    .line 364
    return-object p0
.end method

.method public withCompactStyle(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "compactStyle"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCompactStyle:Z

    .line 88
    return-object p0
.end method

.method public withCurrentProfileHiddenInList(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "currentProfileHiddenInList"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    .line 213
    return-object p0
.end method

.method public withDrawer(Lcom/mikepenz/materialdrawer/Drawer;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    .line 557
    return-object p0
.end method

.method public withEmailTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    .line 134
    return-object p0
.end method

.method public withHeaderBackground(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "headerBackgroundRes"    # I

    .prologue
    .line 321
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundRes:I

    .line 322
    return-object p0
.end method

.method public withHeaderBackground(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "headerBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackground:Landroid/graphics/drawable/Drawable;

    .line 311
    return-object p0
.end method

.method public withHeaderBackgroundScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "headerBackgroundScaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 335
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    .line 336
    return-object p0
.end method

.method public withHeightDp(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "heightDp"    # I

    .prologue
    .line 161
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightDp:I

    .line 162
    return-object p0
.end method

.method public withHeightPx(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "heightPx"    # I

    .prologue
    .line 149
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightPx:I

    .line 150
    return-object p0
.end method

.method public withHeightRes(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "heightRes"    # I

    .prologue
    .line 172
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mHeightRes:I

    .line 173
    return-object p0
.end method

.method public withNameTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    .line 121
    return-object p0
.end method

.method public withOnAccountHeaderListener(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "onAccountHeaderListener"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    .prologue
    .line 544
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    .line 545
    return-object p0
.end method

.method public withOnAccountHeaderSelectionViewClickListener(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "onAccountHeaderSelectionViewClickListener"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    .prologue
    .line 433
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    .line 434
    return-object p0
.end method

.method public withProfileImagesClickable(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "profileImagesClickable"    # Z

    .prologue
    .line 391
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesClickable:Z

    .line 392
    return-object p0
.end method

.method public withProfileImagesVisible(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "profileImagesVisible"    # Z

    .prologue
    .line 349
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfileImagesVisible:Z

    .line 350
    return-object p0
.end method

.method public withProfiles(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;",
            ">;)",
            "Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;"
        }
    .end annotation

    .prologue
    .line 513
    .local p1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 514
    return-object p0
.end method

.method public withResetDrawerOnProfileListClick(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "resetDrawerOnProfileListClick"    # Z

    .prologue
    .line 377
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    .line 378
    return-object p0
.end method

.method public withSavedInstance(Landroid/os/Bundle;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 570
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    .line 571
    return-object p0
.end method

.method public withSelectionFirstLine(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLine"    # Ljava/lang/String;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    .line 270
    return-object p0
.end method

.method public withSelectionFirstLineShown(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLineShown"    # Z

    .prologue
    .line 241
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 242
    return-object p0
.end method

.method public withSelectionFistLineShown(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLineShown"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 230
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 231
    return-object p0
.end method

.method public withSelectionListEnabled(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionListEnabled"    # Z

    .prologue
    .line 461
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabled:Z

    .line 462
    return-object p0
.end method

.method public withSelectionListEnabledForSingleProfile(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionListEnabledForSingleProfile"    # Z

    .prologue
    .line 447
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    .line 448
    return-object p0
.end method

.method public withSelectionSecondLine(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionSecondLine"    # Ljava/lang/String;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    .line 282
    return-object p0
.end method

.method public withSelectionSecondLineShown(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionSecondLineShown"    # Z

    .prologue
    .line 252
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    .line 253
    return-object p0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 187
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColor:I

    .line 188
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 198
    iput p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTextColorRes:I

    .line 199
    return-object p0
.end method

.method public withThreeSmallProfileImages(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "threeSmallProfileImages"    # Z

    .prologue
    .line 419
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    .line 420
    return-object p0
.end method

.method public withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "translucentStatusBar"    # Z

    .prologue
    .line 295
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    .line 296
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    .line 108
    return-object p0
.end method
