.class public Lcom/stericson/RootTools/execution/Shell;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stericson/RootTools/execution/Shell$Worker;,
        Lcom/stericson/RootTools/execution/Shell$ShellContext;,
        Lcom/stericson/RootTools/execution/Shell$ShellType;
    }
.end annotation


# static fields
.field private static customShell:Lcom/stericson/RootTools/execution/Shell; = null

.field public static defaultContext:Lcom/stericson/RootTools/execution/Shell$ShellContext; = null

.field private static rootShell:Lcom/stericson/RootTools/execution/Shell; = null

.field private static shell:Lcom/stericson/RootTools/execution/Shell; = null

.field private static final token:Ljava/lang/String; = "F*D^W@#FGF"


# instance fields
.field private close:Z

.field private final commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/stericson/RootTools/execution/Command;",
            ">;"
        }
    .end annotation
.end field

.field private error:Ljava/lang/String;

.field private final in:Ljava/io/BufferedReader;

.field private input:Ljava/lang/Runnable;

.field private isCleaning:Z

.field public isExecuting:Z

.field public isReading:Z

.field private maxCommands:I

.field private final out:Ljava/io/OutputStreamWriter;

.field private output:Ljava/lang/Runnable;

.field private final proc:Ljava/lang/Process;

.field private read:I

.field private shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

.field private shellTimeout:I

.field private shellType:Lcom/stericson/RootTools/execution/Shell$ShellType;

.field private totalExecuted:I

.field private totalRead:I

