.class public Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;
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
    .line 26
    new-instance v0, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    sput-object v0, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 8
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    sget-object v2, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    monitor-enter v2

    .line 30
    :try_start_3
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_26

    .line 31
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v3, "fonts/%s.ttf"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 33
    .local v0, "t":Landroid/graphics/Typeface;
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    monitor-exit v2

    .line 36
    .end local v0    # "t":Landroid/graphics/Typeface;
    :goto_25
    return-object v0

    :cond_26
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/TypefaceHelper;->cache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    monitor-exit v2

    move-object v0, v1

    goto :goto_25

    .line 37
    :catchall_31
    move-exception v1

    monitor-exit v2
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_31

    throw v1
.end method
