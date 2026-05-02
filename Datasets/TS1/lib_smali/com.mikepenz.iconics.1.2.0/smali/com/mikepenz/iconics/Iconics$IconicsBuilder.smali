.class public Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/Iconics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IconicsBuilder"
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

.field private styles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/text/style/CharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private stylesFor:Ljava/util/HashMap;
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
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 310
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styles:Ljava/util/List;

    .line 311
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    .line 312
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->fonts:Ljava/util/List;

    .line 316
    return-void
.end method


# virtual methods
.method public ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
    .registers 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 319
    iput-object p1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx:Landroid/content/Context;

    .line 320
    return-object p0
.end method

.method public font(Lcom/mikepenz/iconics/typeface/ITypeface;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
    .registers 3
    .param p1, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 350
    iget-object v0, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->fonts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    return-object p0
.end method

.method public on(Landroid/text/SpannableString;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
    .registers 8
    .param p1, "on"    # Landroid/text/SpannableString;

    .prologue
    .line 356
    new-instance v0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;

    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->fonts:Ljava/util/List;

    iget-object v4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styles:Ljava/util/List;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/text/SpannableString;Ljava/util/List;Ljava/util/HashMap;)V

    return-object v0
.end method

.method public on(Ljava/lang/CharSequence;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
    .registers 3
    .param p1, "on"    # Ljava/lang/CharSequence;

    .prologue
    .line 364
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Ljava/lang/String;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;

    move-result-object v0

    return-object v0
.end method

.method public on(Ljava/lang/String;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
    .registers 3
    .param p1, "on"    # Ljava/lang/String;

    .prologue
    .line 360
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/text/SpannableString;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;

    move-result-object v0

    return-object v0
.end method

.method public on(Ljava/lang/StringBuilder;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;
    .registers 3
    .param p1, "on"    # Ljava/lang/StringBuilder;

    .prologue
    .line 368
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Ljava/lang/String;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;

    move-result-object v0

    return-object v0
.end method

.method public on(Landroid/widget/Button;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;
    .registers 8
    .param p1, "on"    # Landroid/widget/Button;

    .prologue
    .line 376
    new-instance v0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->fonts:Ljava/util/List;

    iget-object v4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styles:Ljava/util/List;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/TextView;Ljava/util/List;Ljava/util/HashMap;)V

    return-object v0
.end method

.method public on(Landroid/widget/TextView;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;
    .registers 8
    .param p1, "on"    # Landroid/widget/TextView;

    .prologue
    .line 372
    new-instance v0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->fonts:Ljava/util/List;

    iget-object v4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styles:Ljava/util/List;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/TextView;Ljava/util/List;Ljava/util/HashMap;)V

    return-object v0
.end method

.method public varargs style([Landroid/text/style/CharacterStyle;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
    .registers 3
    .param p1, "styles"    # [Landroid/text/style/CharacterStyle;

    .prologue
    .line 324
    if-eqz p1, :cond_a

    array-length v0, p1

    if-lez v0, :cond_a

    .line 325
    iget-object v0, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styles:Ljava/util/List;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 327
    :cond_a
    return-object p0
.end method

.method public varargs styleFor(Lcom/mikepenz/iconics/typeface/IIcon;[Landroid/text/style/CharacterStyle;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
    .registers 4
    .param p1, "styleFor"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .param p2, "styles"    # [Landroid/text/style/CharacterStyle;

    .prologue
    .line 331
    invoke-interface {p1}, Lcom/mikepenz/iconics/typeface/IIcon;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->styleFor(Ljava/lang/String;[Landroid/text/style/CharacterStyle;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs styleFor(Ljava/lang/String;[Landroid/text/style/CharacterStyle;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;
    .registers 7
    .param p1, "styleFor"    # Ljava/lang/String;
    .param p2, "styles"    # [Landroid/text/style/CharacterStyle;

    .prologue
    .line 335
    const-string v1, "-"

    const-string v2, "_"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 337
    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 338
    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    :cond_1a
    if-eqz p2, :cond_35

    array-length v1, p2

    if-lez v1, :cond_35

    .line 342
    array-length v3, p2

    const/4 v1, 0x0

    move v2, v1

    :goto_22
    if-ge v2, v3, :cond_35

    aget-object v0, p2, v2

    .line 343
    .local v0, "style":Landroid/text/style/CharacterStyle;
    iget-object v1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->stylesFor:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_22

    .line 346
    .end local v0    # "style":Landroid/text/style/CharacterStyle;
    :cond_35
    return-object p0
.end method
