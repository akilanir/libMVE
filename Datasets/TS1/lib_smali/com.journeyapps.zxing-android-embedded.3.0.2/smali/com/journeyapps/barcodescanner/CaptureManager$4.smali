.class Lcom/journeyapps/barcodescanner/CaptureManager$4;
.super Ljava/lang/Object;
.source "CaptureManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/journeyapps/barcodescanner/CaptureManager;->displayFrameworkBugMessageAndExit()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/journeyapps/barcodescanner/CaptureManager;


# direct methods
.method constructor <init>(Lcom/journeyapps/barcodescanner/CaptureManager;)V
    .registers 2

    .prologue
    .line 294
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/CaptureManager$4;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 297
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureManager$4;->this$0:Lcom/journeyapps/barcodescanner/CaptureManager;

    # invokes: Lcom/journeyapps/barcodescanner/CaptureManager;->finish()V
    invoke-static {v0}, Lcom/journeyapps/barcodescanner/CaptureManager;->access$400(Lcom/journeyapps/barcodescanner/CaptureManager;)V

    .line 298
    return-void
.end method
