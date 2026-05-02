.class public final Landroid/support/v7/preference/PreferenceScreen;
.super Landroid/support/v7/preference/PreferenceGroup;
.source "PreferenceScreen.java"


# instance fields
.field private mShouldUseGeneratedIds:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 84
    sget v0, Landroid/support/v7/preference/R$attr;->preferenceScreenStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/preference/PreferenceGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/preference/PreferenceScreen;->mShouldUseGeneratedIds:Z

    .line 85
    return-void
.end method


# virtual methods
.method protected isOnSameScreenAsChildren()Z
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method protected onClick()V
    .registers 3

    .prologue
    .line 89
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceScreen;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-nez v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceScreen;->getFragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v1

    if-nez v1, :cond_13

    .line 97
    :cond_12
    :goto_12
    return-void

    .line 92
    :cond_13
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceScreen;->getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/preference/PreferenceManager;->getOnNavigateToScreenListener()Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;

    move-result-object v0

    .line 94
    .local v0, "listener":Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;
    if-eqz v0, :cond_12

    .line 95
    invoke-interface {v0, p0}, Landroid/support/v7/preference/PreferenceManager$OnNavigateToScreenListener;->onNavigateToScreen(Landroid/support/v7/preference/PreferenceScreen;)V

    goto :goto_12
.end method

.method public setShouldUseGeneratedIds(Z)V
    .registers 4
    .param p1, "shouldUseGeneratedIds"    # Z

    .prologue
    .line 128
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceScreen;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 129
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot change the usage of generated IDs while attached to the preference hierarchy"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_e
    iput-boolean p1, p0, Landroid/support/v7/preference/PreferenceScreen;->mShouldUseGeneratedIds:Z

    .line 133
    return-void
.end method

.method public shouldUseGeneratedIds()Z
    .registers 2

    .prologue
    .line 110
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceScreen;->mShouldUseGeneratedIds:Z

    return v0
.end method
