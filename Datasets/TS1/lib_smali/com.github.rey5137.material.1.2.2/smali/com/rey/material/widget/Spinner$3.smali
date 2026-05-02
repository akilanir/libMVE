.class Lcom/rey/material/widget/Spinner$3;
.super Ljava/lang/Object;
.source "Spinner.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/Spinner;->onRestoreInstanceState(Landroid/os/Parcelable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/Spinner;)V
    .registers 2

    .prologue
    .line 1018
    iput-object p1, p0, Lcom/rey/material/widget/Spinner$3;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 3

    .prologue
    .line 1021
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$3;->this$0:Lcom/rey/material/widget/Spinner;

    # invokes: Lcom/rey/material/widget/Spinner;->showPopup()V
    invoke-static {v1}, Lcom/rey/material/widget/Spinner;->access$200(Lcom/rey/material/widget/Spinner;)V

    .line 1022
    iget-object v1, p0, Lcom/rey/material/widget/Spinner$3;->this$0:Lcom/rey/material/widget/Spinner;

    invoke-virtual {v1}, Lcom/rey/material/widget/Spinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1023
    .local v0, "vto":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_10

    .line 1024
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1025
    :cond_10
    return-void
.end method
