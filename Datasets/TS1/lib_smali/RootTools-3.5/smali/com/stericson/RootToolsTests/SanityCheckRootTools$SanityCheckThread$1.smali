.class Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$1;
.super Lcom/stericson/RootTools/execution/JavaCommandCapture;
.source "SanityCheckRootTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;


# direct methods
.method varargs constructor <init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;IZLandroid/content/Context;[Ljava/lang/String;)V
    .registers 6
    .param p2, "x0"    # I
    .param p3, "x1"    # Z
    .param p4, "x2"    # Landroid/content/Context;
    .param p5, "x3"    # [Ljava/lang/String;

    .prologue
    .line 270
    iput-object p1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$1;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/stericson/RootTools/execution/JavaCommandCapture;-><init>(IZLandroid/content/Context;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public commandOutput(ILjava/lang/String;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 274
    invoke-super {p0, p1, p2}, Lcom/stericson/RootTools/execution/JavaCommandCapture;->commandOutput(ILjava/lang/String;)V

    .line 275
    iget-object v0, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$1;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    const/4 v1, 0x3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V

    .line 276
    return-void
.end method
