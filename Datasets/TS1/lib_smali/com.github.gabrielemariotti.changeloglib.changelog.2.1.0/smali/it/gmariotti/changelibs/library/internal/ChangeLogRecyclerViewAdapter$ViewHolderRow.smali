.class public Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ChangeLogRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolderRow"
.end annotation


# instance fields
.field public bulletRow:Landroid/widget/TextView;

.field public textRow:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 94
    sget v0, Lit/gmariotti/changelibs/R$id;->chg_text:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->textRow:Landroid/widget/TextView;

    .line 95
    sget v0, Lit/gmariotti/changelibs/R$id;->chg_textbullet:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogRecyclerViewAdapter$ViewHolderRow;->bulletRow:Landroid/widget/TextView;

    .line 96
    return-void
.end method
