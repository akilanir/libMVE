.class public Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
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

.field protected mCloseDrawerOnProfileListClick:Ljava/lang/Boolean;

.field protected mCompactStyle:Z

.field protected mCurrentHiddenInList:Z

.field protected mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

.field protected mCurrentProfileEmail:Landroid/widget/TextView;

.field protected mCurrentProfileName:Landroid/widget/TextView;

.field protected mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

.field protected mDividerBelowHeader:Z

.field protected mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

.field protected mEmailTypeface:Landroid/graphics/Typeface;

.field protected mHeaderBackground:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

.field protected mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

.field protected mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

.field protected mNameTypeface:Landroid/graphics/Typeface;

.field protected mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

.field protected mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

.field protected mOnlyMainProfileImageVisible:Z

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

.field protected mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

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

    const/4 v1, 0x1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    .line 84
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    .line 206
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    .line 220
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 221
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    .line 289
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDividerBelowHeader:Z

    .line 303
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    .line 353
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    .line 367
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    .line 381
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    .line 395
    iput-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Ljava/lang/Boolean;

    .line 409
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    .line 423
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    .line 437
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    .line 451
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    .line 479
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    .line 493
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabled:Z

    .line 1101
    new-instance v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$1;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$1;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onCurrentProfileClickListener:Landroid/view/View$OnClickListener;

    .line 1111
    new-instance v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$2;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    .line 1163
    new-instance v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    .line 1228
    new-instance v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;Landroid/content/Context;)V
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    return-void
.end method

.method private handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V
    .registers 6
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .param p2, "on"    # Z

    .prologue
    const/16 v2, 0x15

    const/4 v1, 0x0

    .line 649
    if-eqz p2, :cond_41

    .line 650
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_2b

    .line 651
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    invoke-static {v1, v2}, Lcom/mikepenz/materialize/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 652
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 653
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 668
    :goto_2a
    return-void

    .line 655
    :cond_2b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    iget v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 656
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onSelectionClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 657
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_2a

    .line 660
    :cond_41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_52

    .line 661
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 662
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2a

    .line 664
    :cond_52
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 665
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2a
.end method

