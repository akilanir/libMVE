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
.field private mAuthor:Ljava/lang/String;

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

.field private mFontName:Ljava/lang/String;

.field private mMappingPrefix:Ljava/lang/String;

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "mappingPrefix"    # Ljava/lang/String;
    .param p2, "fontFile"    # Ljava/lang/String;

    .prologue
    .line 45
    const-string v0, "GenericFont"

    const-string v1, "GenericAuthor"

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/mikepenz/iconics/typeface/GenericFont;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "author"    # Ljava/lang/String;
    .param p3, "mappingPrefix"    # Ljava/lang/String;
    .param p4, "fontFile"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    .line 49
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1b

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MappingPrefix must be 3 char long"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 52
    :cond_1b
    iput-object p1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontName:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mAuthor:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mMappingPrefix:Ljava/lang/String;

    .line 55
    iput-object p4, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontFile:Ljava/lang/String;

    .line 56
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mAuthor:Ljava/lang/String;

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
    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    const-string v0, ""

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontName:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 64
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
    .line 89
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
    .line 94
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mChars:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLicense()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    const-string v0, ""

    return-object v0
.end method

.method public getLicenseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    const-string v0, ""

    return-object v0
.end method

.method public getMappingPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mMappingPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 124
    iget-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    if-nez v1, :cond_10

    .line 126
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->mFontFile:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_13

    .line 131
    :cond_10
    iget-object v1, p0, Lcom/mikepenz/iconics/typeface/GenericFont;->typeface:Landroid/graphics/Typeface;

    :goto_12
    return-object v1

    .line 127
    :catch_13
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    const-string v0, ""

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    const-string v0, "1.0.0"

    return-object v0
.end method

.method public registerIcon(Ljava/lang/String;C)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "aChar"    # C

    .prologue
    .line 59
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

    .line 60
    return-void
.end method
