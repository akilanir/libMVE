.class Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;
.super Lcom/stericson/RootTools/execution/CommandCapture;
.source "RootToolsInternalMethods.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootTools/internal/RootToolsInternalMethods;->isProcessRunning(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

.field final synthetic val$processName:Ljava/lang/String;


# direct methods
.method varargs constructor <init>(Lcom/stericson/RootTools/internal/RootToolsInternalMethods;IZ[Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p2, "x0"    # I
    .param p3, "x1"    # Z
    .param p4, "x2"    # [Ljava/lang/String;

    .prologue
    .line 1318
    iput-object p1, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;->this$0:Lcom/stericson/RootTools/internal/RootToolsInternalMethods;

    iput-object p5, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;->val$processName:Ljava/lang/String;

    invoke-direct {p0, p2, p3, p4}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public output(ILjava/lang/String;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 1321
    iget-object v0, p0, Lcom/stericson/RootTools/internal/RootToolsInternalMethods$11;->val$processName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1322
    const/4 v0, 0x1

    sput-boolean v0, Lcom/stericson/RootTools/internal/InternalVariables;->processRunning:Z

    .line 1324
    :cond_b
    return-void
.end method
