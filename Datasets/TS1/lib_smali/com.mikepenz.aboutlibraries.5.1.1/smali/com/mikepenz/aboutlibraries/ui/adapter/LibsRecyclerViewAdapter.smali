.class public Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "LibsRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;,
        Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final TYPE_HEADER:I = 0x0

.field private static final TYPE_ITEM:I = 0x1


# instance fields
.field private aboutIcon:Landroid/graphics/drawable/Drawable;

.field private aboutVersionCode:Ljava/lang/Integer;

.field private aboutVersionName:Ljava/lang/String;

.field private header:Z

.field private libs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

.field private rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;


# direct methods
.method public constructor <init>(Lcom/mikepenz/aboutlibraries/LibsBuilder;)V
    .registers 4
    .param p1, "libsBuilder"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 35
    new-instance v0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    sget v1, Lcom/mikepenz/aboutlibraries/R$id;->rippleForegroundListenerView:I

    invoke-direct {v0, v1}, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    .line 37
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->header:Z

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 47
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V
    .registers 4
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .param p3, "x3"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->openLicense(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V

    return-void
.end method

.method private openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "authorWebsite"    # Ljava/lang/String;

    .prologue
    .line 355
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 356
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 359
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :goto_e
    return-void

    .line 357
    :catch_f
    move-exception v1

    goto :goto_e
.end method

.method private openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libraryWebsite"    # Ljava/lang/String;

    .prologue
    .line 369
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 370
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 373
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :goto_e
    return-void

    .line 371
    :catch_f
    move-exception v1

    goto :goto_e
.end method

.method private openLicense(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libsBuilder"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .param p3, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 384
    :try_start_0
    iget-object v2, p2, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicenseDialog:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-virtual {p3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseDescription()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_32

    .line 385
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 386
    .local v1, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    invoke-virtual {p3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseDescription()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 387
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog;->show()V

    .line 394
    .end local v1    # "builder":Landroid/support/v7/app/AlertDialog$Builder;
    :goto_31
    return-void

    .line 389
    :cond_32
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {p3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseWebsite()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 390
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_48} :catch_49

    goto :goto_31

    .line 392
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :catch_49
    move-exception v2

    goto :goto_31
.end method


# virtual methods
.method public addLibs(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 424
    .local p1, "libs":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 425
    return-void
.end method

.method public deleteHeader()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 437
    iget-boolean v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->header:Z

    if-eqz v0, :cond_12

    .line 438
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_12

    .line 439
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 442
    :cond_12
    iput-boolean v1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->header:Z

    .line 443
    return-void
.end method

.method public getItem(I)Lcom/mikepenz/aboutlibraries/entity/Library;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 411
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/entity/Library;

    return-object v0
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 407
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "pos"    # I

    .prologue
    .line 415
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 398
    if-nez p1, :cond_8

    iget-boolean v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->header:Z

    if-eqz v0, :cond_8

    .line 399
    const/4 v0, 0x0

    .line 402
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 11
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x8

    .line 63
    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 64
    .local v0, "ctx":Landroid/content/Context;
    instance-of v3, p1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;

    if-eqz v3, :cond_206

    move-object v1, p1

    .line 65
    check-cast v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;

    .line 68
    .local v1, "holder":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_17e

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_17e

    .line 69
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutIcon:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutIcon:Landroid/widget/ImageView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$1;

    invoke-direct {v4, p0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$1;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutIcon:Landroid/widget/ImageView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$2;

    invoke-direct {v4, p0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$2;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 91
    :goto_3a
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_185

    .line 92
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppName:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    :goto_4d
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 99
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial1:Landroid/widget/Button;

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 100
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial2:Landroid/widget/Button;

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 101
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial3:Landroid/widget/Button;

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 104
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_92

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_92

    .line 105
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial1:Landroid/widget/Button;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial1:Landroid/widget/Button;

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 107
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial1:Landroid/widget/Button;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;

    invoke-direct {v4, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$3;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 127
    :cond_92
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c3

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_c3

    .line 128
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial2:Landroid/widget/Button;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 129
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial2:Landroid/widget/Button;

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 130
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial2:Landroid/widget/Button;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$4;

    invoke-direct {v4, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$4;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 150
    :cond_c3
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_f4

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_f4

    .line 151
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial3:Landroid/widget/Button;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 152
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial3:Landroid/widget/Button;

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 153
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecial3:Landroid/widget/Button;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$5;

    invoke-direct {v4, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$5;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutSpecialContainer:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 176
    :cond_f4
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    if-eqz v3, :cond_18c

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_18c

    .line 177
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionCode:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    :goto_13a
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1ff

    .line 190
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v4, v4, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-static {}, Lcom/mikepenz/aboutlibraries/util/MovementCheck;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 197
    :goto_15a
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_16e

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_178

    :cond_16e
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_17d

    .line 198
    :cond_178
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutDivider:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 345
    .end local v1    # "holder":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
    :cond_17d
    :goto_17d
    return-void

    .line 87
    .restart local v1    # "holder":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
    :cond_17e
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutIcon:Landroid/widget/ImageView;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_3a

    .line 94
    :cond_185
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppName:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4d

    .line 179
    :cond_18c
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    if-eqz v3, :cond_1c2

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1c2

    .line 180
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_13a

    .line 181
    :cond_1c2
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    if-eqz v3, :cond_1f8

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1f8

    .line 182
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/mikepenz/aboutlibraries/R$string;->version:I

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionCode:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_13a

    .line 184
    :cond_1f8
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutVersion:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_13a

    .line 193
    :cond_1ff
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;->aboutAppDescription:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_15a

    .line 200
    .end local v1    # "holder":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;
    :cond_206
    instance-of v3, p1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;

    if-eqz v3, :cond_17d

    move-object v1, p1

    .line 201
    check-cast v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;

    .line 203
    .local v1, "holder":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;
    invoke-virtual {p0, p2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->getItem(I)Lcom/mikepenz/aboutlibraries/entity/Library;

    move-result-object v2

    .line 206
    .local v2, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryName:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2f7

    .line 209
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    :goto_236
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_254

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    if-eqz v3, :cond_254

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_268

    :cond_254
    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_306

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_306

    .line 216
    :cond_268
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 217
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 236
    :goto_272
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthorWebsite()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_36b

    .line 237
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 238
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$6;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$6;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$7;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 272
    :goto_297
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2ab

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getRepositoryLink()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_37c

    .line 273
    :cond_2ab
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 274
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$8;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$9;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$9;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 308
    :goto_2c6
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    if-eqz v3, :cond_38d

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseWebsite()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_38d

    .line 309
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 310
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$10;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 323
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    new-instance v4, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;

    invoke-direct {v4, p0, v2, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$11;-><init>(Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;Lcom/mikepenz/aboutlibraries/entity/Library;Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_17d

    .line 211
    :cond_2f7
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_236

    .line 219
    :cond_306
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 220
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 222
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_35a

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_35a

    .line 223
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    :goto_32d
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    if-eqz v3, :cond_362

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_362

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v3, v3, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_362

    .line 228
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_272

    .line 225
    :cond_35a
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_32d

    .line 230
    :cond_362
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_272

    .line 267
    :cond_36b
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 268
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_297

    .line 303
    :cond_37c
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 304
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 305
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_2c6

    .line 339
    :cond_38d
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 340
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 341
    iget-object v3, v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_17d
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v3, 0x0

    .line 52
    if-nez p2, :cond_17

    .line 53
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$layout;->listheader_opensource:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 54
    .local v0, "v":Landroid/view/View;
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;

    invoke-direct {v1, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$HeaderViewHolder;-><init>(Landroid/view/View;)V

    .line 58
    :goto_16
    return-object v1

    .line 57
    .end local v0    # "v":Landroid/view/View;
    :cond_17
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$layout;->listitem_opensource:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 58
    .restart local v0    # "v":Landroid/view/View;
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_16
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/Integer;Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p1, "aboutVersionName"    # Ljava/lang/String;
    .param p2, "aboutVersionCode"    # Ljava/lang/Integer;
    .param p3, "aboutIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v2, 0x0

    .line 428
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->header:Z

    .line 429
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 430
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionName:Ljava/lang/String;

    .line 431
    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutVersionCode:Ljava/lang/Integer;

    .line 432
    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->aboutIcon:Landroid/graphics/drawable/Drawable;

    .line 433
    invoke-virtual {p0, v2}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->notifyItemInserted(I)V

    .line 434
    return-void
.end method

.method public setLibs(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 419
    .local p1, "libs":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->libs:Ljava/util/List;

    .line 420
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->notifyItemRangeInserted(II)V

    .line 421
    return-void
.end method
