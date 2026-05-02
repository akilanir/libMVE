.class public Lcom/mikepenz/iconics/typeface/GenericFont;
.super Ljava/lang/Object;
.source "GenericFont.java"

# interfaces
.implements Lcom/mikepenz/iconics/typeface/ITypeface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/iconics/typeface/GenericFont$Icon;
    }
.end annotation


# instance fields
.field private mChars:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field

.field private mFontFile:Ljava/lang/String;

.field private mMappingPrefix:Ljava/lang/String;

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "mappingPrefix"    # Ljava/lang/String;
    .param p2, "fontFile"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    .line 43
    iput-object p1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mMappingPrefix:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontFile:Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    const-string v0, ""

    return-object v0
.end method

.method public getCharacters()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    const-string v0, ""

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    const-string v0, "GenericFont"

    return-object v0
.end method

.method public getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 53
    new-instance v1, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;

    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-direct {v1, p0, v0}, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;-><init>(Lcom/mikepenz/iconics/typeface/GenericFont;C)V

    invoke-virtual {v1, p0}, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->withTypeface(Lcom/mikepenz/iconics/typeface/ITypeface;)Lcom/mikepenz/iconics/typeface/GenericFont$Icon;

    move-result-object v0

    return-object v0
.end method

.method public getIconCount()I
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public getIcons()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLicense()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    const-string v0, ""

    return-object v0
.end method

.method public getLicenseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    const-string v0, ""

    return-object v0
.end method

.method public getMappingPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mMappingPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    iget-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    if-nez v1, :cond_10

    .line 115
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontFile:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_13

    .line 120
    :cond_10
    iget-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    :goto_12
    return-object v1

    .line 116
    :catch_13
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    const-string v0, ""

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    const-string v0, "1.0.0"

    return-object v0
.end method

.method public registerIcon(Ljava/lang/String;C)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "aChar"    # C

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mMappingPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method
