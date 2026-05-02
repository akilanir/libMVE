.class final Lorg/acra/ACRA$1;
.super Ljava/lang/Object;
.source "ACRA.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/ACRA;->init(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 5
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 283
    const-string v1, "acra.disable"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    const-string v1, "acra.enable"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 284
    :cond_10
    # invokes: Lorg/acra/ACRA;->shouldDisableACRA(Landroid/content/SharedPreferences;)Z
    invoke-static {p1}, Lorg/acra/ACRA;->access$000(Landroid/content/SharedPreferences;)Z

    move-result v1

    if-nez v1, :cond_1f

    const/4 v0, 0x1

    .line 285
    .local v0, "enableAcra":Z
    :goto_17
    invoke-static {}, Lorg/acra/ACRA;->getErrorReporter()Lorg/acra/ErrorReporter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/acra/ErrorReporter;->setEnabled(Z)V

    .line 287
    .end local v0    # "enableAcra":Z
    :cond_1e
    return-void

    .line 284
    :cond_1f
    const/4 v0, 0x0

    goto :goto_17
.end method
