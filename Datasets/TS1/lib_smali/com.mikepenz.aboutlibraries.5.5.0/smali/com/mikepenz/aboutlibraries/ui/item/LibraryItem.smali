.class public Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
.super Lcom/mikepenz/fastadapter/items/AbstractItem;
.source "LibraryItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;,
        Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/fastadapter/items/AbstractItem",
        "<",
        "Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;",
        "Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+",
            "Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public library:Lcom/mikepenz/aboutlibraries/entity/Library;

.field public libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

.field private rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ItemFactory;-><init>()V

    sput-object v0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;-><init>()V

    .line 30
    new-instance v0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    sget v1, Lcom/mikepenz/aboutlibraries/R$id;->rippleForegroundListenerView:I

    invoke-direct {v0, v1}, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    .line 305
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V
    .registers 4
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .param p3, "x3"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->openLicense(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/LibsBuilder;Lcom/mikepenz/aboutlibraries/entity/Library;)V

    return-void
.end method

.method private openAuthorWebsite(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "authorWebsite"    # Ljava/lang/String;

    .prologue
    .line 238
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 239
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 242
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :goto_e
    return-void

    .line 240
    :catch_f
    move-exception v1

    goto :goto_e
.end method

.method private openLibraryWebsite(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libraryWebsite"    # Ljava/lang/String;

    .prologue
    .line 252
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 253
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 256
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :goto_e
    return-void

    .line 254
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
    .line 267
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

    .line 268
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 269
    .local v1, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    invoke-virtual {p3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseDescription()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 270
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog;->show()V

    .line 277
    .end local v1    # "builder":Landroid/support/v7/app/AlertDialog$Builder;
    :goto_31
    return-void

    .line 272
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

    .line 273
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_48} :catch_49

    goto :goto_31

    .line 275
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :catch_49
    move-exception v2

    goto :goto_31
.end method


# virtual methods
.method public bridge synthetic bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2

    .prologue
    .line 27
    check-cast p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->bindView(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;)V

    return-void
.end method

.method public bindView(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;)V
    .registers 8
    .param p1, "holder"    # Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 79
    invoke-super {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 82
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 85
    .local v0, "ctx":Landroid/content/Context;
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11f

    .line 88
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    :goto_3a
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_72

    :cond_5e
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_130

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_130

    .line 95
    :cond_72
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 96
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 115
    :goto_7c
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getAuthorWebsite()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_19f

    .line 116
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 117
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$1;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$2;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$2;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 151
    :goto_a3
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryWebsite()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_bb

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getRepositoryLink()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1b0

    .line 152
    :cond_bb
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 153
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$3;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$4;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$4;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 187
    :goto_d6
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    if-eqz v1, :cond_1c1

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseWebsite()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1c1

    .line 188
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->rippleForegroundListener:Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 189
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$5;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$5;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$6;

    invoke-direct {v2, p0, v0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$6;-><init>(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 225
    :goto_109
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibsRecyclerViewListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    move-result-object v1

    if-eqz v1, :cond_11e

    .line 226
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getLibsRecyclerViewListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;->onBindViewHolder(Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;)V

    .line 228
    :cond_11e
    return-void

    .line 90
    :cond_11f
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3a

    .line 98
    :cond_130
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomDivider:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 99
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 101
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_18e

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_18e

    .line 102
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    :goto_15b
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    if-eqz v1, :cond_196

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_196

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_196

    .line 107
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7c

    .line 104
    :cond_18e
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryVersion:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_15b

    .line 109
    :cond_196
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryLicense:Landroid/widget/TextView;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7c

    .line 146
    :cond_19f
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 147
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryCreator:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_a3

    .line 182
    :cond_1b0
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 183
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryDescription:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_d6

    .line 218
    :cond_1c1
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 219
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    iget-object v1, p1, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;->libraryBottomContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_109
.end method

.method public getFactory()Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+",
            "Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 298
    sget-object v0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->FACTORY:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 64
    sget v0, Lcom/mikepenz/aboutlibraries/R$layout;->listitem_opensource:I

    return v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 54
    sget v0, Lcom/mikepenz/aboutlibraries/R$id;->library_item_id:I

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public withLibrary(Lcom/mikepenz/aboutlibraries/entity/Library;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
    .registers 2
    .param p1, "library"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->library:Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 36
    return-object p0
.end method

.method public withLibsBuilder(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;
    .registers 2
    .param p1, "libsBuilder"    # Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->libsBuilder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 44
    return-object p0
.end method
