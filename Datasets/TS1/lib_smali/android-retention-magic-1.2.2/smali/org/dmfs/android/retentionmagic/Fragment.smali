.class public Lorg/dmfs/android/retentionmagic/Fragment;
.super Landroid/app/Fragment;
.source "Fragment.java"


# instance fields
.field private mPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 40
    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/app/Fragment;Landroid/os/Bundle;)V

    .line 41
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 50
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

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

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lorg/dmfs/android/retentionmagic/Fragment;->mPrefs:Landroid/content/SharedPreferences;

    .line 52
    if-nez p1, :cond_2d

    .line 54
    iget-object v1, p0, Lorg/dmfs/android/retentionmagic/Fragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 60
    :goto_2c
    return-void

    .line 58
    :cond_2d
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->restore(Landroid/app/Fragment;Landroid/os/Bundle;)V

    goto :goto_2c
.end method

.method public onPause()V
    .registers 3

    .prologue
    .line 74
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_e

    .line 80
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/Fragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 82
    :cond_e
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 67
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->store(Landroid/app/Fragment;Landroid/os/Bundle;)V

    .line 68
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 88
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 89
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_e

    .line 91
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/Fragment;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Fragment;Landroid/content/SharedPreferences;)V

    .line 93
    :cond_e
    return-void
.end method
