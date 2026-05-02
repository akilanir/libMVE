.class public Lorg/dmfs/android/retentionmagic/SupportListFragment;
.super Landroid/support/v4/app/ListFragment;
.source "SupportListFragment.java"


# instance fields
.field private mPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onAttach(Landroid/app/Activity;)V

    .line 42
    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/SupportListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    .line 43
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 51
    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/SupportListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 52
    .local v0, "activity":Landroid/support/v4/app/FragmentActivity;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ".sharedPrefences"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/dmfs/android/retentionmagic/SupportListFragment;->mPrefs:Landroid/content/SharedPreferences;

    .line 54
    if-nez p1, :cond_2d

    .line 56
    iget-object v1, p0, Lorg/dmfs/android/retentionmagic/SupportListFragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 62
    :goto_2c
    return-void

    .line 60
    :cond_2d
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->restore(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    goto :goto_2c
.end method

.method public onPause()V
    .registers 3

    .prologue
    .line 76
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onPause()V

    .line 80
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_e

    .line 82
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/SupportListFragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 84
    :cond_e
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 69
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->store(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    .line 70
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 90
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onStop()V

    .line 91
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_e

    .line 93
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/SupportListFragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/support/v4/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 95
    :cond_e
    return-void
.end method
