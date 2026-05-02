.class public Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "ChangeLogRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;,
        Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;
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
.field private static final TYPE_HEADER:I = 0x1

.field private static final TYPE_ROW:I


# instance fields
.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mRowHeaderLayoutId:I

.field private mRowLayoutId:I

.field private mStringVersionHeader:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .param p1, "mContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 47
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowLayoutId:I

    .line 48
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mRowHeaderLayoutId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowHeaderLayoutId:I

    .line 49
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mStringVersionHeader:I

    iput v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mStringVersionHeader:I

    .line 58
    iput-object p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mContext:Landroid/content/Context;

    .line 59
    if-nez p2, :cond_18

    .line 60
    new-instance p2, Ljava/util/ArrayList;

    .end local p2    # "items":Ljava/util/List;, "Ljava/util/List<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .restart local p2    # "items":Ljava/util/List;, "Ljava/util/List<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    :cond_18
    iput-object p2, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->items:Ljava/util/List;

    .line 62
    return-void
.end method

.method private getItem(I)Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    return-object v0
.end method

.method private isHeader(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 170
    invoke-direct {p0, p1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->getItem(I)Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    move-result-object v0

    invoke-virtual {v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->isHeader()Z

    move-result v0

    return v0
.end method

.method private populateViewHolderHeader(Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;I)V
    .registers 8
    .param p1, "viewHolder"    # Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;
    .param p2, "position"    # I

    .prologue
    .line 138
    invoke-direct {p0, p2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->getItem(I)Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    move-result-object v0

    .line 139
    .local v0, "item":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    if-eqz v0, :cond_3f

    .line 140
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->versionHeader:Landroid/widget/TextView;

    if-eqz v3, :cond_2a

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mContext:Landroid/content/Context;

    iget v4, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mStringVersionHeader:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 144
    .local v2, "versionHeaderString":Ljava/lang/String;
    if-eqz v2, :cond_1c

    .line 145
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :cond_1c
    iget-object v3, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->versionHeader:Landroid/widget/TextView;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .end local v2    # "versionHeaderString":Ljava/lang/String;
    :cond_2a
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    if-eqz v3, :cond_3f

    .line 156
    iget-object v3, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->changeDate:Ljava/lang/String;

    if-eqz v3, :cond_40

    .line 157
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    iget-object v4, v0, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->changeDate:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 166
    :cond_3f
    :goto_3f
    return-void

    .line 161
    :cond_40
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v3, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3f
.end method

.method private populateViewHolderRow(Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;I)V
    .registers 6
    .param p1, "viewHolder"    # Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;
    .param p2, "position"    # I

    .prologue
    .line 121
    invoke-direct {p0, p2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->getItem(I)Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    move-result-object v0

    .line 122
    .local v0, "item":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    if-eqz v0, :cond_32

    .line 123
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->textRow:Landroid/widget/TextView;

    if-eqz v1, :cond_22

    .line 124
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->textRow:Landroid/widget/TextView;

    iget-object v2, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->getChangeText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->textRow:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 127
    :cond_22
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->bulletRow:Landroid/widget/TextView;

    if-eqz v1, :cond_32

    .line 128
    invoke-virtual {v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->isBulletedList()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 129
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->bulletRow:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 135
    :cond_32
    :goto_32
    return-void

    .line 131
    :cond_33
    iget-object v1, p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->bulletRow:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_32
.end method


# virtual methods
.method public add(Ljava/util/LinkedList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "rows":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    iget-object v1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 66
    .local v0, "originalPosition":I
    iget-object v1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 67
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v0, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->notifyItemRangeInserted(II)V

    .line 68
    return-void
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 181
    const/4 v0, 0x1

    .line 182
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 4
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 113
    invoke-direct {p0, p2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 114
    check-cast p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-direct {p0, p1, p2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->populateViewHolderHeader(Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;I)V

    .line 118
    :goto_b
    return-void

    .line 116
    .restart local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_c
    check-cast p1, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;

    .end local p1    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-direct {p0, p1, p2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->populateViewHolderRow(Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;I)V

    goto :goto_b
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 8
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v4, 0x0

    .line 102
    const/4 v2, 0x1

    if-ne p2, v2, :cond_18

    .line 103
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget v3, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowHeaderLayoutId:I

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 104
    .local v1, "viewHeader":Landroid/view/View;
    new-instance v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;

    invoke-direct {v2, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;-><init>(Landroid/view/View;)V

    .line 107
    .end local v1    # "viewHeader":Landroid/view/View;
    :goto_17
    return-object v2

    .line 106
    :cond_18
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget v3, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowLayoutId:I

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 107
    .local v0, "view":Landroid/view/View;
    new-instance v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;

    invoke-direct {v2, v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;-><init>(Landroid/view/View;)V

    goto :goto_17
.end method

.method public setRowHeaderLayoutId(I)V
    .registers 2
    .param p1, "mRowHeaderLayoutId"    # I

    .prologue
    .line 200
    iput p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowHeaderLayoutId:I

    .line 201
    return-void
.end method

.method public setRowLayoutId(I)V
    .registers 2
    .param p1, "mRowLayoutId"    # I

    .prologue
    .line 196
    iput p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;->mRowLayoutId:I

    .line 197
    return-void
.end method
