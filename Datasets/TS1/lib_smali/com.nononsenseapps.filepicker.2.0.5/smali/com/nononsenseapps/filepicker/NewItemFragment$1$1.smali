.class Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;
.super Ljava/lang/Object;
.source "NewItemFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/NewItemFragment$1;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

.field final synthetic val$dialog:Landroid/support/v7/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/support/v7/app/AlertDialog;)V
    .registers 3

    .prologue
    .line 71
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iput-object p2, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;->val$dialog:Landroid/support/v7/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;->val$dialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->cancel()V

    .line 76
    return-void
.end method
