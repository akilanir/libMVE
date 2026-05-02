.class final Lcom/jenzz/materialpreference/Typefaces;
.super Ljava/lang/Object;
.source "Typefaces.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final cache:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
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
    .line 10
    const-class v0, Lcom/jenzz/materialpreference/Typefaces;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/jenzz/materialpreference/Typefaces;->TAG:Ljava/lang/String;

    .line 11
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/jenzz/materialpreference/Typefaces;->cache:Ljava/util/Hashtable;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method static get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "assetPath"    # Ljava/lang/String;

    .prologue
    .line 18
    sget-object v3, Lcom/jenzz/materialpreference/Typefaces;->cache:Ljava/util/Hashtable;

    monitor-enter v3

    .line 19
    :try_start_3
    sget-object v2, Lcom/jenzz/materialpreference/Typefaces;->cache:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_4c

    move-result v2

    if-nez v2, :cond_18

    .line 21
    :try_start_b
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 22
    .local v1, "t":Landroid/graphics/Typeface;
    sget-object v2, Lcom/jenzz/materialpreference/Typefaces;->cache:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_18} :catch_22
    .catchall {:try_start_b .. :try_end_18} :catchall_4c

    .line 28
    .end local v1    # "t":Landroid/graphics/Typeface;
    :cond_18
    :try_start_18
    sget-object v2, Lcom/jenzz/materialpreference/Typefaces;->cache:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    monitor-exit v3

    :goto_21
    return-object v2

    .line 23
    :catch_22
    move-exception v0

    .line 24
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/jenzz/materialpreference/Typefaces;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not get typeface \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' Error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    const/4 v2, 0x0

    monitor-exit v3

    goto :goto_21

    .line 29
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_4c
    move-exception v2

    monitor-exit v3
    :try_end_4e
    .catchall {:try_start_18 .. :try_end_4e} :catchall_4c

    throw v2
.end method

.method static getRobotoMedium(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const-string v0, "fonts/Roboto-Medium.ttf"

    invoke-static {p0, v0}, Lcom/jenzz/materialpreference/Typefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method static getRobotoRegular(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const-string v0, "fonts/Roboto-Regular.ttf"

    invoke-static {p0, v0}, Lcom/jenzz/materialpreference/Typefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method
