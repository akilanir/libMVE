.class Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;
.super Ljava/lang/Object;
.source "ChangeLogAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolderHeader"
.end annotation


# instance fields
.field date:Landroid/widget/TextView;

.field version:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 3
    .param p1, "version"    # Landroid/widget/TextView;
    .param p2, "date"    # Landroid/widget/TextView;

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    iput-object p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->version:Landroid/widget/TextView;

    .line 196
    iput-object p2, p0, Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter$ViewHolderHeader;->date:Landroid/widget/TextView;

    .line 197
    return-void
.end method
