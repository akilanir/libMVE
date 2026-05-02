.class Lcom/cocosw/bottomsheet/BottomSheet$1;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->init(Landroid/content/Context;)V
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
    .line 163
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$1;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed()V
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$1;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->dismiss()V

    .line 167
    return-void
.end method

.method public onOpened()V
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$1;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # invokes: Lcom/cocosw/bottomsheet/BottomSheet;->showFullItems()V
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$000(Lcom/cocosw/bottomsheet/BottomSheet;)V

    .line 172
    return-void
.end method
