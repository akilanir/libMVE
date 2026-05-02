.class Lcom/rey/material/widget/Spinner$RecycleBin;
.super Ljava/lang/Object;
.source "Spinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/Spinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecycleBin"
.end annotation


# instance fields
.field private final mScrapHeap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/Spinner;)V
    .registers 3

    .prologue
    .line 1046
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1047
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/Spinner;Lcom/rey/material/widget/Spinner$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/Spinner;
    .param p2, "x1"    # Lcom/rey/material/widget/Spinner$1;

    .prologue
    .line 1046
    invoke-direct {p0, p1}, Lcom/rey/material/widget/Spinner$RecycleBin;-><init>(Lcom/rey/material/widget/Spinner;)V

    return-void
.end method


# virtual methods
.method clear()V
    .registers 2

    .prologue
    .line 1062
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    .line 1063
    .local v0, "scrapHeap":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/view/View;>;"
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 1064
    return-void
.end method

.method get(I)Landroid/view/View;
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 1054
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 1055
    .local v0, "result":Landroid/view/View;
    if-eqz v0, :cond_f

    .line 1056
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 1058
    :cond_f
    return-object v0
.end method

.method public put(ILandroid/view/View;)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 1050
    iget-object v0, p0, Lcom/rey/material/widget/Spinner$RecycleBin;->mScrapHeap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1051
    return-void
.end method
