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

.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 42
    const-class v2, Lcom/mikepenz/iconics/Iconics;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    .line 44
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    .line 48
    new-instance v0, Lcom/mikepenz/iconics/typeface/FontAwesome;

    invoke-direct {v0}, Lcom/mikepenz/iconics/typeface/FontAwesome;-><init>()V

    .line 49
    .local v0, "fa":Lcom/mikepenz/iconics/typeface/FontAwesome;
    sget-object v2, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/mikepenz/iconics/typeface/FontAwesome;->getMappingPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance v1, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;

    invoke-direct {v1}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;-><init>()V

    .line 51
    .local v1, "gm":Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;
    sget-object v2, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/mikepenz/google_material_typeface_library/GoogleMaterial;->getMappingPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
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
    .line 41
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

    .line 206
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;

    .line 207
    .local v0, "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v3

    if-gt p0, v3, :cond_5

    .line 211
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

    .line 222
    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    .end local p0    # "pos":I
    :cond_29
    :goto_29
    return p0

    .line 215
    .restart local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    .restart local p0    # "pos":I
    :cond_2a
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v1

    if-lt p0, v1, :cond_29

    .line 218
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getTotal()I

    move-result v1

    sub-int/2addr p0, v1

    goto :goto_29

    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_36
    move p0, v1

    .line 222
    goto :goto_29
.end method

