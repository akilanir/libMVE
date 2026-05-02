.class public Lorg/dmfs/android/retentionmagic/Activity;
.super Landroid/app/Activity;
.source "Activity.java"


# instance fields
.field private mPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".sharedPrefences"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/dmfs/android/retentionmagic/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/retentionmagic/Activity;->mPrefs:Landroid/content/SharedPreferences;

    .line 43
    invoke-virtual {p0}, Lorg/dmfs/android/retentionmagic/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 45
    if-nez p1, :cond_34

    .line 47
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/Activity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->init(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    .line 53
    :goto_33
    return-void

    .line 51
    :cond_34
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->restore(Landroid/app/Activity;Landroid/os/Bundle;)V

    goto :goto_33
.end method

.method protected onPause()V
    .registers 3

    .prologue
    .line 67
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_e

    .line 73
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/Activity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    .line 75
    :cond_e
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 60
    invoke-static {p0, p1}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->store(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 61
    return-void
.end method

.method protected onStop()V
    .registers 3

    .prologue
    .line 81
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 82
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_e

    .line 84
    iget-object v0, p0, Lorg/dmfs/android/retentionmagic/Activity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-static {p0, v0}, Lorg/dmfs/android/retentionmagic/RetentionMagic;->persist(Landroid/app/Activity;Landroid/content/SharedPreferences;)V

    .line 86
    :cond_e
    return-void
.end method
