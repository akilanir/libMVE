.class public Lfreemarker/template/utility/Execute;
.super Ljava/lang/Object;
.source "Execute.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# static fields
.field private static final OUTPUT_BUFFER_SIZE:I = 0x400


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 13
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 107
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 109
    .local v1, "aOutputBuffer":Ljava/lang/StringBuffer;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ge v8, v9, :cond_15

    .line 110
    new-instance v8, Lfreemarker/template/TemplateModelException;

    const-string v9, "Need an argument to execute"

    invoke-direct {v8, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 113
    :cond_15
    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    .line 116
    .local v0, "aExecute":Ljava/lang/String;
    :try_start_1e
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 119
    .local v4, "exec":Ljava/lang/Process;
    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 120
    .local v5, "execOut":Ljava/io/InputStream;
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 122
    .local v6, "execReader":Ljava/io/Reader;
    const/16 v8, 0x400

    new-array v2, v8, [C

    .line 123
    .local v2, "buffer":[C
    invoke-virtual {v6, v2}, Ljava/io/Reader;->read([C)I

    move-result v3

    .line 125
    .local v3, "bytes_read":I
    :goto_37
    if-lez v3, :cond_4d

    .line 126
    const/4 v8, 0x0

    invoke-virtual {v1, v2, v8, v3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 127
    invoke-virtual {v6, v2}, Ljava/io/Reader;->read([C)I
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_40} :catch_42

    move-result v3

    goto :goto_37

    .line 130
    .end local v2    # "buffer":[C
    .end local v3    # "bytes_read":I
    .end local v4    # "exec":Ljava/lang/Process;
    .end local v5    # "execOut":Ljava/io/InputStream;
    .end local v6    # "execReader":Ljava/io/Reader;
    :catch_42
    move-exception v7

    .line 131
    .local v7, "ioe":Ljava/io/IOException;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 133
    .end local v7    # "ioe":Ljava/io/IOException;
    .restart local v2    # "buffer":[C
    .restart local v3    # "bytes_read":I
    .restart local v4    # "exec":Ljava/lang/Process;
    .restart local v5    # "execOut":Ljava/io/InputStream;
    .restart local v6    # "execReader":Ljava/io/Reader;
    :cond_4d
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
