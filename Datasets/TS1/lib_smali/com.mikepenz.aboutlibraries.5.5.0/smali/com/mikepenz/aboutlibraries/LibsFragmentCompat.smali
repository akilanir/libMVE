.class public Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;
.super Ljava/lang/Object;
.source "LibsFragmentCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;
    }
.end annotation


# static fields
.field private static libraries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

.field private comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

.field private mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 6
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p3, "x3"    # Ljava/lang/Boolean;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/ArrayList;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 1
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 33
    sput-object p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->libraries:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$400(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Ljava/util/Comparator;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    return-object v0
.end method

.method private extractBooleanBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/Boolean;Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libs"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p3, "value"    # Ljava/lang/Boolean;
    .param p4, "resName"    # Ljava/lang/String;

    .prologue
    .line 263
    const/4 v1, 0x0

    .line 264
    .local v1, "result":Ljava/lang/Boolean;
    if-eqz p3, :cond_5

    .line 265
    move-object v1, p3

    .line 275
    :cond_4
    :goto_4
    return-object v1

    .line 267
    :cond_5
    invoke-virtual {p2, p1, p4}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 268
    .local v0, "descriptionShowVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 270
    :try_start_f
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_16} :catch_18

    move-result-object v1

    goto :goto_4

    .line 271
    :catch_18
    move-exception v2

    goto :goto_4
.end method

.method private extractStringBundleOrResource(Landroid/content/Context;Lcom/mikepenz/aboutlibraries/Libs;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libs"    # Lcom/mikepenz/aboutlibraries/Libs;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "resName"    # Ljava/lang/String;

    .prologue
    .line 287
    const/4 v1, 0x0

    .line 288
    .local v1, "result":Ljava/lang/String;
    if-eqz p3, :cond_5

    .line 289
    move-object v1, p3

    .line 296
    :cond_4
    :goto_4
    return-object v1

    .line 291
    :cond_5
    invoke-virtual {p2, p1, p4}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 292
    .local v0, "descriptionShowVersion":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 293
    move-object v1, v0

    goto :goto_4
.end method


# virtual methods
.method protected executeLibTask(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;)V
    .registers 5
    .param p1, "libraryTask"    # Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    .prologue
    const/4 v2, 0x0

    .line 104
    if-eqz p1, :cond_1d

    .line 105
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_2e

    .line 106
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$1;->$SwitchMap$com$mikepenz$aboutlibraries$LibTaskExecutor:[I

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iget-object v1, v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libTaskExecutor:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_34

    .line 115
    new-array v0, v2, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 122
    :cond_1d
    :goto_1d
    return-void

    .line 108
    :pswitch_1e
    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1d

    .line 111
    :pswitch_26
    sget-object v0, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1d

    .line 119
    :cond_2e
    new-array v0, v2, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1d

    .line 106
    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_26
    .end packed-switch
.end method

.method public onCreateView(Landroid/content/Context;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "inflater"    # Landroid/view/LayoutInflater;
    .param p3, "container"    # Landroid/view/ViewGroup;
    .param p4, "savedInstanceState"    # Landroid/os/Bundle;
    .param p5, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 54
    if-eqz p5, :cond_80

    .line 55
    const-string v1, "data"

    invoke-virtual {p5, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/aboutlibraries/LibsBuilder;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    .line 60
    :goto_c
    sget v1, Lcom/mikepenz/aboutlibraries/R$layout;->fragment_opensource:I

    const/4 v2, 0x0

    invoke-virtual {p2, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 63
    .local v0, "view":Landroid/view/View;
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 64
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;->preOnCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 68
    :cond_29
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/mikepenz/aboutlibraries/R$id;->cardListView:I

    if-ne v1, v2, :cond_88

    move-object v1, v0

    .line 69
    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 73
    :goto_36
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v2, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 75
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v1

    if-eqz v1, :cond_93

    .line 76
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    .line 81
    :goto_57
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    if-eqz v1, :cond_69

    .line 82
    new-instance v1, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    invoke-direct {v1}, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;-><init>()V

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    .line 83
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mAdapter:Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 87
    :cond_69
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    if-eqz v1, :cond_7f

    .line 88
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getUiListener()Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;->postOnCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 91
    :cond_7f
    return-object v0

    .line 57
    .end local v0    # "view":Landroid/view/View;
    :cond_80
    const-string v1, "AboutLibraries"

    const-string v2, "The AboutLibraries fragment can\'t be build without the bundle containing the LibsBuilder"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 71
    .restart local v0    # "view":Landroid/view/View;
    :cond_88
    sget v1, Lcom/mikepenz/aboutlibraries/R$id;->cardListView:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    goto :goto_36

    .line 78
    :cond_93
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/DefaultItemAnimator;

    invoke-direct {v2}, Landroid/support/v7/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    goto :goto_57
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 126
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    if-eqz v0, :cond_d

    .line 127
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;->cancel(Z)Z

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    .line 130
    :cond_d
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->builder:Lcom/mikepenz/aboutlibraries/LibsBuilder;

    if-eqz v0, :cond_1a

    .line 98
    new-instance v0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;-><init>(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    .line 99
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->mLibTask:Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;

    invoke-virtual {p0, v0}, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->executeLibTask(Lcom/mikepenz/aboutlibraries/LibsFragmentCompat$LibraryTask;)V

    .line 101
    :cond_1a
    return-void
.end method

.method public setLibraryComparator(Ljava/util/Comparator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsFragmentCompat;->comparator:Ljava/util/Comparator;

    .line 51
    return-void
.end method
