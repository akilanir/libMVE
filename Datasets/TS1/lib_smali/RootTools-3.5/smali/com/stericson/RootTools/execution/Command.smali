.class public abstract Lcom/stericson/RootTools/execution/Command;
.super Ljava/lang/Object;
.source "Command.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stericson/RootTools/execution/Command$1;,
        Lcom/stericson/RootTools/execution/Command$CommandHandler;,
        Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;
    }
.end annotation


# instance fields
.field command:[Ljava/lang/String;

.field context:Landroid/content/Context;

.field executing:Z

.field executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

.field exitCode:I

.field finished:Z

.field handlerEnabled:Z

.field id:I

.field javaCommand:Z

.field mHandler:Landroid/os/Handler;

.field terminated:Z

.field timeout:I


# direct methods
.method public varargs constructor <init>(IIZLandroid/content/Context;[Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "timeout"    # I
    .param p3, "javaCommand"    # Z
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "command"    # [Ljava/lang/String;

    .prologue
    .line 124
    invoke-direct {p0, p1, p2, p5}, Lcom/stericson/RootTools/execution/Command;-><init>(II[Ljava/lang/String;)V

    .line 125
    iput-boolean p3, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 126
    iput-object p4, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 127
    return-void
.end method

.method public varargs constructor <init>(II[Ljava/lang/String;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "timeout"    # I
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    .line 38
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    .line 39
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    .line 41
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 42
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 43
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 44
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    .line 45
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->terminated:Z

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    .line 48
    iput v1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 49
    sget v0, Lcom/stericson/RootTools/RootTools;->default_Command_Timeout:I

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->timeout:I

    .line 89
    iput-object p3, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 90
    iput p1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 91
    iput p2, p0, Lcom/stericson/RootTools/execution/Command;->timeout:I

    .line 93
    sget-boolean v0, Lcom/stericson/RootTools/RootTools;->handlerEnabled:Z

    invoke-direct {p0, v0}, Lcom/stericson/RootTools/execution/Command;->createHandler(Z)V

    .line 94
    return-void
.end method

.method public varargs constructor <init>(IZLandroid/content/Context;[Ljava/lang/String;)V
    .registers 5
    .param p1, "id"    # I
    .param p2, "javaCommand"    # Z
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "command"    # [Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0, p1, p4}, Lcom/stericson/RootTools/execution/Command;-><init>(I[Ljava/lang/String;)V

    .line 103
    iput-boolean p2, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 104
    iput-object p3, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 105
    return-void
.end method

.method public varargs constructor <init>(IZZLandroid/content/Context;[Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "handlerEnabled"    # Z
    .param p3, "javaCommand"    # Z
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "command"    # [Ljava/lang/String;

    .prologue
    .line 113
    invoke-direct {p0, p1, p2, p5}, Lcom/stericson/RootTools/execution/Command;-><init>(IZ[Ljava/lang/String;)V

    .line 114
    iput-boolean p3, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 115
    iput-object p4, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 116
    return-void
.end method

.method public varargs constructor <init>(IZ[Ljava/lang/String;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "handlerEnabled"    # Z
    .param p3, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    .line 38
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    .line 39
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    .line 41
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 42
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 43
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 44
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    .line 45
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->terminated:Z

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    .line 48
    iput v1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 49
    sget v0, Lcom/stericson/RootTools/RootTools;->default_Command_Timeout:I

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->timeout:I

    .line 75
    iput-object p3, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 76
    iput p1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 78
    invoke-direct {p0, p2}, Lcom/stericson/RootTools/execution/Command;->createHandler(Z)V

    .line 79
    return-void
.end method

.method public varargs constructor <init>(I[Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    .line 38
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    .line 39
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    .line 41
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 42
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    .line 43
    iput-object v2, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    .line 44
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    .line 45
    iput-boolean v1, p0, Lcom/stericson/RootTools/execution/Command;->terminated:Z

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    .line 48
    iput v1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 49
    sget v0, Lcom/stericson/RootTools/RootTools;->default_Command_Timeout:I

    iput v0, p0, Lcom/stericson/RootTools/execution/Command;->timeout:I

    .line 61
    iput-object p2, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    .line 62
    iput p1, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    .line 64
    sget-boolean v0, Lcom/stericson/RootTools/RootTools;->handlerEnabled:Z

    invoke-direct {p0, v0}, Lcom/stericson/RootTools/execution/Command;->createHandler(Z)V

    .line 65
    return-void
.end method

.method private createHandler(Z)V
    .registers 4
    .param p1, "handlerEnabled"    # Z

    .prologue
    .line 157
    iput-boolean p1, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    .line 159
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_18

    if-eqz p1, :cond_18

    .line 160
    const-string v0, "CommandHandler created"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 161
    new-instance v0, Lcom/stericson/RootTools/execution/Command$CommandHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/stericson/RootTools/execution/Command$CommandHandler;-><init>(Lcom/stericson/RootTools/execution/Command;Lcom/stericson/RootTools/execution/Command$1;)V

    iput-object v0, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    .line 166
    :goto_17
    return-void

    .line 164
    :cond_18
    const-string v0, "CommandHandler not created"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_17
.end method


# virtual methods
.method public abstract commandCompleted(II)V
.end method

.method protected commandFinished()V
    .registers 5

    .prologue
    .line 136
    iget-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->terminated:Z

    if-nez v2, :cond_48

    .line 137
    monitor-enter p0

    .line 138
    :try_start_5
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_49

    iget-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_49

    .line 139
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 140
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 141
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 142
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 143
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 149
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_26
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " finished."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0}, Lcom/stericson/RootTools/execution/Command;->finishCommand()V

    .line 151
    monitor-exit p0

    .line 153
    :cond_48
    return-void

    .line 146
    :cond_49
    iget v2, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    iget v3, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    invoke-virtual {p0, v2, v3}, Lcom/stericson/RootTools/execution/Command;->commandCompleted(II)V

    goto :goto_26

    .line 151
    :catchall_51
    move-exception v2

    monitor-exit p0
    :try_end_53
    .catchall {:try_start_5 .. :try_end_53} :catchall_51

    throw v2
.end method

.method public abstract commandOutput(ILjava/lang/String;)V
.end method

.method public abstract commandTerminated(ILjava/lang/String;)V
.end method

.method protected finishCommand()V
    .registers 2

    .prologue
    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    .line 132
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 133
    return-void
.end method

.method public getCommand()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v5, 0xa

    .line 169
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-boolean v3, p0, Lcom/stericson/RootTools/execution/Command;->javaCommand:Z

    if-eqz v3, :cond_51

    .line 172
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Command;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "filePath":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_64

    .line 178
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dalvikvm -cp "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/anbuild.dex"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " com.android.internal.util.WithFramework"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " com.stericson.RootTools.containers.RootClass "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 173
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 187
    .end local v0    # "filePath":Ljava/lang/String;
    .end local v1    # "i":I
    :cond_51
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_52
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    array-length v3, v3

    if-ge v1, v3, :cond_64

    .line 188
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Command;->command:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_52

    .line 192
    :cond_64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getExitCode()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    return v0
.end method

.method public isExecuting()Z
    .registers 2

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    return v0
.end method

.method public isFinished()Z
    .registers 2

    .prologue
    .line 204
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    return v0
.end method

.method public isHandlerEnabled()Z
    .registers 2

    .prologue
    .line 200
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    return v0
.end method

.method protected output(ILjava/lang/String;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 256
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_27

    iget-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_27

    .line 257
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 258
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 259
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 260
    const-string v2, "text"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 262
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 267
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_26
    return-void

    .line 265
    :cond_27
    invoke-virtual {p0, p1, p2}, Lcom/stericson/RootTools/execution/Command;->commandOutput(ILjava/lang/String;)V

    goto :goto_26
.end method

.method protected setExitCode(I)V
    .registers 3
    .param p1, "code"    # I

    .prologue
    .line 212
    monitor-enter p0

    .line 213
    :try_start_1
    iput p1, p0, Lcom/stericson/RootTools/execution/Command;->exitCode:I

    .line 214
    monitor-exit p0

    .line 215
    return-void

    .line 214
    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method protected startExecution()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 218
    new-instance v0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;-><init>(Lcom/stericson/RootTools/execution/Command;Lcom/stericson/RootTools/execution/Command$1;)V

    iput-object v0, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    .line 219
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    invoke-virtual {v0, v2}, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->setPriority(I)V

    .line 220
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command;->executionMonitor:Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->start()V

    .line 221
    iput-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->executing:Z

    .line 222
    return-void
.end method

.method public terminate(Ljava/lang/String;)V
    .registers 3
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 226
    :try_start_0
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeAll()V

    .line 227
    const-string v0, "Terminating all shells."

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 228
    invoke-virtual {p0, p1}, Lcom/stericson/RootTools/execution/Command;->terminated(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_c

    .line 230
    :goto_b
    return-void

    .line 229
    :catch_c
    move-exception v0

    goto :goto_b
.end method

.method protected terminated(Ljava/lang/String;)V
    .registers 6
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 233
    monitor-enter p0

    .line 236
    :try_start_1
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_55

    iget-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->handlerEnabled:Z

    if-eqz v2, :cond_55

    .line 237
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 238
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 239
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "action"

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 240
    const-string v2, "text"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 242
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 248
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "msg":Landroid/os/Message;
    :goto_27
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " did not finish because it was terminated. Termination reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 249
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/stericson/RootTools/execution/Command;->setExitCode(I)V

    .line 250
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/stericson/RootTools/execution/Command;->terminated:Z

    .line 251
    invoke-virtual {p0}, Lcom/stericson/RootTools/execution/Command;->finishCommand()V

    .line 252
    monitor-exit p0

    .line 253
    return-void

    .line 245
    :cond_55
    iget v2, p0, Lcom/stericson/RootTools/execution/Command;->id:I

    invoke-virtual {p0, v2, p1}, Lcom/stericson/RootTools/execution/Command;->commandTerminated(ILjava/lang/String;)V

    goto :goto_27

    .line 252
    :catchall_5b
    move-exception v2

    monitor-exit p0
    :try_end_5d
    .catchall {:try_start_1 .. :try_end_5d} :catchall_5b

    throw v2
.end method
