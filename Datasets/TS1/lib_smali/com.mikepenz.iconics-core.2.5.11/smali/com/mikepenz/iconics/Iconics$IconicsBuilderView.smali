.class public Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/Iconics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IconicsBuilderView"
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

.field private view:Landroid/widget/TextView;

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
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/TextView;Ljava/util/List;Ljava/util/HashMap;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p3, "view"    # Landroid/widget/TextView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/iconics/typeface/ITypeface;",
            ">;",
            "Landroid/widget/TextView;",
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
    .line 232
    .local p2, "fonts":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    .local p4, "styles":Ljava/util/List;, "Ljava/util/List<Landroid/text/style/CharacterStyle;>;"
    .local p5, "stylesFor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Landroid/text/style/CharacterStyle;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    iput-object p1, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->ctx:Landroid/content/Context;

    .line 234
    iput-object p2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->fonts:Ljava/util/List;

    .line 235
    iput-object p3, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    .line 236
    iput-object p4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStyles:Ljava/util/List;

    .line 237
    iput-object p5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStylesFor:Ljava/util/HashMap;

    .line 238
    return-void
.end method


# virtual methods
.method public build()V
    .registers 8

    .prologue
    .line 241
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 242
    .local v1, "mappedFonts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;>;"
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->fonts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 243
    .local v0, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    invoke-interface {v0}, Lcom/mikepenz/iconics/typeface/ITypeface;->getMappingPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 252
    .end local v0    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :cond_1f
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    instance-of v2, v2, Landroid/text/Spanned;

    if-eqz v2, :cond_53

    .line 253
    iget-object v3, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    check-cast v2, Landroid/text/Spanned;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStyles:Ljava/util/List;

    iget-object v6, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStylesFor:Ljava/util/HashMap;

    invoke-static {v4, v1, v2, v5, v6}, Lcom/mikepenz/iconics/Iconics;->style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Spanned;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 258
    :goto_40
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_52

    .line 259
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    instance-of v2, v2, Landroid/widget/Button;

    if-eqz v2, :cond_52

    .line 260
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 263
    :cond_52
    return-void

    .line 255
    :cond_53
    iget-object v2, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->ctx:Landroid/content/Context;

    new-instance v4, Landroid/text/SpannableString;

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->view:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStyles:Ljava/util/List;

    iget-object v6, p0, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->withStylesFor:Ljava/util/HashMap;

    invoke-static {v3, v1, v4, v5, v6}, Lcom/mikepenz/iconics/Iconics;->style(Landroid/content/Context;Ljava/util/HashMap;Landroid/text/Spanned;Ljava/util/List;Ljava/util/HashMap;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_40
.end method
