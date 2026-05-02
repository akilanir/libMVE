.class public Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;
.super Ljava/lang/Object;
.source "GoogleMaterial.java"

# interfaces
.implements Lcom/mikepenz/iconics/typeface/ITypeface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;
    }
.end annotation


# static fields
.field private static final TTF_FILE:Ljava/lang/String; = "google-material-font-v2.2.0.1.original.ttf"

.field private static mChars:Ljava/util/HashMap;
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

.field private static typeface:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->typeface:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    const-string v0, "Google"

    return-object v0
.end method

.method public getCharacters()Ljava/util/HashMap;
    .registers 8
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
    .line 40
    sget-object v2, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->mChars:Ljava/util/HashMap;

    if-nez v2, :cond_25

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .local v0, "aChars":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Character;>;"
    invoke-static {}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->values()[Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v4, :cond_23

    aget-object v1, v3, v2

    .line 43
    .local v1, "v":Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;
    invoke-virtual {v1}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->name()Ljava/lang/String;

    move-result-object v5

    iget-char v6, v1, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->character:C

    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 45
    .end local v1    # "v":Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;
    :cond_23
    sput-object v0, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->mChars:Ljava/util/HashMap;

    .line 47
    .end local v0    # "aChars":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Character;>;"
    :cond_25
    sget-object v2, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->mChars:Ljava/util/HashMap;

    return-object v2
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    const-string v0, "Material design icons are the official icon set from Google that are designed under the material design guidelines."

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    const-string v0, "Google Material"

    return-object v0
.end method

.method public getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-static {p1}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->valueOf(Ljava/lang/String;)Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    move-result-object v0

    return-object v0
.end method

.method public getIconCount()I
    .registers 2

    .prologue
    .line 67
    sget-object v0, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->mChars:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public getIcons()Ljava/util/Collection;
    .registers 7
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
    .line 72
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 73
    .local v0, "icons":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->values()[Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v4, :cond_19

    aget-object v1, v3, v2

    .line 74
    .local v1, "value":Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;
    invoke-virtual {v1}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;->name()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 73
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 76
    .end local v1    # "value":Lcom/mikepenz/google_material_typeface_library/GoogleMaterial$Icon;
    :cond_19
    return-object v0
.end method

.method public getLicense()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    const-string v0, "CC-BY 4.0"

    return-object v0
.end method

.method public getLicenseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    const-string v0, "http://creativecommons.org/licenses/by/4.0/"

    return-object v0
.end method

.method public getMappingPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    const-string v0, "gmd"

    return-object v0
.end method

.method public getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 106
    sget-object v1, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->typeface:Landroid/graphics/Typeface;

    if-nez v1, :cond_10

    .line 108
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "fonts/google-material-font-v2.2.0.1.original.ttf"

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    sput-object v1, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->typeface:Landroid/graphics/Typeface;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_13

    .line 113
    :cond_10
    sget-object v1, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->typeface:Landroid/graphics/Typeface;

    :goto_12
    return-object v1

    .line 109
    :catch_13
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 86
    const-string v0, "https://github.com/google/material-design-icons"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    const-string v0, "2.2.0.1"

    return-object v0
.end method
