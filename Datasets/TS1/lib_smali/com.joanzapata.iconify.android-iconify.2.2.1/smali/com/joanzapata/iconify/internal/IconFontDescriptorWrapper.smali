.class public Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;
.super Ljava/lang/Object;
.source "IconFontDescriptorWrapper.java"


# instance fields
.field private cachedTypeface:Landroid/graphics/Typeface;

.field private final iconFontDescriptor:Lcom/joanzapata/iconify/IconFontDescriptor;

.field private final iconsByKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/joanzapata/iconify/Icon;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/joanzapata/iconify/IconFontDescriptor;)V
    .registers 8
    .param p1, "iconFontDescriptor"    # Lcom/joanzapata/iconify/IconFontDescriptor;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconFontDescriptor:Lcom/joanzapata/iconify/IconFontDescriptor;

    .line 21
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconsByKey:Ljava/util/Map;

    .line 22
    invoke-interface {p1}, Lcom/joanzapata/iconify/IconFontDescriptor;->characters()[Lcom/joanzapata/iconify/Icon;

    move-result-object v0

    .line 23
    .local v0, "characters":[Lcom/joanzapata/iconify/Icon;
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v1, v0

    .local v1, "charactersLength":I
    :goto_12
    if-ge v2, v1, :cond_22

    .line 24
    aget-object v3, v0, v2

    .line 25
    .local v3, "icon":Lcom/joanzapata/iconify/Icon;
    iget-object v4, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconsByKey:Ljava/util/Map;

    invoke-interface {v3}, Lcom/joanzapata/iconify/Icon;->key()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 27
    .end local v3    # "icon":Lcom/joanzapata/iconify/Icon;
    :cond_22
    return-void
.end method


# virtual methods
.method public getIcon(Ljava/lang/String;)Lcom/joanzapata/iconify/Icon;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconsByKey:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/joanzapata/iconify/Icon;

    return-object v0
.end method

.method public getIconFontDescriptor()Lcom/joanzapata/iconify/IconFontDescriptor;
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconFontDescriptor:Lcom/joanzapata/iconify/IconFontDescriptor;

    return-object v0
.end method

.method public getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    .line 42
    :goto_6
    return-object v0

    .line 39
    :cond_7
    monitor-enter p0

    .line 40
    :try_start_8
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    monitor-exit p0

    goto :goto_6

    .line 43
    :catchall_10
    move-exception v0

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_10

    throw v0

    .line 41
    :cond_13
    :try_start_13
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconFontDescriptor:Lcom/joanzapata/iconify/IconFontDescriptor;

    invoke-interface {v1}, Lcom/joanzapata/iconify/IconFontDescriptor;->ttfFileName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    .line 42
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->cachedTypeface:Landroid/graphics/Typeface;

    monitor-exit p0
    :try_end_26
    .catchall {:try_start_13 .. :try_end_26} :catchall_10

    goto :goto_6
.end method

.method public hasIcon(Lcom/joanzapata/iconify/Icon;)Z
    .registers 3
    .param p1, "icon"    # Lcom/joanzapata/iconify/Icon;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/joanzapata/iconify/internal/IconFontDescriptorWrapper;->iconsByKey:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
