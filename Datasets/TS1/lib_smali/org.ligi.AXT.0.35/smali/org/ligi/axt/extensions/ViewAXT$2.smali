.class Lorg/ligi/axt/extensions/ViewAXT$2;
.super Ljava/lang/Object;
.source "ViewAXT.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/ligi/axt/extensions/ViewAXT;->onFirstGlobalLayout(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/ligi/axt/extensions/ViewAXT;

.field final synthetic val$runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lorg/ligi/axt/extensions/ViewAXT;Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "this$0"    # Lorg/ligi/axt/extensions/ViewAXT;

    .prologue
    .line 71
    iput-object p1, p0, Lorg/ligi/axt/extensions/ViewAXT$2;->this$0:Lorg/ligi/axt/extensions/ViewAXT;

    iput-object p2, p0, Lorg/ligi/axt/extensions/ViewAXT$2;->val$runnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 3

    .prologue
    .line 77
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_19

    .line 78
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT$2;->this$0:Lorg/ligi/axt/extensions/ViewAXT;

    # getter for: Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;
    invoke-static {v0}, Lorg/ligi/axt/extensions/ViewAXT;->access$000(Lorg/ligi/axt/extensions/ViewAXT;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 83
    :goto_13
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT$2;->val$runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 84
    return-void

    .line 80
    :cond_19
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT$2;->this$0:Lorg/ligi/axt/extensions/ViewAXT;

    # getter for: Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;
    invoke-static {v0}, Lorg/ligi/axt/extensions/ViewAXT;->access$000(Lorg/ligi/axt/extensions/ViewAXT;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_13
.end method