.method public static findFont(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 2
    .param p0, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 67
    invoke-interface {p0}, Lcom/mikepenz/iconics/typeface/IIcon;->getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    return-object v0
.end method

.method public static findFont(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 63
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/typeface/ITypeface;

    return-object v0
.end method

.method public static getRegisteredFonts()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
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
    .line 195
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

    .line 196
    .local v0, "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getStart()I

    move-result v2

    if-ge p0, v2, :cond_17

    .line 202
    .end local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_16
    return p0

    .line 200
    .restart local v0    # "removeInfo":Lcom/mikepenz/iconics/Iconics$RemoveInfo;
    :cond_17
    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->getCount()I

    move-result v2

    sub-int/2addr p0, v2

    .line 201
    goto :goto_4
.end method

.method public static registerFont(Lcom/mikepenz/iconics/typeface/ITypeface;)V
    .registers 3
    .param p0, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 55
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-interface {p0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    return-void
.end method

.method private static style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;
    .registers 33
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
    .line 75
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p3, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p4, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    if-eqz p1, :cond_8

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->size()I

    move-result v4

    if-nez v4, :cond_a

    .line 76
    :cond_8
    sget-object p1, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    .line 79
    :cond_a
    const/4 v5, -0x1

    .line 80
    .local v5, "startIndex":I
    const-string v13, ""

    .line 83
    .local v13, "fontKey":Ljava/lang/String;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v16, "removed":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/iconics/Iconics$RemoveInfo;>;"
    new-instance v25, Ljava/lang/StringBuilder;

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 89
    .local v25, "text":Ljava/lang/StringBuilder;
    :cond_1b
    const-string v4, "{"

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v4, -0x1

    if-eq v5, v4, :cond_31

    .line 91
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v6, v5, 0x5

    if-ge v4, v6, :cond_3e

    .line 92
    const/4 v5, -0x1

    .line 106
    :cond_31
    :goto_31
    const/4 v4, -0x1

    if-ne v5, v4, :cond_63

    .line 107
    new-instance v18, Landroid/text/SpannableString;

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 191
    :cond_3d
    return-object v18

    .line 96
    :cond_3e
    add-int/lit8 v4, v5, 0x4

    add-int/lit8 v6, v5, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v6, "-"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    .line 100
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v5, 0x4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 102
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    goto :goto_31

    .line 111
    :cond_63
    const/16 v17, 0x0

    .line 113
    .local v17, "removedChars":I
    new-instance v24, Ljava/util/LinkedList;

    invoke-direct/range {v24 .. v24}, Ljava/util/LinkedList;-><init>()V

    .line 116
    .local v24, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/Iconics$StyleContainer;>;"
    :cond_6a
    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string v6, "}"

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v4, v5

    add-int/lit8 v11, v4, 0x1

    .line 117
    .local v11, "endIndex":I
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v11, -0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 118
    .local v7, "iconString":Ljava/lang/String;
    const-string v4, "-"

    const-string v6, "_"

    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 121
    :try_start_8b
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/iconics/typeface/ITypeface;

    invoke-interface {v4, v7}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v14

    .line 123
    .local v14, "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    if-eqz v14, :cond_d0

    .line 124
    invoke-interface {v14}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v12

    .line 125
    .local v12, "fontChar":C
    invoke-static {v12}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v15

    .line 128
    .local v15, "iconValue":Ljava/lang/String;
    move-object/from16 v0, v25

    invoke-virtual {v0, v5, v11, v15}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 131
    sub-int v4, v11, v5

    add-int v17, v17, v4

    .line 132
    new-instance v4, Lcom/mikepenz/iconics/Iconics$RemoveInfo;

    sub-int v6, v11, v5

    add-int/lit8 v6, v6, -0x1

    move/from16 v0, v17

    invoke-direct {v4, v5, v6, v0}, Lcom/mikepenz/iconics/Iconics$RemoveInfo;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
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
    :try_end_d0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8b .. :try_end_d0} :catch_140

    .line 142
    .end local v12    # "fontChar":C
    .end local v14    # "icon":Lcom/mikepenz/iconics/typeface/IIcon;
    .end local v15    # "iconValue":Ljava/lang/String;
    :cond_d0
    :goto_d0
    const/4 v13, 0x0

    .line 145
    :cond_d1
    const-string v4, "{"

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v4, -0x1

    if-eq v5, v4, :cond_e7

    .line 147
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v6, v5, 0x5

    if-ge v4, v6, :cond_15b

    .line 148
    const/4 v5, -0x1

    .line 161
    :cond_e7
    :goto_e7
    const/4 v4, -0x1

    if-eq v5, v4, :cond_ec

    if-nez v13, :cond_6a

    .line 163
    :cond_ec
    new-instance v18, Landroid/text/SpannableString;

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 166
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

    :goto_106
    if-ge v6, v8, :cond_181

    aget-object v19, v4, v6

    .line 167
    .local v19, "span":Landroid/text/style/StyleSpan;
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanStart(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v16

    invoke-static {v9, v0}, Lcom/mikepenz/iconics/Iconics;->newSpanPoint(ILjava/util/ArrayList;)I

    move-result v21

    .line 168
    .local v21, "spanStart":I
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanEnd(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v16

    invoke-static {v9, v0}, Lcom/mikepenz/iconics/Iconics;->newSpanPoint(ILjava/util/ArrayList;)I

    move-result v20

    .line 169
    .local v20, "spanEnd":I
    if-ltz v21, :cond_13d

    if-lez v20, :cond_13d

    .line 170
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/text/SpannableString;->getSpanFlags(Ljava/lang/Object;)I

    move-result v9

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v21

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 166
    :cond_13d
    add-int/lit8 v6, v6, 0x1

    goto :goto_106

    .line 137
    .end local v18    # "sb":Landroid/text/SpannableString;
    .end local v19    # "span":Landroid/text/style/StyleSpan;
    .end local v20    # "spanEnd":I
    .end local v21    # "spanStart":I
    :catch_140
    move-exception v10

    .line 138
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

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d0

    .line 152
    .end local v10    # "e":Ljava/lang/IllegalArgumentException;
    :cond_15b
    add-int/lit8 v4, v5, 0x4

    add-int/lit8 v6, v5, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v6, "-"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d1

    .line 154
    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v6, v5, 0x4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 156
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d1

    goto/16 :goto_e7

    .line 175
    .restart local v18    # "sb":Landroid/text/SpannableString;
    :cond_181
    invoke-virtual/range {v24 .. v24}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_185
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/mikepenz/iconics/Iconics$StyleContainer;

    .line 176
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

    const/16 v26, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v26

    invoke-virtual {v0, v4, v8, v9, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 178
    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getIcon()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f3

    .line 179
    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getIcon()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1cf
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_185

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/text/style/CharacterStyle;

    .line 180
    .local v22, "style":Landroid/text/style/CharacterStyle;
    invoke-static/range {v22 .. v22}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v8

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getStartIndex()I

    move-result v9

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getEndIndex()I

    move-result v26

    const/16 v27, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v8, v9, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1cf

    .line 182
    .end local v22    # "style":Landroid/text/style/CharacterStyle;
    :cond_1f3
    if-eqz p3, :cond_185

    .line 183
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1f9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_185

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/text/style/CharacterStyle;

    .line 184
    .restart local v22    # "style":Landroid/text/style/CharacterStyle;
    invoke-static/range {v22 .. v22}, Landroid/text/style/CharacterStyle;->wrap(Landroid/text/style/CharacterStyle;)Landroid/text/style/CharacterStyle;

    move-result-object v8

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getStartIndex()I

    move-result v9

    invoke-virtual/range {v23 .. v23}, Lcom/mikepenz/iconics/Iconics$StyleContainer;->getEndIndex()I

    move-result v26

    const/16 v27, 0x21

    move-object/from16 v0, v18

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v8, v9, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    goto :goto_1f9
.end method
