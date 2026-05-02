.class Lfreemarker/template/utility/JythonRuntime$1;
.super Ljava/io/Writer;
.source "JythonRuntime.java"


# instance fields
.field private final this$0:Lfreemarker/template/utility/JythonRuntime;

.field private final val$buf:Ljava/lang/StringBuffer;

.field private final val$env:Lfreemarker/core/Environment;

.field private final val$out:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/JythonRuntime;Ljava/lang/StringBuffer;Ljava/io/Writer;Lfreemarker/core/Environment;)V
    .registers 5

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    iput-object p2, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$buf:Ljava/lang/StringBuffer;

    iput-object p3, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$out:Ljava/io/Writer;

    iput-object p4, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$env:Lfreemarker/core/Environment;

    return-void
.end method

.method private interpretBuffer()V
    .registers 6

    .prologue
    .line 93
    iget-object v2, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    monitor-enter v2

    .line 94
    :try_start_3
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    invoke-static {v1}, Lfreemarker/template/utility/JythonRuntime;->access$000(Lfreemarker/template/utility/JythonRuntime;)Lorg/python/core/PySystemState;

    move-result-object v1

    iget-object v0, v1, Lorg/python/core/PySystemState;->stdout:Lorg/python/core/PyObject;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_3a

    .line 96
    .local v0, "prevOut":Lorg/python/core/PyObject;
    :try_start_b
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    iget-object v3, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v1, v3}, Lfreemarker/template/utility/JythonRuntime;->setOut(Ljava/io/Writer;)V

    .line 97
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    const-string v3, "env"

    iget-object v4, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$env:Lfreemarker/core/Environment;

    invoke-virtual {v1, v3, v4}, Lfreemarker/template/utility/JythonRuntime;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    iget-object v3, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lfreemarker/template/utility/JythonRuntime;->exec(Ljava/lang/String;)V

    .line 99
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$buf:Ljava/lang/StringBuffer;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_2c
    .catchall {:try_start_b .. :try_end_2c} :catchall_33

    .line 101
    :try_start_2c
    iget-object v1, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    invoke-virtual {v1, v0}, Lfreemarker/template/utility/JythonRuntime;->setOut(Lorg/python/core/PyObject;)V

    .line 103
    monitor-exit v2

    .line 104
    return-void

    .line 101
    :catchall_33
    move-exception v1

    iget-object v3, p0, Lfreemarker/template/utility/JythonRuntime$1;->this$0:Lfreemarker/template/utility/JythonRuntime;

    invoke-virtual {v3, v0}, Lfreemarker/template/utility/JythonRuntime;->setOut(Lorg/python/core/PyObject;)V

    throw v1

    .line 103
    .end local v0    # "prevOut":Lorg/python/core/PyObject;
    :catchall_3a
    move-exception v1

    monitor-exit v2
    :try_end_3c
    .catchall {:try_start_2c .. :try_end_3c} :catchall_3a

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Lfreemarker/template/utility/JythonRuntime$1;->interpretBuffer()V

    .line 90
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0}, Lfreemarker/template/utility/JythonRuntime$1;->interpretBuffer()V

    .line 85
    iget-object v0, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 86
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 80
    iget-object v0, p0, Lfreemarker/template/utility/JythonRuntime$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 81
    return-void
.end method
