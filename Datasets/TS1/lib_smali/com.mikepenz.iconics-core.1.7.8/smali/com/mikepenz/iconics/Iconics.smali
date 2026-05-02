.class public final Lcom/mikepenz/iconics/Iconics;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/iconics/Iconics$RemoveInfo;,
        Lcom/mikepenz/iconics/Iconics$StyleContainer;,
        Lcom/mikepenz/iconics/Iconics$IconicsBuilder;,
        Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;,
        Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
    }
.end annotation


# static fields
.field private static FONTS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;"
        }
    .end annotation
.end field

.field private static INIT_DONE:Z

.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    const-class v0, Lcom/mikepenz/iconics/Iconics;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;
    .registers 6
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/util/HashMap;
    .param p2, "x2"    # Landroid/text/SpannableString;
    .param p3, "x3"    # Ljava/util/List;
    .param p4, "x4"    # Ljava/util/HashMap;

    .prologue
    .line 40
    invoke-static {p0, p1, p2, p3, p4}, Lcom/mikepenz/iconics/Iconics;->style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;

    move-result-object v0

    return-object v0
.end method

.method private static determineNewSpanPoint(ILjava/util/ArrayList;)I
    .registers 6
    .param p0, "pos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/iconics/Iconics$RemoveInfo;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p1, "removed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/iconics/Iconics$RemoveInfo;>;"
    const/4 v1, -0x1

    .line 234
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;

    .line 235
    .local v0, "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v3

    if-gt p0, v3, :cond_5

    .line 239
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v2

    if-le p0, v2, :cond_2a

    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v2

    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getCount()I

    move-result v3

    add-int/2addr v2, v3

    if-ge p0, v2, :cond_2a

    move p0, v1

    .line 250
    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    .end local p0    # "pos":I
    :cond_29
    :goto_29
    return p0

    .line 243
    .restart local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    .restart local p0    # "pos":I
    :cond_2a
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v1

    if-lt p0, v1, :cond_29

    .line 246
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getTotal()I

    move-result v1

    sub-int/2addr p0, v1

    goto :goto_29

    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_36
    move p0, v1

    .line 250
    goto :goto_29
.end method

