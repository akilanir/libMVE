.class public Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
.super Lcom/mikepenz/fastadapter/items/AbstractItem;
.source "HeaderItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;,
        Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/fastadapter/items/AbstractItem",
        "<",
        "Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;",
        "Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+",
            "Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private aboutIcon:Landroid/graphics/drawable/Drawable;

.field private aboutVersionCode:Ljava/lang/Integer;

.field private aboutVersionName:Ljava/lang/String;

.field public libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

.field private rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    new-instance v0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ItemFactory;-><init>()V

    sput-object v0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;-><init>()V

    .line 32
    new-instance v0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    sget v1, Lcom/mikepenz/aboutlibraries/R$id;->rippleForegroundListenerView:I

    invoke-direct {v0, v1}, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    .line 270
    return-void
.end method


# virtual methods
.method public bridge synthetic bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2

    .prologue
    .line 29
    check-cast p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->bindView(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;)V

    return-void
.end method

.method public bindView(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;)V
    .registers 7
    .param p1, "holder"    # Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;

    .prologue
    const/4 v3, 0x0

    const/16 v4, 0x8

    .line 92
    invoke-super {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 95
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 98
    .local v0, "ctx":Landroid/content/Context;
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    if-eqz v1, :cond_1c3

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1c3

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1c3

    .line 99
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutIcon:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 100
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutIcon:Landroid/widget/ImageView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$1;

    invoke-direct {v2, p0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$1;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutIcon:Landroid/widget/ImageView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$2;

    invoke-direct {v2, p0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$2;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 121
    :goto_3b
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1ca

    .line 122
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    :goto_4e
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 129
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 130
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 131
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 134
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_af

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_80

    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_af

    .line 135
    :cond_80
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 136
    new-instance v1, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/Button;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    .line 137
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 138
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial1:Landroid/widget/Button;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$3;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$3;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 158
    :cond_af
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_fc

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_cd

    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_fc

    .line 159
    :cond_cd
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 160
    new-instance v1, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/Button;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    .line 161
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 162
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial2:Landroid/widget/Button;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$4;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$4;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 182
    :cond_fc
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_149

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11a

    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    move-result-object v1

    if-eqz v1, :cond_149

    .line 183
    :cond_11a
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 184
    new-instance v1, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/Button;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    .line 185
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 186
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecial3:Landroid/widget/Button;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$5;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 209
    :cond_149
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutVersionString:Ljava/lang/String;

    if-eqz v1, :cond_1d1

    .line 210
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutVersionString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    :goto_158
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_28c

    .line 227
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v2, v2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    new-instance v1, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Landroid/widget/TextView;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderView;->build()V

    .line 229
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-static {}, Lcom/mikepenz/aboutlibraries/util/MovementCheck;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 235
    :goto_18a
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_19e

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1a8

    :cond_19e
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1ad

    .line 236
    :cond_1a8
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutDivider:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 240
    :cond_1ad
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibsRecyclerViewListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    move-result-object v1

    if-eqz v1, :cond_1c2

    .line 241
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibsRecyclerViewListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;->onBindViewHolder(Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;)V

    .line 243
    :cond_1c2
    return-void

    .line 117
    :cond_1c3
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutIcon:Landroid/widget/ImageView;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_3b

    .line 124
    :cond_1ca
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppName:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4e

    .line 212
    :cond_1d1
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    if-eqz v1, :cond_219

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_219

    .line 213
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionCode:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_158

    .line 215
    :cond_219
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    if-eqz v1, :cond_24f

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_24f

    .line 216
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_158

    .line 217
    :cond_24f
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    if-eqz v1, :cond_285

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_285

    .line 218
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionCode:Ljava/lang/Integer;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_158

    .line 220
    :cond_285
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutVersion:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_158

    .line 231
    :cond_28c
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_18a
.end method

.method public getFactory()Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+",
            "Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 263
    sget-object v0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 82
    sget v0, Lcom/mikepenz/aboutlibraries/R$layout;->listheader_opensource:I

    return v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 72
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->header_item_id:I

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public withAboutIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
    .registers 2
    .param p1, "aboutIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutIcon:Landroid/graphics/drawable/Drawable;

    .line 50
    return-object p0
.end method

.method public withAboutVersionCode(Ljava/lang/Integer;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
    .registers 2
    .param p1, "aboutVersionCode"    # Ljava/lang/Integer;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionCode:Ljava/lang/Integer;

    .line 40
    return-object p0
.end method

.method public withAboutVersionName(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
    .registers 2
    .param p1, "aboutVersionName"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->aboutVersionName:Ljava/lang/String;

    .line 45
    return-object p0
.end method

.method public withLibsBuilder(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;
    .registers 2
    .param p1, "libsBuilder"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/HeaderItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 57
    return-object p0
.end method
