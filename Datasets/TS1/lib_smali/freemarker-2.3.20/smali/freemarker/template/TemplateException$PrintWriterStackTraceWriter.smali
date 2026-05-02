.class Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;
.super Ljava/lang/Object;
.source "TemplateException.java"

# interfaces
.implements Lfreemarker/template/TemplateException$StackTraceWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/TemplateException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PrintWriterStackTraceWriter"
.end annotation


# instance fields
.field private final out:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>(Ljava/io/PrintWriter;)V
    .registers 2
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 538
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 539
    iput-object p1, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    .line 540
    return-void
.end method


# virtual methods
.method public print(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 543
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    .line 544
    return-void
.end method

.method public printStandardStackTrace(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 555
    instance-of v0, p1, Lfreemarker/template/TemplateException;

    if-eqz v0, :cond_c

    .line 556
    check-cast p1, Lfreemarker/template/TemplateException;

    .end local p1    # "exception":Ljava/lang/Throwable;
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    invoke-virtual {p1, v0}, Lfreemarker/template/TemplateException;->printStandardStackTrace(Ljava/io/PrintWriter;)V

    .line 560
    :goto_b
    return-void

    .line 558
    .restart local p1    # "exception":Ljava/lang/Throwable;
    :cond_c
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    goto :goto_b
.end method

.method public println()V
    .registers 2

    .prologue
    .line 551
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->println()V

    .line 552
    return-void
.end method

.method public println(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 547
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintWriterStackTraceWriter;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 548
    return-void
.end method
