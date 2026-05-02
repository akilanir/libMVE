.class public Landroid/content/res/XModuleResources;
.super Landroid/content/res/Resources;
.source "XModuleResources.java"


# direct methods
.method private constructor <init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "metrics"    # Landroid/util/DisplayMetrics;
    .param p3, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 13
    return-void
.end method

.method public static createInstance(Ljava/lang/String;Landroid/content/res/XResources;)Landroid/content/res/XModuleResources;
    .registers 6
    .param p0, "modulePath"    # Ljava/lang/String;
    .param p1, "origRes"    # Landroid/content/res/XResources;

    .prologue
    const/4 v2, 0x0

    .line 21
    if-nez p0, :cond_b

    .line 22
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "modulePath must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 24
    :cond_b
    new-instance v0, Landroid/content/res/AssetManager;

    invoke-direct {v0}, Landroid/content/res/AssetManager;-><init>()V

    .line 25
    .local v0, "assets":Landroid/content/res/AssetManager;
    invoke-virtual {v0, p0}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    .line 28
    if-eqz p1, :cond_2c

    .line 29
    new-instance v1, Landroid/content/res/XModuleResources;

    invoke-virtual {p1}, Landroid/content/res/XResources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/res/XResources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Landroid/content/res/XModuleResources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 33
    .local v1, "res":Landroid/content/res/XModuleResources;
    :goto_22
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-static {p0, v2, v3, v1}, Landroid/app/AndroidAppHelper;->addActiveResource(Ljava/lang/String;FZLandroid/content/res/Resources;)V

    .line 34
    return-object v1

    .line 31
    .end local v1    # "res":Landroid/content/res/XModuleResources;
    :cond_2c
    new-instance v1, Landroid/content/res/XModuleResources;

    invoke-direct {v1, v0, v2, v2}, Landroid/content/res/XModuleResources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .restart local v1    # "res":Landroid/content/res/XModuleResources;
    goto :goto_22
.end method


# virtual methods
.method public fwd(I)Landroid/content/res/XResForwarder;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 41
    new-instance v0, Landroid/content/res/XResForwarder;

    invoke-direct {v0, p0, p1}, Landroid/content/res/XResForwarder;-><init>(Landroid/content/res/Resources;I)V

    return-object v0
.end method