.field private write:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 70
    sput-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    .line 71
    sput-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    .line 72
    sput-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    .line 75
    sget-object v0, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    sput-object v0, Lcom/stericson/RootTools/execution/Shell;->defaultContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Lcom/stericson/RootTools/execution/Shell$ShellType;Lcom/stericson/RootTools/execution/Shell$ShellContext;I)V
    .registers 15
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "shellType"    # Lcom/stericson/RootTools/execution/Shell$ShellType;
    .param p3, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .param p4, "shellTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/16 v4, 0x61a8

    iput v4, p0, Lcom/stericson/RootTools/execution/Shell;->shellTimeout:I

    .line 79
    iput-object v9, p0, Lcom/stericson/RootTools/execution/Shell;->shellType:Lcom/stericson/RootTools/execution/Shell$ShellType;

    .line 80
    sget-object v4, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 82
    const-string v4, ""

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;

    .line 87
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    .line 90
    iput-boolean v6, p0, Lcom/stericson/RootTools/execution/Shell;->close:Z

    .line 92
    iput-boolean v6, p0, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    .line 93
    iput-boolean v6, p0, Lcom/stericson/RootTools/execution/Shell;->isReading:Z

    .line 95
    const/16 v4, 0x1388

    iput v4, p0, Lcom/stericson/RootTools/execution/Shell;->maxCommands:I

    .line 96
    iput v6, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    .line 97
    iput v6, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    .line 98
    iput v6, p0, Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I

    .line 99
    iput v6, p0, Lcom/stericson/RootTools/execution/Shell;->totalRead:I

    .line 100
    iput-boolean v6, p0, Lcom/stericson/RootTools/execution/Shell;->isCleaning:Z

    .line 334
    new-instance v4, Lcom/stericson/RootTools/execution/Shell$1;

    invoke-direct {v4, p0}, Lcom/stericson/RootTools/execution/Shell$1;-><init>(Lcom/stericson/RootTools/execution/Shell;)V

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->input:Ljava/lang/Runnable;

    .line 422
    new-instance v4, Lcom/stericson/RootTools/execution/Shell$3;

    invoke-direct {v4, p0}, Lcom/stericson/RootTools/execution/Shell$3;-><init>(Lcom/stericson/RootTools/execution/Shell;)V

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->output:Ljava/lang/Runnable;

    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Starting shell: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 105
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Context: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p3}, Lcom/stericson/RootTools/execution/Shell$ShellContext;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Timeout: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 108
    iput-object p2, p0, Lcom/stericson/RootTools/execution/Shell;->shellType:Lcom/stericson/RootTools/execution/Shell$ShellType;

    .line 109
    if-lez p4, :cond_103

    .end local p4    # "shellTimeout":I
    :goto_87
    iput p4, p0, Lcom/stericson/RootTools/execution/Shell;->shellTimeout:I

    .line 110
    iput-object p3, p0, Lcom/stericson/RootTools/execution/Shell;->shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    .line 112
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    sget-object v5, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    if-ne v4, v5, :cond_106

    .line 114
    new-instance v4, Ljava/lang/ProcessBuilder;

    new-array v5, v8, [Ljava/lang/String;

    aput-object p1, v5, v6

    invoke-direct {v4, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v4

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    .line 122
    :goto_a4
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;

    .line 123
    new-instance v4, Ljava/io/OutputStreamWriter;

    iget-object v5, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v5}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;

    .line 128
    new-instance v3, Lcom/stericson/RootTools/execution/Shell$Worker;

    invoke-direct {v3, p0, v9}, Lcom/stericson/RootTools/execution/Shell$Worker;-><init>(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Shell$1;)V

    .line 129
    .local v3, "worker":Lcom/stericson/RootTools/execution/Shell$Worker;
    invoke-virtual {v3}, Lcom/stericson/RootTools/execution/Shell$Worker;->start()V

    .line 140
    :try_start_cf
    iget v4, p0, Lcom/stericson/RootTools/execution/Shell;->shellTimeout:I

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lcom/stericson/RootTools/execution/Shell$Worker;->join(J)V

    .line 145
    iget v4, v3, Lcom/stericson/RootTools/execution/Shell$Worker;->exit:I
    :try_end_d7
    .catch Ljava/lang/InterruptedException; {:try_start_cf .. :try_end_d7} :catch_f2

    const/16 v5, -0x38f

    if-ne v4, v5, :cond_137

    .line 148
    :try_start_db
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v4}, Ljava/lang/Process;->destroy()V
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_db .. :try_end_e0} :catch_177
    .catch Ljava/lang/InterruptedException; {:try_start_db .. :try_end_e0} :catch_f2

    .line 151
    :goto_e0
    :try_start_e0
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;

    invoke-direct {p0, v4}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 152
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;

    invoke-direct {p0, v4}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    .line 154
    new-instance v4, Ljava/util/concurrent/TimeoutException;

    iget-object v5, p0, Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_f2
    .catch Ljava/lang/InterruptedException; {:try_start_e0 .. :try_end_f2} :catch_f2

    .line 189
    :catch_f2
    move-exception v0

    .line 190
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {v3}, Lcom/stericson/RootTools/execution/Shell$Worker;->interrupt()V

    .line 191
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 192
    new-instance v4, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v4}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v4

    .line 109
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    .end local v3    # "worker":Lcom/stericson/RootTools/execution/Shell$Worker;
    .restart local p4    # "shellTimeout":I
    :cond_103
    iget p4, p0, Lcom/stericson/RootTools/execution/Shell;->shellTimeout:I

    goto :goto_87

    .line 119
    .end local p4    # "shellTimeout":I
    :cond_106
    new-instance v4, Ljava/lang/ProcessBuilder;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    aput-object p1, v5, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "--context "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/stericson/RootTools/execution/Shell;->shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-virtual {v7}, Lcom/stericson/RootTools/execution/Shell$ShellContext;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-direct {v4, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v4

    iput-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    goto/16 :goto_a4

    .line 159
    .restart local v3    # "worker":Lcom/stericson/RootTools/execution/Shell$Worker;
    :cond_137
    :try_start_137
    iget v4, v3, Lcom/stericson/RootTools/execution/Shell$Worker;->exit:I
    :try_end_139
    .catch Ljava/lang/InterruptedException; {:try_start_137 .. :try_end_139} :catch_f2

    const/16 v5, -0x2a

    if-ne v4, v5, :cond_154

    .line 162
    :try_start_13d
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    invoke-virtual {v4}, Ljava/lang/Process;->destroy()V
    :try_end_142
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_142} :catch_175
    .catch Ljava/lang/InterruptedException; {:try_start_13d .. :try_end_142} :catch_f2

    .line 165
    :goto_142
    :try_start_142
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;

    invoke-direct {p0, v4}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    .line 166
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;

    invoke-direct {p0, v4}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    .line 168
    new-instance v4, Lcom/stericson/RootTools/exceptions/RootDeniedException;

    const-string v5, "Root Access Denied"

    invoke-direct {v4, v5}, Lcom/stericson/RootTools/exceptions/RootDeniedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 181
    :cond_154
    new-instance v1, Ljava/lang/Thread;

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->input:Ljava/lang/Runnable;

    const-string v5, "Shell Input"

    invoke-direct {v1, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 182
    .local v1, "si":Ljava/lang/Thread;
    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Ljava/lang/Thread;->setPriority(I)V

    .line 183
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 185
    new-instance v2, Ljava/lang/Thread;

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell;->output:Ljava/lang/Runnable;

    const-string v5, "Shell Output"

    invoke-direct {v2, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 186
    .local v2, "so":Ljava/lang/Thread;
    const/4 v4, 0x5

    invoke-virtual {v2, v4}, Ljava/lang/Thread;->setPriority(I)V

    .line 187
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_174
    .catch Ljava/lang/InterruptedException; {:try_start_142 .. :try_end_174} :catch_f2

    .line 194
    return-void

    .line 163
    .end local v1    # "si":Ljava/lang/Thread;
    .end local v2    # "so":Ljava/lang/Thread;
    :catch_175
    move-exception v4

    goto :goto_142

    .line 149
    :catch_177
    move-exception v4

    goto/16 :goto_e0
.end method

.method static synthetic access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/BufferedReader;
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->totalRead:I

    return v0
.end method

.method static synthetic access$1108(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 3
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->totalRead:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootTools/execution/Shell;->totalRead:I

    return v0
.end method

.method static synthetic access$1200(Lcom/stericson/RootTools/execution/Shell;)Ljava/lang/Process;
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Reader;)V
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "x1"    # Ljava/io/Reader;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Reader;)V

    return-void
.end method

.method static synthetic access$1402(Lcom/stericson/RootTools/execution/Shell;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/stericson/RootTools/execution/Shell;)Z
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Shell;->close:Z

    return v0
.end method

.method static synthetic access$300(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    return v0
.end method

.method static synthetic access$302(Lcom/stericson/RootTools/execution/Shell;I)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "x1"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    return p1
.end method

.method static synthetic access$308(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 3
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    return v0
.end method

.method static synthetic access$400(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->maxCommands:I

    return v0
.end method

.method static synthetic access$500(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    return v0
.end method

.method static synthetic access$502(Lcom/stericson/RootTools/execution/Shell;I)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "x1"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    return p1
.end method

.method static synthetic access$508(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 3
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    return v0
.end method

.method static synthetic access$600(Lcom/stericson/RootTools/execution/Shell;)V
    .registers 1
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/stericson/RootTools/execution/Shell;->cleanCommands()V

    return-void
.end method

.method static synthetic access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;

    return-object v0
.end method

.method static synthetic access$800(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I

    return v0
.end method

.method static synthetic access$808(Lcom/stericson/RootTools/execution/Shell;)I
    .registers 3
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 37
    iget v0, p0, Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I

    return v0
.end method

.method static synthetic access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V
    .registers 2
    .param p0, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p1, "x1"    # Ljava/io/Writer;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V

    return-void
.end method

.method private cleanCommands()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 223
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/stericson/RootTools/execution/Shell;->isCleaning:Z

    .line 224
    iget v2, p0, Lcom/stericson/RootTools/execution/Shell;->maxCommands:I

    iget v3, p0, Lcom/stericson/RootTools/execution/Shell;->maxCommands:I

    div-int/lit8 v3, v3, 0x4

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 225
    .local v1, "toClean":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cleaning up: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 227
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_26
    if-ge v0, v1, :cond_30

    .line 228
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 231
    :cond_30
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/stericson/RootTools/execution/Shell;->read:I

    .line 232
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    .line 233
    iput-boolean v4, p0, Lcom/stericson/RootTools/execution/Shell;->isCleaning:Z

    .line 234
    return-void
.end method

.method public static closeAll()V
    .registers 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeShell()V

    .line 289
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeRootShell()V

    .line 290
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeCustomShell()V

    .line 291
    return-void
.end method

.method public static closeCustomShell()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_5

    .line 273
    :goto_4
    return-void

    .line 272
    :cond_5
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Shell;->close()V

    goto :goto_4
.end method

.method private closeQuietly(Ljava/io/Reader;)V
    .registers 3
    .param p1, "input"    # Ljava/io/Reader;

    .prologue
    .line 238
    if-eqz p1, :cond_5

    .line 239
    :try_start_2
    invoke-virtual {p1}, Ljava/io/Reader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_6

    .line 242
    :cond_5
    :goto_5
    return-void

    .line 241
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method private closeQuietly(Ljava/io/Writer;)V
    .registers 3
    .param p1, "output"    # Ljava/io/Writer;

    .prologue
    .line 246
    if-eqz p1, :cond_5

    .line 247
    :try_start_2
    invoke-virtual {p1}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_6

    .line 250
    :cond_5
    :goto_5
    return-void

    .line 249
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static closeRootShell()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_5

    .line 279
    :goto_4
    return-void

    .line 278
    :cond_5
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Shell;->close()V

    goto :goto_4
.end method

.method public static closeShell()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_5

    .line 285
    :goto_4
    return-void

    .line 284
    :cond_5
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Shell;->close()V

    goto :goto_4
.end method

.method public static getOpenShell()Lcom/stericson/RootTools/execution/Shell;
    .registers 1

    .prologue
    .line 302
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-eqz v0, :cond_7

    .line 303
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    .line 307
    :goto_6
    return-object v0

    .line 304
    :cond_7
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-eqz v0, :cond_e

    .line 305
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    goto :goto_6

    .line 307
    :cond_e
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    goto :goto_6
.end method

.method public static isAnyShellOpen()Z
    .registers 1

    .prologue
    .line 323
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_c

    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_c

    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static isCustomShellOpen()Z
    .registers 1

    .prologue
    .line 315
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isRootShellOpen()Z
    .registers 1

    .prologue
    .line 319
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isShellOpen()Z
    .registers 1

    .prologue
    .line 311
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static runCommand(Lcom/stericson/RootTools/execution/Command;)V
    .registers 2
    .param p0, "command"    # Lcom/stericson/RootTools/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 533
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 534
    return-void
.end method

.method public static runRootCommand(Lcom/stericson/RootTools/execution/Command;)V
    .registers 2
    .param p0, "command"    # Lcom/stericson/RootTools/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 529
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->startRootShell()Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 530
    return-void
.end method

.method public static startCustomShell(Ljava/lang/String;)Lcom/stericson/RootTools/execution/Shell;
    .registers 2
    .param p0, "shellPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 583
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/stericson/RootTools/execution/Shell;->startCustomShell(Ljava/lang/String;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startCustomShell(Ljava/lang/String;I)Lcom/stericson/RootTools/execution/Shell;
    .registers 5
    .param p0, "shellPath"    # Ljava/lang/String;
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 588
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v0, :cond_17

    .line 589
    const-string v0, "Starting Custom Shell!"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 590
    new-instance v0, Lcom/stericson/RootTools/execution/Shell;

    sget-object v1, Lcom/stericson/RootTools/execution/Shell$ShellType;->CUSTOM:Lcom/stericson/RootTools/execution/Shell$ShellType;

    sget-object v2, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/stericson/RootTools/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootTools/execution/Shell$ShellType;Lcom/stericson/RootTools/execution/Shell$ShellContext;I)V

    sput-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    .line 594
    :goto_14
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    return-object v0

    .line 592
    :cond_17
    const-string v0, "Using Existing Custom Shell!"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_14
.end method

.method public static startRootShell()Lcom/stericson/RootTools/execution/Shell;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 537
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/stericson/RootTools/execution/Shell;->startRootShell(II)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(I)Lcom/stericson/RootTools/execution/Shell;
    .registers 2
    .param p0, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 541
    const/4 v0, 0x3

    invoke-static {p0, v0}, Lcom/stericson/RootTools/execution/Shell;->startRootShell(II)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(II)Lcom/stericson/RootTools/execution/Shell;
    .registers 3
    .param p0, "timeout"    # I
    .param p1, "retry"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 545
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->defaultContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-static {p0, v0, p1}, Lcom/stericson/RootTools/execution/Shell;->startRootShell(ILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startRootShell(ILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;
    .registers 9
    .param p0, "timeout"    # I
    .param p1, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .param p2, "retry"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 550
    sget-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v4, :cond_27

    .line 552
    const-string v4, "Starting Root Shell!"

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 553
    const-string v0, "su"

    .line 555
    .local v0, "cmd":Ljava/lang/String;
    const/4 v2, 0x0

    .line 556
    .local v2, "retries":I
    :goto_c
    sget-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v4, :cond_37

    .line 558
    :try_start_10
    new-instance v4, Lcom/stericson/RootTools/execution/Shell;

    sget-object v5, Lcom/stericson/RootTools/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootTools/execution/Shell$ShellType;

    invoke-direct {v4, v0, v5, p1, p0}, Lcom/stericson/RootTools/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootTools/execution/Shell$ShellType;Lcom/stericson/RootTools/execution/Shell$ShellContext;I)V

    sput-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_19} :catch_1a

    goto :goto_c

    .line 559
    :catch_1a
    move-exception v1

    .line 560
    .local v1, "e":Ljava/io/IOException;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "retries":I
    .local v3, "retries":I
    if-lt v2, p2, :cond_25

    .line 561
    const-string v4, "IOException, could not start shell"

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 562
    throw v1

    :cond_25
    move v2, v3

    .line 564
    .end local v3    # "retries":I
    .restart local v2    # "retries":I
    goto :goto_c

    .line 567
    .end local v0    # "cmd":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "retries":I
    :cond_27
    sget-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    iget-object v4, v4, Lcom/stericson/RootTools/execution/Shell;->shellContext:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    if-eq v4, p1, :cond_41

    .line 569
    :try_start_2d
    const-string v4, "Context is different than open shell, switching context..."

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 570
    sget-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    invoke-virtual {v4, p1}, Lcom/stericson/RootTools/execution/Shell;->switchRootShellContext(Lcom/stericson/RootTools/execution/Shell$ShellContext;)Lcom/stericson/RootTools/execution/Shell;
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_37} :catch_3a

    .line 579
    :cond_37
    :goto_37
    sget-object v4, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    return-object v4

    .line 571
    :catch_3a
    move-exception v1

    .line 572
    .restart local v1    # "e":Ljava/io/IOException;
    const-string v4, "Context could not be switched for existing root shell..."

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 573
    throw v1

    .line 576
    .end local v1    # "e":Ljava/io/IOException;
    :cond_41
    const-string v4, "Using Existing Root Shell!"

    invoke-static {v4}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_37
.end method

.method public static startShell()Lcom/stericson/RootTools/execution/Shell;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 598
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/stericson/RootTools/execution/Shell;->startShell(I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object v0

    return-object v0
.end method

.method public static startShell(I)Lcom/stericson/RootTools/execution/Shell;
    .registers 6
    .param p0, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 604
    :try_start_0
    sget-object v1, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    if-nez v1, :cond_19

    .line 605
    const-string v1, "Starting Shell!"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 606
    new-instance v1, Lcom/stericson/RootTools/execution/Shell;

    const-string v2, "/system/bin/sh"

    sget-object v3, Lcom/stericson/RootTools/execution/Shell$ShellType;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellType;

    sget-object v4, Lcom/stericson/RootTools/execution/Shell$ShellContext;->NORMAL:Lcom/stericson/RootTools/execution/Shell$ShellContext;

    invoke-direct {v1, v2, v3, v4, p0}, Lcom/stericson/RootTools/execution/Shell;-><init>(Ljava/lang/String;Lcom/stericson/RootTools/execution/Shell$ShellType;Lcom/stericson/RootTools/execution/Shell$ShellContext;I)V

    sput-object v1, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    .line 609
    :goto_16
    sget-object v1, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    return-object v1

    .line 608
    :cond_19
    const-string v1, "Using Existing Shell!"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_1e
    .catch Lcom/stericson/RootTools/exceptions/RootDeniedException; {:try_start_0 .. :try_end_1e} :catch_1f

    goto :goto_16

    .line 610
    :catch_1f
    move-exception v0

    .line 612
    .local v0, "e":Lcom/stericson/RootTools/exceptions/RootDeniedException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1
.end method


# virtual methods
.method public add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;
    .registers 4
    .param p1, "command"    # Lcom/stericson/RootTools/execution/Command;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Shell;->close:Z

    if-eqz v0, :cond_c

    .line 199
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to add commands to a closed shell"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 202
    :cond_c
    iget-boolean v0, p0, Lcom/stericson/RootTools/execution/Shell;->isCleaning:Z

    if-nez v0, :cond_c

    .line 206
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    invoke-virtual {p0}, Lcom/stericson/RootTools/execution/Shell;->notifyThreads()V

    .line 210
    return-object p1
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 253
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    if-ne p0, v0, :cond_12

    .line 254
    sput-object v1, Lcom/stericson/RootTools/execution/Shell;->rootShell:Lcom/stericson/RootTools/execution/Shell;

    .line 259
    :cond_7
    :goto_7
    iget-object v1, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    monitor-enter v1

    .line 264
    const/4 v0, 0x1

    :try_start_b
    iput-boolean v0, p0, Lcom/stericson/RootTools/execution/Shell;->close:Z

    .line 265
    invoke-virtual {p0}, Lcom/stericson/RootTools/execution/Shell;->notifyThreads()V

    .line 266
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_b .. :try_end_11} :catchall_20

    .line 267
    return-void

    .line 255
    :cond_12
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    if-ne p0, v0, :cond_19

    .line 256
    sput-object v1, Lcom/stericson/RootTools/execution/Shell;->shell:Lcom/stericson/RootTools/execution/Shell;

    goto :goto_7

    .line 257
    :cond_19
    sget-object v0, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    if-ne p0, v0, :cond_7

    .line 258
    sput-object v1, Lcom/stericson/RootTools/execution/Shell;->customShell:Lcom/stericson/RootTools/execution/Shell;

    goto :goto_7

    .line 266
    :catchall_20
    move-exception v0

    :try_start_21
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public getCommandQueuePosition(Lcom/stericson/RootTools/execution/Command;)I
    .registers 3
    .param p1, "cmd"    # Lcom/stericson/RootTools/execution/Command;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getCommandQueuePositionString(Lcom/stericson/RootTools/execution/Command;)Ljava/lang/String;
    .registers 4
    .param p1, "cmd"    # Lcom/stericson/RootTools/execution/Command;

    .prologue
    .line 298
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Command is in position "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/stericson/RootTools/execution/Shell;->getCommandQueuePosition(Lcom/stericson/RootTools/execution/Command;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " currently executing command at position "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/stericson/RootTools/execution/Shell;->write:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and the number of commands is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected notifyThreads()V
    .registers 2

    .prologue
    .line 408
    new-instance v0, Lcom/stericson/RootTools/execution/Shell$2;

    invoke-direct {v0, p0}, Lcom/stericson/RootTools/execution/Shell$2;-><init>(Lcom/stericson/RootTools/execution/Shell;)V

    .line 416
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 417
    return-void
.end method

.method public switchRootShellContext(Lcom/stericson/RootTools/execution/Shell$ShellContext;)Lcom/stericson/RootTools/execution/Shell;
    .registers 5
    .param p1, "shellContext"    # Lcom/stericson/RootTools/execution/Shell$ShellContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    .line 617
    iget-object v1, p0, Lcom/stericson/RootTools/execution/Shell;->shellType:Lcom/stericson/RootTools/execution/Shell$ShellType;

    sget-object v2, Lcom/stericson/RootTools/execution/Shell$ShellType;->ROOT:Lcom/stericson/RootTools/execution/Shell$ShellType;

    if-ne v1, v2, :cond_18

    .line 620
    :try_start_6
    invoke-static {}, Lcom/stericson/RootTools/execution/Shell;->closeRootShell()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_9} :catch_11

    .line 626
    :goto_9
    iget v1, p0, Lcom/stericson/RootTools/execution/Shell;->shellTimeout:I

    const/4 v2, 0x3

    invoke-static {v1, p1, v2}, Lcom/stericson/RootTools/execution/Shell;->startRootShell(ILcom/stericson/RootTools/execution/Shell$ShellContext;I)Lcom/stericson/RootTools/execution/Shell;

    move-result-object p0

    .line 632
    .end local p0    # "this":Lcom/stericson/RootTools/execution/Shell;
    :goto_10
    return-object p0

    .line 621
    .restart local p0    # "this":Lcom/stericson/RootTools/execution/Shell;
    :catch_11
    move-exception v0

    .line 622
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Problem closing shell while trying to switch context..."

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_9

    .line 631
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_18
    const-string v1, "Can only switch context on a root shell!"

    invoke-static {v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    goto :goto_10
.end method

.method public useCWD(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/TimeoutException;,
            Lcom/stericson/RootTools/exceptions/RootDeniedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 214
    new-instance v0, Lcom/stericson/RootTools/execution/CommandCapture;

    const/4 v1, -0x1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cd "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-direct {v0, v1, v5, v2}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/stericson/RootTools/execution/Shell;->add(Lcom/stericson/RootTools/execution/Command;)Lcom/stericson/RootTools/execution/Command;

    .line 220
    return-void
.end method
