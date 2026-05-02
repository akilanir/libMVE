.class public Landroid/content/res/MiuiResources;
.super Landroid/content/res/Resources;
.source "MiuiResources.java"


# direct methods
.method constructor <init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V
    .registers 5
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "metrics"    # Landroid/util/DisplayMetrics;
    .param p3, "config"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0, v0, v0}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 13
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
