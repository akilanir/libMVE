.class public Lcom/stericson/RootTools/execution/JavaCommandCapture;
.super Lcom/stericson/RootTools/execution/Command;
.source "JavaCommandCapture.java"


# instance fields
.field private sb:Ljava/lang/StringBuilder;


# direct methods
.method public varargs constructor <init>(IILandroid/content/Context;[Ljava/lang/String;)V
    .registers 11
    .param p1, "id"    # I
    .param p2, "timeout"    # I
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "command"    # [Ljava/lang/String;

    .prologue
    .line 18
    const/4 v3, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/execution/Command;-><init>(IIZLandroid/content/Context;[Ljava/lang/String;)V

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/stericson/RootTools/execution/JavaCommandCapture;->sb:Ljava/lang/StringBuilder;

    .line 19
    return-void
.end method

.method public varargs constructor <init>(ILandroid/content/Context;[Ljava/lang/String;)V
    .registers 5
    .param p1, "id"    # I
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    .line 10
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/stericson/RootTools/execution/Command;-><init>(IZLandroid/content/Context;[Ljava/lang/String;)V

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/stericson/RootTools/execution/JavaCommandCapture;->sb:Ljava/lang/StringBuilder;

    .line 11
    return-void
.end method

.method public varargs constructor <init>(IZLandroid/content/Context;[Ljava/lang/String;)V
    .registers 11
    .param p1, "id"    # I
    .param p2, "handlerEnabled"    # Z
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "command"    # [Ljava/lang/String;

    .prologue
    .line 14
    const/4 v3, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/stericson/RootTools/execution/Command;-><init>(IZZLandroid/content/Context;[Ljava/lang/String;)V

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/stericson/RootTools/execution/JavaCommandCapture;->sb:Ljava/lang/StringBuilder;

    .line 15
    return-void
.end method


# virtual methods
.method public commandCompleted(II)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "exitCode"    # I

    .prologue
    .line 35
    return-void
.end method

.method public commandOutput(ILjava/lang/String;)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/stericson/RootTools/execution/JavaCommandCapture;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    const-string v0, "Command"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    return-void
.end method

.method public commandTerminated(ILjava/lang/String;)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 30
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/stericson/RootTools/execution/JavaCommandCapture;->sb:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
