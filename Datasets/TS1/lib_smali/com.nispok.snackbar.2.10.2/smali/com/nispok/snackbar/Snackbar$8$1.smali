.class Lcom/nispok/snackbar/Snackbar$8$1;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/Snackbar$8;->onAnimationEnd(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nispok/snackbar/Snackbar$8;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar$8;)V
    .registers 2
    .param p1, "this$1"    # Lcom/nispok/snackbar/Snackbar$8;

    .prologue
    .line 904
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$8$1;->this$1:Lcom/nispok/snackbar/Snackbar$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 907
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$8$1;->this$1:Lcom/nispok/snackbar/Snackbar$8;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$8;->this$0:Lcom/nispok/snackbar/Snackbar;

    # invokes: Lcom/nispok/snackbar/Snackbar;->finish()V
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1800(Lcom/nispok/snackbar/Snackbar;)V

    .line 908
    return-void
.end method
