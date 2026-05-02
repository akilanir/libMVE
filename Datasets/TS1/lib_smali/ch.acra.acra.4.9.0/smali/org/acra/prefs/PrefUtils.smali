.class public final Lorg/acra/prefs/PrefUtils;
.super Ljava/lang/Object;
.source "PrefUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static save(Landroid/content/SharedPreferences$Editor;)V
    .registers 3
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_a

    .line 12
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 16
    :goto_9
    return-void

    .line 14
    :cond_a
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_9
.end method
