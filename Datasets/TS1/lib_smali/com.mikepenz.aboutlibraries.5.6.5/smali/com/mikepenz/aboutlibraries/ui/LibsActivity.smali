.class public Lcom/mikepenz/aboutlibraries/ui/LibsActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "LibsActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 16
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v13, 0x1

    const/4 v12, -0x1

    .line 26
    const/4 v4, 0x0

    .line 27
    .local v4, "customTheme":Z
    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 28
    .local v1, "activityStyle":Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 29
    .local v2, "bundle":Landroid/os/Bundle;
    if-eqz v2, :cond_27

    .line 30
    const-string v11, "ABOUT_LIBRARIES_THEME"

    invoke-virtual {v2, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 31
    .local v8, "themeId":I
    if-eq v8, v12, :cond_1b

    .line 32
    const/4 v4, 0x1

    .line 33
    invoke-virtual {p0, v8}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    .line 36
    :cond_1b
    const-string v11, "ABOUT_LIBRARIES_STYLE"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 37
    .local v7, "style":Ljava/lang/String;
    if-eqz v7, :cond_27

    .line 38
    invoke-static {v7}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->valueOf(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    move-result-object v1

    .line 41
    .end local v7    # "style":Ljava/lang/String;
    .end local v8    # "themeId":I
    :cond_27
    if-nez v4, :cond_32

    .line 42
    sget-object v11, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v11, :cond_bb

    .line 43
    sget v11, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme:I

    invoke-virtual {p0, v11}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    .line 51
    :cond_32
    :goto_32
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    sget v11, Lcom/mikepenz/aboutlibraries/R$layout;->activity_opensource:I

    invoke-virtual {p0, v11}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setContentView(I)V

    .line 53
    const-string v9, ""

    .line 54
    .local v9, "title":Ljava/lang/String;
    if-eqz v2, :cond_4c

    const-string v11, "ABOUT_LIBRARIES_TITLE"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4c

    .line 55
    const-string v11, "ABOUT_LIBRARIES_TITLE"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 57
    :cond_4c
    new-instance v5, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;

    invoke-direct {v5}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;-><init>()V

    .line 58
    .local v5, "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    invoke-virtual {v5, v2}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;->setArguments(Landroid/os/Bundle;)V

    .line 62
    sget v11, Lcom/mikepenz/aboutlibraries/R$id;->toolbar:I

    invoke-virtual {p0, v11}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/support/v7/widget/Toolbar;

    .line 64
    .local v10, "toolbar":Landroid/support/v7/widget/Toolbar;
    sget-object v11, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v11, :cond_66

    .line 65
    invoke-virtual {v10, v12}, Landroid/support/v7/widget/Toolbar;->setTitleTextColor(I)V

    .line 66
    invoke-virtual {v10, v12}, Landroid/support/v7/widget/Toolbar;->setSubtitleTextColor(I)V

    .line 68
    :cond_66
    invoke-virtual {p0, v10}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 71
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 72
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_a9

    .line 74
    if-eqz v2, :cond_9c

    const-string v11, "ABOUT_COLOR"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_9c

    .line 75
    const-string v11, "ABOUT_COLOR"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 76
    .local v3, "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    if-eqz v3, :cond_d1

    .line 77
    new-instance v11, Landroid/graphics/drawable/ColorDrawable;

    iget v12, v3, Lcom/mikepenz/aboutlibraries/util/Colors;->appBarColor:I

    invoke-direct {v11, v12}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v11}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 78
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x15

    if-lt v11, v12, :cond_9c

    .line 79
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getWindow()Landroid/view/Window;

    move-result-object v11

    iget v12, v3, Lcom/mikepenz/aboutlibraries/util/Colors;->statusBarColor:I

    invoke-virtual {v11, v12}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 87
    .end local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    :cond_9c
    :goto_9c
    invoke-virtual {v0, v13}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 88
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_d6

    .line 89
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 95
    :cond_a9
    :goto_a9
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    .line 96
    .local v6, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v11

    sget v12, Lcom/mikepenz/aboutlibraries/R$id;->frame_container:I

    invoke-virtual {v11, v12, v5}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v11

    invoke-virtual {v11}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 97
    return-void

    .line 44
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    .end local v5    # "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    .end local v6    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v9    # "title":Ljava/lang/String;
    .end local v10    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_bb
    sget-object v11, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v11, :cond_c6

    .line 45
    sget v11, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme_Light:I

    invoke-virtual {p0, v11}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    goto/16 :goto_32

    .line 46
    :cond_c6
    sget-object v11, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-ne v1, v11, :cond_32

    .line 47
    sget v11, Lcom/mikepenz/aboutlibraries/R$style;->AboutLibrariesTheme_Light_DarkToolbar:I

    invoke-virtual {p0, v11}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->setTheme(I)V

    goto/16 :goto_32

    .line 82
    .restart local v0    # "ab":Landroid/support/v7/app/ActionBar;
    .restart local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    .restart local v5    # "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    .restart local v9    # "title":Ljava/lang/String;
    .restart local v10    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_d1
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9c

    .line 91
    .end local v3    # "colors":Lcom/mikepenz/aboutlibraries/util/Colors;
    :cond_d6
    invoke-virtual {v0, v13}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 92
    invoke-virtual {v0, v9}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_a9
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 101
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_e

    .line 107
    const/4 v0, 0x0

    :goto_8
    return v0

    .line 103
    :pswitch_9
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;->finish()V

    .line 104
    const/4 v0, 0x1

    goto :goto_8

    .line 101
    :pswitch_data_e
    .packed-switch 0x102002c
        :pswitch_9
    .end packed-switch
.end method
