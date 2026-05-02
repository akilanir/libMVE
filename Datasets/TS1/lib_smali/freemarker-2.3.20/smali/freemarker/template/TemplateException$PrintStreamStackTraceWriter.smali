.class Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;
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
    name = "PrintStreamStackTraceWriter"
.end annotation


# instance fields
.field private final out:Ljava/io/PrintStream;


# direct methods
.method constructor <init>(Ljava/io/PrintStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 508
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 509
    iput-object p1, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    .line 510
    return-void
.end method


# virtual methods
.method public print(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 513
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 514
    return-void
.end method

.method public printStandardStackTrace(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 525
    instance-of v0, p1, Lfreemarker/template/TemplateException;

    if-eqz v0, :cond_c

    .line 526
    check-cast p1, Lfreemarker/template/TemplateException;

    .end local p1    # "exception":Ljava/lang/Throwable;
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    invoke-virtual {p1, v0}, Lfreemarker/template/TemplateException;->printStandardStackTrace(Ljava/io/PrintStream;)V

    .line 530
    :goto_b
    return-void

    .line 528
    .restart local p1    # "exception":Ljava/lang/Throwable;
    :cond_c
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_b
.end method

.method public println()V
    .registers 2

    .prologue
    .line 521
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 522
    return-void
.end method

.method public println(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 517
    iget-object v0, p0, Lfreemarker/template/TemplateException$PrintStreamStackTraceWriter;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 518
    return-void
.end method