.method public static findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 75
    sget-boolean v0, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    if-nez v0, :cond_7

    .line 76
    invoke-static {p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 79
    :cond_7
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/typeface/ITypeface;

    return-object v0
.end method

.method public static findFont(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 2
    .param p0, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 83
    invoke-interface {p0}, Lcom/mikepenz/iconics/typeface/IIcon;->getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    return-object v0
.end method

.method public static getRegisteredFonts(Landroid/content/Context;)Ljava/util/Collection;
    .registers 2
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    sget-boolean v0, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    if-nez v0, :cond_7

    .line 68
    invoke-static {p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 71
    :cond_7
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .registers 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/mikepenz/iconics/utils/GenericsUtil;->getFields(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "fonts":[Ljava/lang/String;
    array-length v5, v1

    const/4 v4, 0x0

    :goto_6
    if-ge v4, v5, :cond_3a

    aget-object v2, v1, v4

    .line 51
    .local v2, "fontsClassPath":Ljava/lang/String;
    :try_start_a
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 52
    .local v3, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1d} :catch_20

    .line 49
    .end local v3    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_1d
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 53
    :catch_20
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "Android-Iconics"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can\'t init: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 58
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "fontsClassPath":Ljava/lang/String;
    :cond_3a
    const/4 v4, 0x1

    sput-boolean v4, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    .line 59
    return-void
.end method

.method private static newSpanPoint(ILjava/util/ArrayList;)I
    .registers 5
    .param p0, "pos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/iconics/Iconics$RemoveInfo;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 223
    .local p1, "removed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/iconics/Iconics$RemoveInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;

    .line 224
    .local v0, "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v2

    if-ge p0, v2, :cond_17

    .line 230
    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_16
    return p0

    .line 228
    .restart local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_17
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getCount()I

    move-result v2

    sub-int/2addr p0, v2

    .line 229
    goto :goto_4
.end method

.method public static registerFont(Lcom/mikepenz/iconics/typeface/ITypeface;)Z
    .registers 3
    .param p0, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 62
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-interface {p0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method private static style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;
    .registers 34
    .param p0, "ctx"    # Landroid/content/Context;
    .param p2, "textSpanned"    # Landroid/text/SpannableString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;",
            "Landroid/text/SpannableString;",
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;>;)",
            "Landroid/text/SpannableString;"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p3, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p4, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    sget-boolean v4, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    if-nez v4, :cond_7

    .line 92
    invoke-static/range {p0 .. p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 95
    :cond_7
    if-eqz p1, :cond_f

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->size()I

    move-result v4

    if-nez v4, :cond_11

    .line 96
    :cond_f
    sget-object p1, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    .line 99
    :cond_11
    const/4 v5, -0x1

    .line 100
    .local v5, "startIndex":I
    const-string v13, ""

    .line 103
    .local v13, "fontKey":Ljava/lang/String;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v16, "removed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/iconics/Iconics$RemoveInfo;>;"
    new-instance v25, Ljava/lang/StringBuilder;

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 109
    .local v25, "text":Ljava/lang/StringBuilder;
    :cond_22
    const-string v4, "{"

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v4, -0x1

    if-eq v5, v4, :cond_38

    .line 111
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v6, v5, 0x5

    if-ge v4, v6, :cond_45

    .line 112
    const/4 v5, -0x1

    .line 126
    :cond_38
    :goto_38
    const/4 v4, -0x1

    if-ne v5, v4, :cond_6e

    .line 127
    new-instance v18, Landroid/text/SpannableString;

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 219
    :cond_44
    return-object v18

    .line 116
    :cond_45
    add-int/lit8 v4, v5, 0x4

    add-int/lit8 v6, v5, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v6, "-"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    .line 120
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v5, 0x4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v13

    .line 122
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22

    goto :goto_38

    .line 131
    :cond_6e
    const/16 v17, 0x0

    .line 133
    .local v17, "removedChars":I
    new-instance v24, Ljava/util/LinkedList;

    invoke-direct/range {v24 .. v24}, Ljava/util/LinkedList;-><init>()V

    .line 136
    .local v24, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/Iconics$StyleContainer;>;"
    :cond_75
    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v6, "}"

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v4, v5

    add-int/lit8 v11, v4, 0x1

    .line 137
    .local v11, "endIndex":I
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v11, -0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 138
    .local v7, "iconString":Ljava/lang/String;
    const-string v4, "-"

    const-string v6, "_"

    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 141
    :try_start_9a
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 143
    .local v26, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    if-eqz v26, :cond_188

    .line 144
    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v14

    .line 146
    .local v14, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v14, :cond_153

    .line 147
    invoke-interface {v14}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v12

    .line 148
    .local v12, "fontChar":C
    invoke-static {v12}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v15

    .line 151
    .local v15, "iconValue":Ljava/lang/String;
    move-object/from16 v0, v25

    invoke-virtual {v0, v5, v11, v15}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 154
    sub-int v4, v11, v5

    add-int v17, v17, v4

    .line 155
    new-instance v4, Lcom/mikepenz/iconics/Iconics$RemoveInfo;

    sub-int v6, v11, v5

    add-int/lit8 v6, v6, -0x1

    move/from16 v0, v17

    invoke-direct {v4, v5, v6, v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v4, Lcom/mikepenz/iconics/Iconics$StyleContainer;

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mikepenz/iconics/typeface/ITypeface;

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/mikepenz/iconics/Iconics$StyleContainer;-><init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/Iconics$1;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_e3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9a .. :try_end_e3} :catch_16d

    .line 170
    .end local v12    # "fontChar":C
    .end local v14    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v15    # "iconValue":Ljava/lang/String;
    .end local v26    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_e3
    const/4 v13, 0x0

    .line 173
    :cond_e4
    const-string v4, "{"

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v4, -0x1

    if-eq v5, v4, :cond_fa

    .line 175
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v6, v5, 0x5

    if-ge v4, v6, :cond_1a2

    .line 176
    const/4 v5, -0x1

    .line 189
    :cond_fa
    :goto_fa
    const/4 v4, -0x1

    if-eq v5, v4, :cond_ff

    if-nez v13, :cond_75

    .line 191
    :cond_ff
    new-instance v18, Landroid/text/SpannableString;

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 194
    .local v18, "sb":Landroid/text/SpannableString;
    const/4 v4, 0x0

    invoke-virtual/range {p2 .. p2}, Landroid/text/SpannableString;->length()I

    move-result v6

    const-class v8, Landroid/text/style/StyleSpan;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v6, v8}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/text/style/StyleSpan;

    array-length v8, v4

    const/4 v6, 0x0

    :goto_119
    if-ge v6, v8, :cond_1c8

    aget-object v19, v4, v6

    .line 195
    .local v19, "span":Landroid/text/style/StyleSpan;
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanStart(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v16

    invoke-static {v9, v0}, Lcom/mikepenz/iconics/Iconics;->newSpanPoint(ILjava/util/ArrayList;)I

    move-result v21

    .line 196
    .local v21, "spanStart":I
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanEnd(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v16

    invoke-static {v9, v0}, Lcom/mikepenz/iconics/Iconics;->newSpanPoint(ILjava/util/ArrayList;)I

    move-result v20

    .line 197
    .local v20, "spanEnd":I
    if-ltz v21, :cond_150

    if-lez v20, :cond_150

    .line 198
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanFlags(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v21

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 194
    :cond_150
    add-int/lit8 v6, v6, 0x1

    goto :goto_119

    .line 160
    .end local v18    # "sb":Landroid/text/SpannableString;
    .end local v19    # "span":Landroid/text/style/StyleSpan;
    .end local v20    # "spanEnd":I
    .end local v21    # "spanStart":I
    .restart local v14    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .restart local v26    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_153
    :try_start_153
    sget-object v4, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_16b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_153 .. :try_end_16b} :catch_16d

    goto/16 :goto_e3

    .line 165
    .end local v14    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v26    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :catch_16d
    move-exception v10

    .line 166
    .local v10, "e":Ljava/lang/IllegalArgumentException;
    sget-object v4, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong icon name: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e3

    .line 163
    .end local v10    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v26    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_188
    :try_start_188
    sget-object v4, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wrong fontId: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1a0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_188 .. :try_end_1a0} :catch_16d

    goto/16 :goto_e3

    .line 180
    .end local v26    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_1a2
    add-int/lit8 v4, v5, 0x4

    add-int/lit8 v6, v5, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v6, "-"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e4

    .line 182
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v5, 0x4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 184
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e4

    goto/16 :goto_fa

    .line 203
    .restart local v18    # "sb":Landroid/text/SpannableString;
    :cond_1c8
    invoke-virtual/range {v24 .. v24}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1cc
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/mikepenz/iconics/Iconics$StyleContainer;

    .line 204
    .local v23, "styleContainer":Lcom/mikepenz/iconics/Iconics$StyleContainer;
    new-instance v4, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;

    const-string v8, "sans-serif"

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getFont()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v9

    move-object/from16 v0, p0

    invoke-interface {v9, v0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v9

    invoke-direct {v4, v8, v9}, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getStartIndex()I

    move-result v8

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getEndIndex()I

    move-result v9

    const/16 v27, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v27

    invoke-virtual {v0, v4, v8, v9, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 206
    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getIcon()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23a

    .line 207
    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getIcon()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_216
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1cc

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/text/style/CharacterStyle;

    .line 208
    .local v22, "style":Landroid/text/style/CharacterStyle;
    invoke-static/range {v22 .. v22}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v8

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getStartIndex()I

    move-result v9

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getEndIndex()I

    move-result v27

    const/16 v28, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v8, v9, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    goto :goto_216

    .line 210
    .end local v22    # "style":Landroid/text/style/CharacterStyle;
    :cond_23a
    if-eqz p3, :cond_1cc

    .line 211
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_240
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1cc

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/text/style/CharacterStyle;

    .line 212
    .restart local v22    # "style":Landroid/text/style/CharacterStyle;
    invoke-static/range {v22 .. v22}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v8

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getStartIndex()I

    move-result v9

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getEndIndex()I

    move-result v27

    const/16 v28, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v8, v9, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    goto :goto_240
.end method
