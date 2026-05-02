.class Lcom/nispok/snackbar/Snackbar$1;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nispok/snackbar/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nispok/snackbar/Snackbar;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "this$0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$1;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$1;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 120
    return-void
.end method
