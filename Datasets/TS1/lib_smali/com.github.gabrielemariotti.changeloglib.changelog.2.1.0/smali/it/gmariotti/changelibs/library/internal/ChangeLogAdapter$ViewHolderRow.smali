.class Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;
.super Ljava/lang/Object;
.source "ChangeLogAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolderRow"
.end annotation


# instance fields
.field bulletText:Landroid/widget/TextView;

.field text:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 3
    .param p1, "text"    # Landroid/widget/TextView;
    .param p2, "bulletText"    # Landroid/widget/TextView;

    .prologue
    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    iput-object p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->text:Landroid/widget/TextView;

    .line 206
    iput-object p2, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderRow;->bulletText:Landroid/widget/TextView;

    .line 207
    return-void
.end method
