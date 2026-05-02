.class final Lfreemarker/template/TemplateExceptionHandler$1;
.super Ljava/lang/Object;
.source "TemplateExceptionHandler.java"

# interfaces
.implements Lfreemarker/template/TemplateExceptionHandler;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleTemplateException(Lfreemarker/template/TemplateException;Lfreemarker/core/Environment;Ljava/io/Writer;)V
    .registers 4
    .param p1, "te"    # Lfreemarker/template/TemplateException;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "out"    # Ljava/io/Writer;

    .prologue
    .line 94
    return-void
.end method
