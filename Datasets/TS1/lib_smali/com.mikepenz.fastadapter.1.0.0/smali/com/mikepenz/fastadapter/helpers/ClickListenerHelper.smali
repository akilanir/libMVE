.class public Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;
.super Ljava/lang/Object;
.source "ClickListenerHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;
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


# instance fields
.field private mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/FastAdapter",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;, "Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper<TItem;>;"
    .local p1, "fastAdapter":Lcom/mikepenz/fastadapter/FastAdapter;, "Lcom/mikepenz/fastadapter/FastAdapter<TItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 24
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    return-object v0
.end method


# virtual methods
.method public listen(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V
    .registers 6
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "viewId"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p3, "onClickListener"    # Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;

    .prologue
    .line 53
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;, "Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper<TItem;>;"
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$2;

    invoke-direct {v1, p0, p1, p3}, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$2;-><init>(Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    return-void
.end method

.method public listen(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/view/View;Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V
    .registers 5
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "onClickListener"    # Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;

    .prologue
    .line 32
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;, "Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper<TItem;>;"
    new-instance v0, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;

    invoke-direct {v0, p0, p1, p3}, Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$1;-><init>(Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/mikepenz/fastadapter/helpers/ClickListenerHelper$OnClickListener;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    return-void
.end method
