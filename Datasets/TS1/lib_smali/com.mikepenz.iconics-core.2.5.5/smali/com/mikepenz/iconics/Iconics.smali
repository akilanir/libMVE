.class public final Lcom/mikepenz/iconics/Iconics;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
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
    .line 42
    const-class v0, Lcom/mikepenz/iconics/Iconics;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    return-void
.end method

.method public static findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-static {p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 113
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
    .line 123
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
    .line 100
    invoke-static {p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 101
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method private static init(Landroid/content/Context;Ljava/util/HashMap;)Ljava/util/HashMap;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    invoke-static {p0}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;)V

    .line 76
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v0

    if-nez v0, :cond_d

    .line 77
    :cond_b
    sget-object p1, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    .line 79
    :cond_d
    return-object p1
.end method

.method public static init(Landroid/content/Context;)V
    .registers 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 53
    sget-boolean v4, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    if-nez v4, :cond_41

    .line 54
    invoke-static {p0}, Lcom/mikepenz/iconics/utils/GenericsUtil;->getFields(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "fonts":[Ljava/lang/String;
    array-length v5, v1

    const/4 v4, 0x0

    :goto_a
    if-ge v4, v5, :cond_3e

    aget-object v2, v1, v4

    .line 57
    .local v2, "fontsClassPath":Ljava/lang/String;
    :try_start_e
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 58
    .local v3, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    sget-object v6, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-interface {v3}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_21} :catch_24

    .line 55
    .end local v3    # "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_21
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 59
    :catch_24
    move-exception v0

    .line 60
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

    goto :goto_21

    .line 63
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "fontsClassPath":Ljava/lang/String;
    :cond_3e
    const/4 v4, 0x1

    sput-boolean v4, Lcom/mikepenz/iconics/Iconics;->INIT_DONE:Z

    .line 65
    .end local v1    # "fonts":[Ljava/lang/String;
    :cond_41
    return-void
.end method

.method public static registerFont(Lcom/mikepenz/iconics/typeface/ITypeface;)Z
    .registers 3
    .param p0, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 89
    sget-object v0, Lcom/mikepenz/iconics/Iconics;->FONTS:Ljava/util/HashMap;

    invoke-interface {p0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method public static style(Landroid/content/Context;Landroid/text/Spanned;)Landroid/text/Spanned;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "textSpanned"    # Landroid/text/Spanned;

    .prologue
    const/4 v0, 0x0

    .line 140
    invoke-static {p0, v0, p1, v0, v0}, Lcom/mikepenz/iconics/Iconics;->style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Spanned;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/Spanned;

    move-result-object v0

    return-object v0
.end method

.method public static style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Spanned;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/Spanned;
    .registers 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p2, "textSpanned"    # Landroid/text/Spanned;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;",
            "Landroid/text/Spanned;",
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
            "Landroid/text/Spanned;"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p3, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p4, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    invoke-static {p0, p1}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object p1

    .line 159
    invoke-static {p2, p1}, Lcom/mikepenz/iconics/utils/IconicsUtils;->findIcons(Landroid/text/Spanned;Ljava/util/HashMap;)Lcom/mikepenz/iconics/utils/TextStyleContainer;

    move-result-object v1

    .line 162
    .local v1, "textStyleContainer":Lcom/mikepenz/iconics/utils/TextStyleContainer;
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/TextStyleContainer;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    invoke-static {v2}, Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;

    move-result-object v0

    .line 165
    .local v0, "sb":Landroid/text/SpannableString;
    iget-object v2, v1, Lcom/mikepenz/iconics/utils/TextStyleContainer;->styleContainers:Ljava/util/LinkedList;

    invoke-static {p0, v0, v2, p3, p4}, Lcom/mikepenz/iconics/utils/IconicsUtils;->applyStyles(Landroid/content/Context;Landroid/text/Spannable;Ljava/util/List;Ljava/util/List;Ljava/util/HashMap;)V

    .line 167
    return-object v0
.end method

.method public static styleEditable(Landroid/content/Context;Landroid/text/Editable;)V
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    const/4 v0, 0x0

    .line 178
    invoke-static {p0, v0, p1, v0, v0}, Lcom/mikepenz/iconics/Iconics;->styleEditable(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Editable;Ljava/util/List;Ljava/util/HashMap;)V

    .line 179
    return-void
.end method

.method public static styleEditable(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Editable;Ljava/util/List;Ljava/util/HashMap;)V
    .registers 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p2, "textSpanned"    # Landroid/text/Editable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;",
            "Landroid/text/Editable;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p1, "fonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p3, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p4, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    invoke-static {p0, p1}, Lcom/mikepenz/iconics/Iconics;->init(Landroid/content/Context;Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object p1

    .line 195
    invoke-static {p2, p1}, Lcom/mikepenz/iconics/utils/IconicsUtils;->findIconsFromEditable(Landroid/text/Editable;Ljava/util/HashMap;)Ljava/util/LinkedList;

    move-result-object v0

    .line 198
    .local v0, "styleContainers":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    invoke-static {p0, p2, v0, p3, p4}, Lcom/mikepenz/iconics/utils/IconicsUtils;->applyStyles(Landroid/content/Context;Landroid/text/Spannable;Ljava/util/List;Ljava/util/List;Ljava/util/HashMap;)V

    .line 199
    return-void
.end method
