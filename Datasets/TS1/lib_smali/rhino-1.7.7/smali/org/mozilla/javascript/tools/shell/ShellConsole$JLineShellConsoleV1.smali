.class Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;
.super Lorg/mozilla/javascript/tools/shell/ShellConsole;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/ShellConsole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JLineShellConsoleV1"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final reader:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "reader"    # Ljava/lang/Object;
    .param p2, "cs"    # Ljava/nio/charset/Charset;

    .prologue
    .line 98
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    .line 100
    new-instance v0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;

    invoke-direct {v0, p0, p2}, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;-><init>(Lorg/mozilla/javascript/tools/shell/ShellConsole;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->in:Ljava/io/InputStream;

    .line 101
    return-void
.end method


# virtual methods
.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "flushConsole"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    return-void
.end method

.method public getIn()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public print(Ljava/lang/String;)V
    .registers 7
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "printString"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->STRING_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method public println()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "printNewline"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .registers 7
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 135
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "printString"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->STRING_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "printNewline"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    return-void
.end method

.method public readLine()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "readLine"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->NO_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public readLine(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "prompt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    const-string v1, "readLine"

    # getter for: Lorg/mozilla/javascript/tools/shell/ShellConsole;->STRING_ARG:[Ljava/lang/Class;
    invoke-static {}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    # invokes: Lorg/mozilla/javascript/tools/shell/ShellConsole;->tryInvoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
