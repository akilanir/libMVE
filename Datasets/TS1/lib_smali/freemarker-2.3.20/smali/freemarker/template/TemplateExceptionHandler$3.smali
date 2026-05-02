.class final Lfreemarker/template/TemplateExceptionHandler$3;
.super Ljava/lang/Object;
.source "TemplateExceptionHandler.java"

# interfaces
.implements Lfreemarker/template/TemplateExceptionHandler;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleTemplateException(Lfreemarker/template/TemplateException;Lfreemarker/core/Environment;Ljava/io/Writer;)V
    .registers 6
    .param p1, "te"    # Lfreemarker/template/TemplateException;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p2}, Lfreemarker/core/Environment;->isInAttemptBlock()Z

    move-result v1

    if-nez v1, :cond_13

    .line 116
    instance-of v1, p3, Ljava/io/PrintWriter;

    if-eqz v1, :cond_14

    check-cast p3, Ljava/io/PrintWriter;

    .end local p3    # "out":Ljava/io/Writer;
    move-object v0, p3

    .line 117
    .local v0, "pw":Ljava/io/PrintWriter;
    :goto_d
    invoke-virtual {p1, v0}, Lfreemarker/template/TemplateException;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 118
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 120
    .end local v0    # "pw":Ljava/io/PrintWriter;
    :cond_13
    throw p1

    .line 116
    .restart local p3    # "out":Ljava/io/Writer;
    :cond_14
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, p3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_d
.end method
