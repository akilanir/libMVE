.class public Lcom/mikepenz/aboutlibraries/ui/LibsActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "LibsActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 16
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 29
    const/4 v4, 0x0

    .line 30
    .local v4, "customTheme":Z
    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 31
    .local v1, "activityStyle":Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 32
    .local v2, "bundle":Landroid/os/Bundle;
    if-eqz v2, :cond_27

    .line 33
    const-string v12, "ABOUT_LIBRARIES_THEME"

    const/4 v13, -0x1

    invoke-virtual {v2, v12, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 34
    .local v8, "themeId":I
    const/4 v12, -0x1

    if-eq v8, v12, :cond_1b

    .line 35
    const/4 v4, 0x1

    .line 36
    invoke-virtual {p0, v8}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    .line 39
    :cond_1b
    const-string v12, "ABOUT_LIBRARIES_STYLE"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 40
    .local v7, "style":Ljava/lang/String;
    if-eqz v7, :cond_27

    .line 41
    invoke-static {v7}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->valueOf(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    move-result-object v1

    .line 44
    .end local v7    # "style":Ljava/lang/String;
    .end local v8    # "themeId":I
    :cond_27
    if-nez v4, :cond_32

    .line 45
    sget-object v12, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v12, :cond_e1

    .line 46
    sget v12, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme:I

    invoke-virtual {p0, v12}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    .line 54
    :cond_32
    :goto_32
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    sget v12, Lcom/mikepenz/aboutlibraries/R$layout;->activity_opensource:I

    invoke-virtual {p0, v12}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setContentView(I)V

    .line 56
    const-string v9, ""

    .line 57
    .local v9, "title":Ljava/lang/String;
    if-eqz v2, :cond_4c

    const-string v12, "ABOUT_LIBRARIES_TITLE"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_4c

    .line 58
    const-string v12, "ABOUT_LIBRARIES_TITLE"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 60
    :cond_4c
    new-instance v5, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;

    invoke-direct {v5}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;-><init>()V

    .line 61
    .local v5, "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    invoke-virtual {v5, v2}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;->setArguments(Landroid/os/Bundle;)V

    .line 65
    sget v12, Lcom/mikepenz/aboutlibraries/R$id;->toolbar:I

    invoke-virtual {p0, v12}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/support/v7/widget/Toolbar;

    .line 67
    .local v10, "toolbar":Landroid/support/v7/widget/Toolbar;
    sget-object v12, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v12, :cond_68

    .line 68
    const/4 v12, -0x1

    invoke-virtual {v10, v12}, Landroid/support/v7/widget/Toolbar;->setTitleTextColor(I)V

    .line 69
    const/4 v12, -0x1

    invoke-virtual {v10, v12}, Landroid/support/v7/widget/Toolbar;->setSubtitleTextColor(I)V

    .line 71
    :cond_68
    invoke-virtual {p0, v10}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 73
    sget-object v12, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v12, :cond_8e

    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v12

    if-eqz v12, :cond_8e

    .line 74
    sget v12, Lcom/mikepenz/aboutlibraries/R$drawable;->abc_ic_ab_back_mtrl_am_alpha:I

    invoke-static {p0, v12}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .line 75
    .local v11, "upArrow":Landroid/graphics/drawable/Drawable;
    const v12, 0x106000b

    invoke-static {p0, v12}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v12

    sget-object v13, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v11, v12, v13}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 76
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v12

    invoke-virtual {v12, v11}, Landroid/support/v7/app/ActionBar;->setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .end local v11    # "upArrow":Landroid/graphics/drawable/Drawable;
    :cond_8e
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 81
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_cf

    .line 83
    if-eqz v2, :cond_c1

    const-string v12, "ABOUT_COLOR"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_c1

    .line 84
    const-string v12, "ABOUT_COLOR"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 85
    .local v3, "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    if-eqz v3, :cond_f7

    .line 86
    new-instance v12, Landroid/graphics/drawable/ColorDrawable;

    iget v13, v3, Lcom/mikepenz/aboutlibraries/util/Colors;->appBarColor:I

    invoke-direct {v12, v13}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v12}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 87
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_c1

    .line 88
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getWindow()Landroid/view/Window;

    move-result-object v12

    iget v13, v3, Lcom/mikepenz/aboutlibraries/util/Colors;->statusBarColor:I

    invoke-virtual {v12, v13}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 96
    .end local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    :cond_c1
    :goto_c1
    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 97
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_fc

    .line 98
    const/4 v12, 0x0

    invoke-virtual {v0, v12}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 104
    :cond_cf
    :goto_cf
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    .line 105
    .local v6, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v12

    sget v13, Lcom/mikepenz/aboutlibraries/R$id;->frame_container:I

    invoke-virtual {v12, v13, v5}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v12

    invoke-virtual {v12}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 106
    return-void

    .line 47
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    .end local v5    # "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    .end local v6    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_e1
    sget-object v12, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v12, :cond_ec

    .line 48
    sget v12, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme_Light:I

    invoke-virtual {p0, v12}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    goto/16 :goto_32

    .line 49
    :cond_ec
    sget-object v12, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v12, :cond_32

    .line 50
    sget v12, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme_Light_DarkToolbar:I

    invoke-virtual {p0, v12}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    goto/16 :goto_32

    .line 91
    .restart local v0    # "ab":Landroid/support/v7/app/ActionBar;
    .restart local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    .restart local v5    # "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    .restart local v9    # "title":Ljava/lang/String;
    .restart local v10    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_f7
    const/4 v12, 0x0

    invoke-virtual {v0, v12}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c1

    .line 100
    .end local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    :cond_fc
    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 101
    invoke-virtual {v0, v9}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_cf
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 110
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_e

    .line 116
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 112
    :pswitch_9
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->finish()V

    .line 113
    const/4 v0, 0x1

    goto :goto_8

    .line 110
    :pswitch_data_e
    .packed-switch 0x102002c
        :pswitch_9
    .end packed-switch
.end method
