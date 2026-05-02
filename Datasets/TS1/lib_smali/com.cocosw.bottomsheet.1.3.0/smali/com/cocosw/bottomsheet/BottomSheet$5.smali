.class Lcom/cocosw/bottomsheet/BottomSheet$5;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->showFullItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/BottomSheet;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 2

    .prologue
    .line 379
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$5;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 382
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$5;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # invokes: Lcom/cocosw/bottomsheet/BottomSheet;->showShortItems()V
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$2100(Lcom/cocosw/bottomsheet/BottomSheet;)V

    .line 383
    return-void
.end method
