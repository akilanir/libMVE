.class Lcom/cocosw/bottomsheet/BottomSheet$7;
.super Ljava/lang/Object;
.source "BottomSheet.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->onCreate(Landroid/os/Bundle;)V
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
    .line 448
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$7;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 451
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$7;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$2200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 452
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$7;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$2200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 453
    :cond_11
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$7;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->limit:I
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$2300(Lcom/cocosw/bottomsheet/BottomSheet;)I

    move-result v0

    const v1, 0x7fffffff

    if-eq v0, v1, :cond_21

    .line 454
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$7;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # invokes: Lcom/cocosw/bottomsheet/BottomSheet;->showShortItems()V
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$2100(Lcom/cocosw/bottomsheet/BottomSheet;)V

    .line 455
    :cond_21
    return-void
.end method
