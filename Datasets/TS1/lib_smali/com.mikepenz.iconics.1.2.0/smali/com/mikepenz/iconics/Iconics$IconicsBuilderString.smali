.class public Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/Iconics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IconicsBuilderString"
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field private fonts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;"
        }
    .end annotation
.end field

.field private text:Landroid/text/SpannableString;

.field private withStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private withStylesFor:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p3, "text"    # Landroid/text/SpannableString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 256
    .local p2, "fonts":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p4, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p5, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 257
    iput-object p1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->ctx:Landroid/content/Context;

    .line 258
    iput-object p2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->fonts:Ljava/util/List;

    .line 259
    iput-object p3, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->text:Landroid/text/SpannableString;

    .line 260
    iput-object p4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->withStyles:Ljava/util/List;

    .line 261
    iput-object p5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->withStylesFor:Ljava/util/HashMap;

    .line 262
    return-void
.end method


# virtual methods
.method public build()Landroid/text/SpannableString;
    .registers 7

    .prologue
    .line 265
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 266
    .local v1, "mappedFonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->fonts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 267
    .local v0, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    invoke-interface {v0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 269
    .end local v0    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_1f
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->text:Landroid/text/SpannableString;

    iget-object v4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->withStyles:Ljava/util/List;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->withStylesFor:Ljava/util/HashMap;

    # invokes: Lcom/mikepenz/iconics/Iconics;->style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;
    invoke-static {v2, v1, v3, v4, v5}, Lcom/mikepenz/iconics/Iconics;->access$100(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/SpannableString;

    move-result-object v2

    return-object v2
.end method
