.class public Lcom/afollestad/materialdialogs/util/TypefaceHelper;
.super Ljava/lang/Object;
.source "TypefaceHelper.java"


# static fields
.field private static final cache:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    sput-object v0, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 9
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    sget-object v3, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    monitor-enter v3

    .line 33
    :try_start_3
    sget-object v2, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v2, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_2a

    move-result v2

    if-nez v2, :cond_2d

    .line 35
    :try_start_b
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v4, "fonts/%s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 37
    .local v1, "t":Landroid/graphics/Typeface;
    sget-object v2, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v2, p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_24} :catch_26
    .catchall {:try_start_b .. :try_end_24} :catchall_2a

    .line 38
    :try_start_24
    monitor-exit v3

    .line 43
    .end local v1    # "t":Landroid/graphics/Typeface;
    :goto_25
    return-object v1

    .line 39
    :catch_26
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    monitor-exit v3

    goto :goto_25

    .line 44
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catchall_2a
    move-exception v2

    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_24 .. :try_end_2c} :catchall_2a

    throw v2

    .line 43
    :cond_2d
    :try_start_2d
    sget-object v2, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v2, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    monitor-exit v3
    :try_end_36
    .catchall {:try_start_2d .. :try_end_36} :catchall_2a

    move-object v1, v2

    goto :goto_25
.end method
