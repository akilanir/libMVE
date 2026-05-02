.class public abstract Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;
.super Landroid/preference/PreferenceActivity;
.source "AppCompatPreferenceActivity.java"


# instance fields
.field private mDelegate:Landroid/support/v7/app/AppCompatDelegate;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method private getDelegate()Landroid/support/v7/app/AppCompatDelegate;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->mDelegate:Landroid/support/v7/app/AppCompatDelegate;

    if-nez v0, :cond_b

    .line 124
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/support/v7/app/AppCompatDelegate;->create(Landroid/app/Activity;Landroid/support/v7/app/AppCompatCallback;)Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    iput-object v0, p0, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->mDelegate:Landroid/support/v7/app/AppCompatDelegate;

    .line 126
    :cond_b
    iget-object v0, p0, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->mDelegate:Landroid/support/v7/app/AppCompatDelegate;

    return-object v0
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegate;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    return-void
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 2

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    return-object v0
.end method

.method public getSupportActionBar()Landroid/support/v7/app/ActionBar;
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public invalidateOptionsMenu()V
    .registers 2

    .prologue
    .line 119
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->invalidateOptionsMenu()V

    .line 120
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 103
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 104
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->installViewFactory()V

    .line 45
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->onCreate(Landroid/os/Bundle;)V

    .line 46
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    return-void
.end method

.method protected onDestroy()V
    .registers 2

    .prologue
    .line 114
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 115
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->onDestroy()V

    .line 116
    return-void
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onPostCreate(Landroid/os/Bundle;)V

    .line 52
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->onPostCreate(Landroid/os/Bundle;)V

    .line 53
    return-void
.end method

.method protected onPostResume()V
    .registers 2

    .prologue
    .line 90
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPostResume()V

    .line 91
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->onPostResume()V

    .line 92
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 108
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onStop()V

    .line 109
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatDelegate;->onStop()V

    .line 110
    return-void
.end method

.method protected onTitleChanged(Ljava/lang/CharSequence;I)V
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "color"    # I

    .prologue
    .line 96
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onTitleChanged(Ljava/lang/CharSequence;I)V

    .line 97
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->setTitle(Ljava/lang/CharSequence;)V

    .line 98
    return-void
.end method

.method public setContentView(I)V
    .registers 3
    .param p1, "layoutResID"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->setContentView(I)V

    .line 71
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->setContentView(Landroid/view/View;)V

    .line 76
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/app/AppCompatDelegate;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    return-void
.end method

.method public setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V
    .registers 3
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/lb/material_preferences_library/AppCompatPreferenceActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatDelegate;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 61
    return-void
.end method
