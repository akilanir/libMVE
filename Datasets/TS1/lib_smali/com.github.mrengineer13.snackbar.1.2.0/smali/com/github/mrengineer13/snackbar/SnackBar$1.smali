.class Lcom/github/mrengineer13/snackbar/SnackBar$1;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/mrengineer13/snackbar/SnackBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/mrengineer13/snackbar/SnackBar;


# direct methods
.method constructor <init>(Lcom/github/mrengineer13/snackbar/SnackBar;)V
    .registers 2

    .prologue
    .line 375
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 378
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackBar;->mClickListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$300(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    move-result-object v0

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$400(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 379
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackBar;->mClickListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$300(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;
    invoke-static {v1}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$400(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->peek()Lcom/github/mrengineer13/snackbar/Snack;

    move-result-object v1

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mToken:Landroid/os/Parcelable;

    invoke-interface {v0, v1}, Lcom/github/mrengineer13/snackbar/SnackBar$OnMessageClickListener;->onMessageClick(Landroid/os/Parcelable;)V

    .line 381
    :cond_29
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackBar$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackBar;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackBar;->mSnackContainer:Lcom/github/mrengineer13/snackbar/SnackContainer;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackBar;->access$400(Lcom/github/mrengineer13/snackbar/SnackBar;)Lcom/github/mrengineer13/snackbar/SnackContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->hide()V

    .line 382
    return-void
.end method
