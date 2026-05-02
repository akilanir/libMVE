.class public Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;
.super Ljava/lang/Object;
.source "CommunityMaterial.java"

# interfaces
.implements Lcom/mikepenz/iconics/typeface/ITypeface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;
    }
.end annotation


# static fields
.field private static final TTF_FILE:Ljava/lang/String; = "communitymaterial-font-v1.5.54.ttf"

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
    .line 32
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->typeface:Landroid/graphics/Typeface;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    const-string v0, "Templarian / Community / Google"

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
    .line 43
    sget-object v2, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->mChars:Ljava/util/HashMap;

    if-nez v2, :cond_25

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 45
    .local v0, "aChars":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Character;>;"
    invoke-static {}, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->values()[Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v4, :cond_23

    aget-object v1, v3, v2

    .line 46
    .local v1, "v":Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;
    invoke-virtual {v1}, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->name()Ljava/lang/String;

    move-result-object v5

    iget-char v6, v1, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->character:C

    .line 47
    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    .line 46
    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 49
    .end local v1    # "v":Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;
    :cond_23
    sput-object v0, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->mChars:Ljava/util/HashMap;

    .line 52
    .end local v0    # "aChars":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Character;>;"
    :cond_25
    sget-object v2, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->mChars:Ljava/util/HashMap;

    return-object v2
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    const-string v0, "Material Design Icons are the official open-source icons featured in the Google Material Design specification."

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    const-string v0, "Community Material Design"

    return-object v0
.end method

.method public getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-static {p1}, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->valueOf(Ljava/lang/String;)Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;

    move-result-object v0

    return-object v0
.end method

.method public getIconCount()I
    .registers 2

    .prologue
    .line 72
    sget-object v0, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->mChars:Ljava/util/HashMap;

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
    .line 77
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 79
    .local v0, "icons":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {}, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->values()[Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v4, :cond_19

    aget-object v1, v3, v2

    .line 80
    .local v1, "value":Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;
    invoke-virtual {v1}, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;->name()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 79
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 83
    .end local v1    # "value":Lcom/mikepenz/community_material_typeface_library/CommunityMaterial$Icon;
    :cond_19
    return-object v0
.end method

.method public getLicense()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    const-string v0, "Templates - Free, Community Icons - SIL Open Font License 1.1, Google Material Design Icons: Attribution 4.0 International"

    return-object v0
.end method

.method public getLicenseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    const-string v0, "https://raw.githubusercontent.com/Templarian/MaterialDesign/master/license.txt"

    return-object v0
.end method

.method public getMappingPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    const-string v0, "cmd"

    return-object v0
.end method

.method public getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    sget-object v1, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->typeface:Landroid/graphics/Typeface;

    if-nez v1, :cond_10

    .line 115
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "fonts/communitymaterial-font-v1.5.54.ttf"

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    sput-object v1, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->typeface:Landroid/graphics/Typeface;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_13

    .line 121
    :cond_10
    sget-object v1, Lcom/mikepenz/community_material_typeface_library/CommunityMaterial;->typeface:Landroid/graphics/Typeface;

    :goto_12
    return-object v1

    .line 117
    :catch_13
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    const-string v0, "http://materialdesignicons.com/"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    const-string v0, "1.5.54"

    return-object v0
.end method
