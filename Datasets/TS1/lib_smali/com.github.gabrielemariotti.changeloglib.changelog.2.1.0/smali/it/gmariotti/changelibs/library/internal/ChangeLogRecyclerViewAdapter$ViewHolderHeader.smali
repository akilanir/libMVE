.class public Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ChangeLogRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolderHeader"
.end annotation


# instance fields
.field public dateHeader:Landroid/widget/TextView;

.field public versionHeader:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 82
    sget v0, Lit/gmariotti/changelibs/R$id;->chg_headerVersion:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->versionHeader:Landroid/widget/TextView;

    .line 84
    sget v0, Lit/gmariotti/changelibs/R$id;->chg_headerDate:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderHeader;->dateHeader:Landroid/widget/TextView;

    .line 85
    return-void
.end method
