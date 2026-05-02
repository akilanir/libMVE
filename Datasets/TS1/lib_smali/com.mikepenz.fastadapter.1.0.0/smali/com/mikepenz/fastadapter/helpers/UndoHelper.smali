.class public Lcom/mikepenz/fastadapter/helpers/UndoHelper;
.super Ljava/lang/Object;
.source "UndoHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;,
        Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ACTION_REMOVE:I = 0x2


# instance fields
.field private mAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/helpers/UndoHelper",
            "<TItem;>.History;"
        }
    .end annotation
.end field

.field private mUndoListener:Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;)V
    .registers 4
    .param p1, "adapter"    # Lcom/mikepenz/fastadapter/FastAdapter;
    .param p2, "undoListener"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;

    .prologue
    .line 29
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    .line 30
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 31
    iput-object p2, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mUndoListener:Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;

    .line 32
    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 1
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->undoChange()V

    return-void
.end method

.method static synthetic access$200(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 1
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->notifyCommit()V

    return-void
.end method

.method static synthetic access$300(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 1
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->doChange()V

    return-void
.end method

.method private doChange()V
    .registers 6

    .prologue
    .line 96
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    if-eqz v3, :cond_41

    .line 97
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget v3, v3, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->action:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_41

    .line 98
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v3, v3, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->positions:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    new-array v1, v3, [Ljava/lang/Integer;

    .line 99
    .local v1, "positions":[Ljava/lang/Integer;
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v3, v3, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->positions:Ljava/util/Set;

    invoke-interface {v3, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 100
    array-length v3, v1

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_1f
    if-ltz v0, :cond_41

    .line 101
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v3, v3, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    .line 102
    .local v2, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v3, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    instance-of v3, v3, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v3, :cond_3e

    .line 103
    iget-object v3, v2, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    check-cast v3, Lcom/mikepenz/fastadapter/IItemAdapter;

    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v3, v4}, Lcom/mikepenz/fastadapter/IItemAdapter;->remove(I)V

    .line 100
    :cond_3e
    add-int/lit8 v0, v0, -0x1

    goto :goto_1f

    .line 108
    .end local v0    # "i":I
    .end local v1    # "positions":[Ljava/lang/Integer;
    .end local v2    # "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    :cond_41
    return-void
.end method

.method private notifyCommit()V
    .registers 4

    .prologue
    .line 87
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    if-eqz v0, :cond_1b

    .line 88
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget v0, v0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->action:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1b

    .line 89
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mUndoListener:Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;

    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v1, v1, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->positions:Ljava/util/Set;

    iget-object v2, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v2, v2, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->items:Ljava/util/ArrayList;

    invoke-interface {v0, v1, v2}, Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;->commitRemove(Ljava/util/Set;Ljava/util/ArrayList;)V

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    .line 93
    :cond_1b
    return-void
.end method

.method private undoChange()V
    .registers 10

    .prologue
    .line 111
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>;"
    iget-object v4, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    if-eqz v4, :cond_57

    .line 112
    iget-object v4, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget v4, v4, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->action:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_57

    .line 113
    const/4 v1, 0x0

    .line 114
    .local v1, "count":I
    iget-object v4, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v4, v4, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->positions:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_14
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_57

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 115
    .local v2, "position":Ljava/lang/Integer;
    iget-object v5, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    iget-object v5, v5, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->items:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    .line 116
    .local v3, "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    iget-object v5, v3, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    instance-of v5, v5, Lcom/mikepenz/fastadapter/IItemAdapter;

    if-eqz v5, :cond_54

    .line 117
    iget-object v0, v3, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->adapter:Lcom/mikepenz/fastadapter/IAdapter;

    check-cast v0, Lcom/mikepenz/fastadapter/IItemAdapter;

    .line 118
    .local v0, "adapter":Lcom/mikepenz/fastadapter/IItemAdapter;, "Lcom/mikepenz/fastadapter/IItemAdapter<TItem;>;"
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x1

    new-array v6, v6, [Lcom/mikepenz/fastadapter/IItem;

    const/4 v7, 0x0

    iget-object v8, v3, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    aput-object v8, v6, v7

    invoke-interface {v0, v5, v6}, Lcom/mikepenz/fastadapter/IItemAdapter;->add(I[Lcom/mikepenz/fastadapter/IItem;)V

    .line 119
    iget-object v5, v3, Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;->item:Lcom/mikepenz/fastadapter/IItem;

    invoke-interface {v5}, Lcom/mikepenz/fastadapter/IItem;->isSelected()Z

    move-result v5

    if-eqz v5, :cond_54

    .line 120
    iget-object v5, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    .line 123
    .end local v0    # "adapter":Lcom/mikepenz/fastadapter/IItemAdapter;, "Lcom/mikepenz/fastadapter/IItemAdapter<TItem;>;"
    :cond_54
    add-int/lit8 v1, v1, 0x1

    .line 124
    goto :goto_14

    .line 127
    .end local v1    # "count":I
    .end local v2    # "position":Ljava/lang/Integer;
    .end local v3    # "relativeInfo":Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;, "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo<TItem;>;"
    :cond_57
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    .line 128
    return-void
.end method


# virtual methods
.method public remove(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;ILjava/util/Set;)Landroid/support/design/widget/Snackbar;
    .registers 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "actionText"    # Ljava/lang/String;
    .param p4, "duration"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/support/design/widget/Snackbar;"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>;"
    .local p5, "positions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    if-eqz v3, :cond_7

    .line 45
    invoke-direct {p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->notifyCommit()V

    .line 48
    :cond_7
    new-instance v0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;-><init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;)V

    .line 49
    .local v0, "history":Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper<TItem;>.History;"
    iput-object p5, v0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->positions:Ljava/util/Set;

    .line 50
    const/4 v3, 0x2

    iput v3, v0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->action:I

    .line 51
    invoke-interface {p5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 52
    .local v1, "position":I
    iget-object v3, v0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;->items:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v5, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->getRelativeInfo(I)Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 54
    .end local v1    # "position":I
    :cond_32
    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->mHistory:Lcom/mikepenz/fastadapter/helpers/UndoHelper$History;

    .line 56
    invoke-static {p1, p2, p4}, Landroid/support/design/widget/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Landroid/support/design/widget/Snackbar;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;

    invoke-direct {v4, p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;-><init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    invoke-virtual {v3, v4}, Landroid/support/design/widget/Snackbar;->setCallback(Landroid/support/design/widget/Snackbar$Callback;)Landroid/support/design/widget/Snackbar;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;

    invoke-direct {v4, p0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper$1;-><init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    .line 76
    invoke-virtual {v3, p3, v4}, Landroid/support/design/widget/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Landroid/support/design/widget/Snackbar;

    move-result-object v2

    .line 82
    .local v2, "snackbar":Landroid/support/design/widget/Snackbar;
    invoke-virtual {v2}, Landroid/support/design/widget/Snackbar;->show()V

    .line 83
    return-object v2
.end method