.method private resetDrawerContent(Landroid/content/Context;)V
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1267
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_9

    .line 1268
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/Drawer;->resetDrawerContent()V

    .line 1270
    :cond_9
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v2, Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;->mdf_arrow_drop_down:Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;

    invoke-direct {v1, p1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown_padding:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_header_selection_text:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_header_selection_text:I

    invoke-static {v2, p1, v3, v4}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1271
    return-void
.end method

.method private setHeaderHeight(I)V
    .registers 7
    .param p1, "height"    # I

    .prologue
    .line 620
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    if-eqz v3, :cond_39

    .line 621
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 622
    .local v2, "params":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v2, :cond_13

    .line 623
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 624
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 627
    :cond_13
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 628
    .local v0, "accountHeader":Landroid/view/View;
    if-eqz v0, :cond_26

    .line 629
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 630
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 631
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 634
    :cond_26
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_background:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 635
    .local v1, "accountHeaderBackground":Landroid/view/View;
    if-eqz v1, :cond_39

    .line 636
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 637
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 638
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 641
    .end local v0    # "accountHeader":Landroid/view/View;
    .end local v1    # "accountHeaderBackground":Landroid/view/View;
    .end local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_39
    return-void
.end method

.method private setImageOrPlaceholder(Landroid/widget/ImageView;Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V
    .registers 4
    .param p1, "iv"    # Landroid/widget/ImageView;
    .param p2, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .prologue
    .line 1091
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->cancelImage(Landroid/widget/ImageView;)V

    .line 1093
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1095
    sget-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->PROFILE:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z

    .line 1096
    return-void
.end method


# virtual methods
.method public varargs addProfiles([Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 4
    .param p1, "profiles"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 565
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 566
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 569
    :cond_b
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 571
    return-object p0
.end method

.method public build()Lcom/mikepenz/materialdrawer/AccountHeader;
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/4 v9, -0x1

    .line 677
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    if-nez v4, :cond_9

    .line 678
    invoke-virtual {p0, v9}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->withAccountHeader(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    .line 682
    :cond_9
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    .line 686
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    if-eqz v4, :cond_16f

    .line 687
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v0

    .line 707
    .local v0, "height":I
    :cond_1f
    :goto_1f
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    if-eqz v4, :cond_52

    .line 708
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v7}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getPaddingRight()I

    move-result v7

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingBottom()I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/view/View;->setPadding(IIII)V

    .line 710
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v4, :cond_52

    .line 711
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v4

    add-int/2addr v0, v4

    .line 716
    :cond_52
    invoke-direct {p0, v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->setHeaderHeight(I)V

    .line 719
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_background:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    .line 721
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackground:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    sget-object v6, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->ACCOUNT_HEADER:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;

    invoke-virtual {v6}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)Z

    .line 723
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    if-eqz v4, :cond_79

    .line 724
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 728
    :cond_79
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_header_selection_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_header_selection_text:I

    invoke-static {v4, v5, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v3

    .line 731
    .local v3, "textColor":I
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v4, :cond_1aa

    .line 732
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    .line 737
    :goto_8d
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v4

    iput v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSectionBackgroundResource:I

    .line 738
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v4, v10}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 741
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_text_switcher:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    .line 742
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v5, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    sget-object v7, Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;->mdf_arrow_drop_down:Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;

    invoke-direct {v5, v6, v7}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    sget v6, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown:I

    invoke-virtual {v5, v6}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown_padding:I

    invoke-virtual {v5, v6}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 745
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_current:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 746
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_name:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    .line 747
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_email:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    .line 750
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    if-eqz v4, :cond_1b6

    .line 751
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 756
    :cond_f3
    :goto_f3
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    if-eqz v4, :cond_1c3

    .line 757
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 762
    :cond_fe
    :goto_fe
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 763
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 765
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_small_first:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 766
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_small_second:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 767
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeader:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_small_third:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    .line 770
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->calculateProfiles()V

    .line 773
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildProfiles()V

    .line 776
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    if-eqz v4, :cond_159

    .line 777
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    const-string v5, "bundle_selection_header"

    invoke-virtual {v4, v5, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 778
    .local v1, "selection":I
    if-eq v1, v9, :cond_159

    .line 780
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v4, :cond_159

    if-le v1, v9, :cond_159

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_159

    .line 781
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {p0, v4}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    .line 787
    .end local v1    # "selection":I
    :cond_159
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v4, :cond_166

    .line 788
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    iget-boolean v6, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDividerBelowHeader:Z

    invoke-virtual {v4, v5, v6}, Lcom/mikepenz/materialdrawer/Drawer;->setHeader(Landroid/view/View;Z)V

    .line 792
    :cond_166
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    .line 794
    new-instance v4, Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-direct {v4, p0}, Lcom/mikepenz/materialdrawer/AccountHeader;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    return-object v4

    .line 689
    .end local v0    # "height":I
    .end local v3    # "textColor":I
    :cond_16f
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v4, :cond_181

    .line 690
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_height_compact:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .restart local v0    # "height":I
    goto/16 :goto_1f

    .line 693
    .end local v0    # "height":I
    :cond_181
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getOptimalDrawerWidth(Landroid/content/Context;)I

    move-result v4

    int-to-double v4, v4

    const-wide/high16 v6, 0x3fe2000000000000L    # 0.5625

    mul-double/2addr v4, v6

    double-to-int v0, v4

    .line 697
    .restart local v0    # "height":I
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x13

    if-ge v4, v5, :cond_1f

    .line 698
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v10}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v4

    sub-int v2, v0, v4

    .line 699
    .local v2, "tempHeight":I
    int-to-float v4, v2

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->convertPixelsToDp(FLandroid/content/Context;)F

    move-result v4

    const/high16 v5, 0x430c0000    # 140.0f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1f

    .line 700
    move v0, v2

    goto/16 :goto_1f

    .line 734
    .end local v2    # "tempHeight":I
    .restart local v3    # "textColor":I
    :cond_1aa
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_account_header_text_section:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    goto/16 :goto_8d

    .line 752
    :cond_1b6
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v4, :cond_f3

    .line 753
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto/16 :goto_f3

    .line 758
    :cond_1c3
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v4, :cond_fe

    .line 759
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto/16 :goto_fe
.end method

.method protected buildDrawerSelectionList()V
    .registers 8

    .prologue
    .line 1203
    const/4 v3, -0x1

    .line 1204
    .local v3, "selectedPosition":I
    const/4 v0, 0x0

    .line 1205
    .local v0, "position":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1206
    .local v2, "profileDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v4, :cond_44

    .line 1207
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_11
    :goto_11
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1208
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v1, v4, :cond_31

    .line 1209
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    if-nez v4, :cond_11

    .line 1212
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/Drawer;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderOffset()I

    move-result v4

    add-int v3, v0, v4

    .line 1215
    :cond_31
    instance-of v4, v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    if-eqz v4, :cond_41

    move-object v4, v1

    .line 1216
    check-cast v4, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 1217
    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1219
    :cond_41
    add-int/lit8 v0, v0, 0x1

    .line 1220
    goto :goto_11

    .line 1222
    :cond_44
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-virtual {v4, v5, v2, v3}, Lcom/mikepenz/materialdrawer/Drawer;->switchDrawerContent(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;Ljava/util/ArrayList;I)V

    .line 1223
    return-void
.end method

.method protected buildProfiles()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x4

    const/16 v6, 0x8

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 966
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v7}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 967
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 968
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 969
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 970
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 971
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 972
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 973
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 974
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v8}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 975
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 976
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 978
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 980
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_1ea

    .line 981
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-nez v1, :cond_52

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    if-eqz v1, :cond_1ca

    .line 982
    :cond_52
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V

    .line 983
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1c3

    .line 984
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 985
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 989
    :goto_6d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 991
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 996
    :cond_77
    :goto_77
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 997
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 998
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 999
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 1001
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 1002
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 1004
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_df

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_df

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    if-nez v1, :cond_df

    .line 1005
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V

    .line 1006
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 1007
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1d5

    .line 1008
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1009
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 1013
    :goto_d5
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 1014
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 1016
    :cond_df
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_119

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_119

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    if-nez v1, :cond_119

    .line 1017
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V

    .line 1018
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 1019
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1dc

    .line 1020
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1021
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 1025
    :goto_10f
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 1026
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 1028
    :cond_119
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_157

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    if-eqz v1, :cond_157

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    if-eqz v1, :cond_157

    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    if-nez v1, :cond_157

    .line 1029
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->setImageOrPlaceholder(Landroid/widget/ImageView;Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V

    .line 1030
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v1, v2, v3}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setTag(ILjava/lang/Object;)V

    .line 1031
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    if-eqz v1, :cond_1e3

    .line 1032
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->onProfileClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1033
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    .line 1037
    :goto_14d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v4}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    .line 1038
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->invalidate()V

    .line 1052
    :cond_157
    :goto_157
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    if-nez v1, :cond_160

    .line 1053
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1055
    :cond_160
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_174

    .line 1056
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1057
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1059
    :cond_174
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    if-nez v1, :cond_17d

    .line 1060
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1062
    :cond_17d
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_191

    .line 1063
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1064
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1068
    :cond_191
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabled:Z

    if-nez v1, :cond_19d

    .line 1069
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1070
    invoke-direct {p0, v8, v4}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1072
    :cond_19d
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    if-nez v1, :cond_1b9

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v1, :cond_1b9

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_1b1

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v5, :cond_1b9

    .line 1073
    :cond_1b1
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1074
    invoke-direct {p0, v8, v4}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1078
    :cond_1b9
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    if-eqz v1, :cond_1c2

    .line 1079
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1081
    :cond_1c2
    return-void

    .line 987
    :cond_1c3
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_6d

    .line 992
    :cond_1ca
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v1, :cond_77

    .line 993
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v6}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->setVisibility(I)V

    goto/16 :goto_77

    .line 1011
    :cond_1d5
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirstView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_d5

    .line 1023
    :cond_1dc
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecondView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_10f

    .line 1035
    :cond_1e3
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThirdView:Lcom/mikepenz/materialdrawer/view/BezelImageView;

    invoke-virtual {v1, v5}, Lcom/mikepenz/materialdrawer/view/BezelImageView;->disableTouchFeedback(Z)V

    goto/16 :goto_14d

    .line 1040
    :cond_1ea
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_157

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_157

    .line 1041
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1042
    .local v0, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    invoke-virtual {v1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 1043
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderTextSection:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1044
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-direct {p0, v1, v5}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->handleSelectionView(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 1045
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1046
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_157

    .line 1047
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileName:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 1048
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfileEmail:Landroid/widget/TextView;

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    goto/16 :goto_157
.end method

.method protected calculateProfiles()V
    .registers 13

    .prologue
    .line 801
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v10, :cond_b

    .line 802
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 805
    :cond_b
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_7a

    .line 806
    const/4 v7, 0x0

    .line 807
    .local v7, "setCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_121

    .line 808
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-le v10, v1, :cond_41

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v10}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->isSelectable()Z

    move-result v10

    if-eqz v10, :cond_41

    .line 809
    if-nez v7, :cond_44

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_44

    .line 810
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 818
    :cond_3f
    :goto_3f
    add-int/lit8 v7, v7, 0x1

    .line 807
    :cond_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 811
    :cond_44
    const/4 v10, 0x1

    if-ne v7, v10, :cond_56

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_56

    .line 812
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 813
    :cond_56
    const/4 v10, 0x2

    if-ne v7, v10, :cond_68

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_68

    .line 814
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 815
    :cond_68
    const/4 v10, 0x3

    if-ne v7, v10, :cond_3f

    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-nez v10, :cond_3f

    .line 816
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_3f

    .line 825
    .end local v1    # "i":I
    .end local v7    # "setCount":I
    :cond_7a
    const/4 v10, 0x4

    new-array v5, v10, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    const/4 v10, 0x3

    iget-object v11, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v11, v5, v10

    .line 832
    .local v5, "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    const/4 v10, 0x4

    new-array v3, v10, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 833
    .local v3, "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    new-instance v8, Ljava/util/Stack;

    invoke-direct {v8}, Ljava/util/Stack;-><init>()V

    .line 836
    .local v8, "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_9a
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v1, v10, :cond_c7

    .line 837
    iget-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 838
    .local v4, "p":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->isSelectable()Z

    move-result v10

    if-eqz v10, :cond_c1

    .line 839
    const/4 v9, 0x0

    .line 840
    .local v9, "used":Z
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_b2
    const/4 v10, 0x4

    if-ge v2, v10, :cond_bc

    .line 841
    aget-object v10, v5, v2

    if-ne v10, v4, :cond_c4

    .line 842
    aput-object v4, v3, v2

    .line 843
    const/4 v9, 0x1

    .line 847
    :cond_bc
    if-nez v9, :cond_c1

    .line 848
    invoke-virtual {v8, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 836
    .end local v2    # "j":I
    .end local v9    # "used":Z
    :cond_c1
    add-int/lit8 v1, v1, 0x1

    goto :goto_9a

    .line 840
    .restart local v2    # "j":I
    .restart local v9    # "used":Z
    :cond_c4
    add-int/lit8 v2, v2, 0x1

    goto :goto_b2

    .line 853
    .end local v2    # "j":I
    .end local v4    # "p":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v9    # "used":Z
    :cond_c7
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 855
    .local v0, "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    const/4 v1, 0x0

    :goto_cd
    const/4 v10, 0x4

    if-ge v1, v10, :cond_ea

    .line 856
    aget-object v10, v3, v1

    if-eqz v10, :cond_dc

    .line 857
    aget-object v10, v3, v1

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    :cond_d9
    :goto_d9
    add-int/lit8 v1, v1, 0x1

    goto :goto_cd

    .line 858
    :cond_dc
    invoke-virtual {v8}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_d9

    .line 859
    invoke-virtual {v8}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d9

    .line 863
    :cond_ea
    new-instance v6, Ljava/util/Stack;

    invoke-direct {v6}, Ljava/util/Stack;-><init>()V

    .line 864
    .local v6, "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :goto_ef
    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    move-result v10

    if-nez v10, :cond_fd

    .line 865
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ef

    .line 869
    :cond_fd
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_122

    .line 870
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 874
    :goto_106
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_12b

    .line 875
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 879
    :goto_10f
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_134

    .line 880
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 884
    :goto_118
    invoke-virtual {v6}, Ljava/util/Stack;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_13d

    .line 885
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 889
    .end local v0    # "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .end local v3    # "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v5    # "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .end local v6    # "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .end local v8    # "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :cond_121
    :goto_121
    return-void

    .line 872
    .restart local v0    # "activeProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .restart local v3    # "newActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .restart local v5    # "previousActiveProfiles":[Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .restart local v6    # "reversedActiveProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    .restart local v8    # "unusedProfiles":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    :cond_122
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_106

    .line 877
    :cond_12b
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_10f

    .line 882
    :cond_134
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_118

    .line 887
    :cond_13d
    invoke-virtual {v6}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v10, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_121
.end method

.method protected getCurrentSelection()I
    .registers 5

    .prologue
    .line 1148
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v2, :cond_23

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_23

    .line 1149
    const/4 v0, 0x0

    .line 1150
    .local v0, "i":I
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1151
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v1, v3, :cond_20

    .line 1157
    .end local v0    # "i":I
    .end local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :goto_1f
    return v0

    .line 1154
    .restart local v0    # "i":I
    .restart local v1    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_20
    add-int/lit8 v0, v0, 0x1

    .line 1155
    goto :goto_f

    .line 1157
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
    .line 1119
    sget v2, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 1120
    .local v1, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    .line 1123
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    .line 1125
    const/4 v0, 0x0

    .line 1126
    .local v0, "consumed":Z
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    if-eqz v2, :cond_1d

    .line 1127
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    invoke-interface {v2, p1, v1, p2}, Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    move-result v0

    .line 1130
    :cond_1d
    if-nez v0, :cond_2e

    .line 1131
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$3;

    invoke-direct {v3, p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$3;-><init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V

    const-wide/16 v4, 0xc8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1140
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

    .line 898
    if-nez p1, :cond_9

    move v5, v6

    .line 959
    :goto_8
    return v5

    .line 901
    :cond_9
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_f

    move v5, v7

    .line 902
    goto :goto_8

    .line 905
    :cond_f
    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    if-eqz v5, :cond_3c

    .line 906
    const/4 v2, -0x1

    .line 907
    .local v2, "prevSelection":I
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_26

    .line 908
    const/4 v2, 0x1

    .line 915
    :cond_19
    :goto_19
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 916
    .local v4, "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 918
    if-ne v2, v7, :cond_32

    .line 919
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 957
    .end local v2    # "prevSelection":I
    .end local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_21
    :goto_21
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildProfiles()V

    move v5, v6

    .line 959
    goto :goto_8

    .line 909
    .restart local v2    # "prevSelection":I
    :cond_26
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_2c

    .line 910
    const/4 v2, 0x2

    goto :goto_19

    .line 911
    :cond_2c
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-ne v5, p1, :cond_19

    .line 912
    const/4 v2, 0x3

    goto :goto_19

    .line 920
    .restart local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_32
    if-ne v2, v9, :cond_37

    .line 921
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 922
    :cond_37
    if-ne v2, v10, :cond_21

    .line 923
    iput-object v4, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 926
    .end local v2    # "prevSelection":I
    .end local v4    # "tmp":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_3c
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v5, :cond_21

    .line 927
    new-instance v3, Ljava/util/ArrayList;

    new-array v5, v11, [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v6

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v7

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v9

    iget-object v8, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    aput-object v8, v5, v10

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 929
    .local v3, "previousActiveProfiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_99

    .line 930
    const/4 v1, -0x1

    .line 932
    .local v1, "position":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_63
    if-ge v0, v11, :cond_6c

    .line 933
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p1, :cond_96

    .line 934
    move v1, v0

    .line 939
    :cond_6c
    const/4 v5, -0x1

    if-eq v1, v5, :cond_21

    .line 940
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 941
    invoke-virtual {v3, v6, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 943
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 944
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 945
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 946
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto :goto_21

    .line 932
    :cond_96
    add-int/lit8 v0, v0, 0x1

    goto :goto_63

    .line 949
    .end local v0    # "i":I
    .end local v1    # "position":I
    :cond_99
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileThird:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 950
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileSecond:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 951
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iput-object v5, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileFirst:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 952
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    goto/16 :goto_21
.end method

.method protected toggleSelectionList(Landroid/content/Context;)V
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1183
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_12

    .line 1185
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/Drawer;->switchedDrawerContent()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1186
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V

    .line 1187
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    .line 1197
    :cond_12
    :goto_12
    return-void

    .line 1190
    :cond_13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildDrawerSelectionList()V

    .line 1193
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    sget-object v2, Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;->mdf_arrow_drop_up:Lcom/mikepenz/materialdrawer/icons/MaterialDrawerFont$Icon;

    invoke-direct {v1, p1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_account_header_dropdown_padding:I

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_header_selection_text:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_header_selection_text:I

    invoke-static {v2, p1, v3, v4}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1194
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    goto :goto_12
.end method

.method protected updateHeaderAndList()V
    .registers 2

    .prologue
    .line 1278
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->calculateProfiles()V

    .line 1280
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildProfiles()V

    .line 1282
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    if-eqz v0, :cond_d

    .line 1283
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildDrawerSelectionList()V

    .line 1285
    :cond_d
    return-void
.end method

.method public withAccountHeader(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 6
    .param p1, "resLayout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 527
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_e

    .line 528
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "please pass an activity first to use this call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 531
    :cond_e
    const/4 v0, -0x1

    if-eq p1, v0, :cond_1e

    .line 532
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {v0, p1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    .line 541
    :goto_1d
    return-object p0

    .line 534
    :cond_1e
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    if-eqz v0, :cond_31

    .line 535
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_compact_header:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    goto :goto_1d

    .line 537
    :cond_31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_header:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    goto :goto_1d
.end method

.method public withAccountHeader(Landroid/view/View;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "accountHeader"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 516
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    .line 517
    return-object p0
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 79
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mActivity:Landroid/app/Activity;

    .line 80
    return-object p0
.end method

.method public withAlternativeProfileHeaderSwitching(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "alternativeProfileHeaderSwitching"    # Z

    .prologue
    .line 446
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAlternativeProfileHeaderSwitching:Z

    .line 447
    return-object p0
.end method

.method public withCloseDrawerOnProfileListClick(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "closeDrawerOnProfileListClick"    # Z

    .prologue
    .line 404
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Ljava/lang/Boolean;

    .line 405
    return-object p0
.end method

.method public withCompactStyle(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "compactStyle"    # Z

    .prologue
    .line 93
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCompactStyle:Z

    .line 94
    return-object p0
.end method

.method public withCurrentProfileHiddenInList(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "currentProfileHiddenInList"    # Z

    .prologue
    .line 215
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentHiddenInList:Z

    .line 216
    return-object p0
.end method

.method public withDividerBelowHeader(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "dividerBelowHeader"    # Z

    .prologue
    .line 298
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDividerBelowHeader:Z

    .line 299
    return-object p0
.end method

.method public withDrawer(Lcom/mikepenz/materialdrawer/Drawer;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 596
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    .line 597
    return-object p0
.end method

.method public withEmailTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 139
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mEmailTypeface:Landroid/graphics/Typeface;

    .line 140
    return-object p0
.end method

.method public withHeaderBackground(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "headerBackgroundRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 337
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackground:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 338
    return-object p0
.end method

.method public withHeaderBackground(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "headerBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 326
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackground:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 327
    return-object p0
.end method

.method public withHeaderBackground(Lcom/mikepenz/materialdrawer/holder/ImageHolder;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "headerBackground"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .prologue
    .line 348
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackground:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 349
    return-object p0
.end method

.method public withHeaderBackgroundScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "headerBackgroundScaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeaderBackgroundScaleType:Landroid/widget/ImageView$ScaleType;

    .line 363
    return-object p0
.end method

.method public withHeightDp(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "heightDp"    # I

    .prologue
    .line 165
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 166
    return-object p0
.end method

.method public withHeightPx(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "heightPx"    # I

    .prologue
    .line 153
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 154
    return-object p0
.end method

.method public withHeightRes(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "heightRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 176
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromResource(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mHeight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 177
    return-object p0
.end method

.method public withNameTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 126
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mNameTypeface:Landroid/graphics/Typeface;

    .line 127
    return-object p0
.end method

.method public withOnAccountHeaderListener(Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "onAccountHeaderListener"    # Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 584
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    .line 585
    return-object p0
.end method

.method public withOnAccountHeaderSelectionViewClickListener(Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "onAccountHeaderSelectionViewClickListener"    # Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    .prologue
    .line 474
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    .line 475
    return-object p0
.end method

.method public withOnlyMainProfileImageVisible(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "onlyMainProfileImageVisible"    # Z

    .prologue
    .line 390
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnlyMainProfileImageVisible:Z

    .line 391
    return-object p0
.end method

.method public withProfileImagesClickable(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "profileImagesClickable"    # Z

    .prologue
    .line 432
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesClickable:Z

    .line 433
    return-object p0
.end method

.method public withProfileImagesVisible(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "profileImagesVisible"    # Z

    .prologue
    .line 376
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfileImagesVisible:Z

    .line 377
    return-object p0
.end method

.method public withProfiles(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;",
            ">;)",
            "Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;"
        }
    .end annotation

    .prologue
    .line 554
    .local p1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 555
    return-object p0
.end method

.method public withResetDrawerOnProfileListClick(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "resetDrawerOnProfileListClick"    # Z

    .prologue
    .line 418
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    .line 419
    return-object p0
.end method

.method public withSavedInstance(Landroid/os/Bundle;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 610
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSavedInstance:Landroid/os/Bundle;

    .line 611
    return-object p0
.end method

.method public withSelectionFirstLine(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLine"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLine:Ljava/lang/String;

    .line 272
    return-object p0
.end method

.method public withSelectionFirstLineShown(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLineShown"    # Z

    .prologue
    .line 243
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 244
    return-object p0
.end method

.method public withSelectionFistLineShown(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionFirstLineShown"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 232
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionFirstLineShown:Z

    .line 233
    return-object p0
.end method

.method public withSelectionListEnabled(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionListEnabled"    # Z

    .prologue
    .line 502
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabled:Z

    .line 503
    return-object p0
.end method

.method public withSelectionListEnabledForSingleProfile(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionListEnabledForSingleProfile"    # Z

    .prologue
    .line 488
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListEnabledForSingleProfile:Z

    .line 489
    return-object p0
.end method

.method public withSelectionSecondLine(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionSecondLine"    # Ljava/lang/String;

    .prologue
    .line 283
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLine:Ljava/lang/String;

    .line 284
    return-object p0
.end method

.method public withSelectionSecondLineShown(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "selectionSecondLineShown"    # Z

    .prologue
    .line 254
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionSecondLineShown:Z

    .line 255
    return-object p0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 190
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 191
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 3
    .param p1, "textColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 201
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 202
    return-object p0
.end method

.method public withThreeSmallProfileImages(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "threeSmallProfileImages"    # Z

    .prologue
    .line 460
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mThreeSmallProfileImages:Z

    .line 461
    return-object p0
.end method

.method public withTranslucentStatusBar(Z)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "translucentStatusBar"    # Z

    .prologue
    .line 312
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTranslucentStatusBar:Z

    .line 313
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 113
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mTypeface:Landroid/graphics/Typeface;

    .line 114
    return-object p0
.end method
