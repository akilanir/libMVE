.class public interface abstract Lfreemarker/template/TemplateExceptionHandler;
.super Ljava/lang/Object;
.source "TemplateExceptionHandler.java"


# static fields
.field public static final DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

.field public static final HTML_DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

.field public static final IGNORE_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

.field public static final RETHROW_HANDLER:Lfreemarker/template/TemplateExceptionHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 91
    new-instance v0, Lfreemarker/template/TemplateExceptionHandler$1;

    invoke-direct {v0}, Lfreemarker/template/TemplateExceptionHandler$1;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateExceptionHandler;->IGNORE_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    .line 101
    new-instance v0, Lfreemarker/template/TemplateExceptionHandler$2;

    invoke-direct {v0}, Lfreemarker/template/TemplateExceptionHandler$2;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateExceptionHandler;->RETHROW_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    .line 112
    new-instance v0, Lfreemarker/template/TemplateExceptionHandler$3;

    invoke-direct {v0}, Lfreemarker/template/TemplateExceptionHandler$3;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateExceptionHandler;->DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    .line 129
    new-instance v0, Lfreemarker/template/TemplateExceptionHandler$4;

    invoke-direct {v0}, Lfreemarker/template/TemplateExceptionHandler$4;-><init>()V

    sput-object v0, Lfreemarker/template/TemplateExceptionHandler;->HTML_DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    return-void
.end method


# virtual methods
.method public abstract handleTemplateException(Lfreemarker/template/TemplateException;Lfreemarker/core/Environment;Ljava/io/Writer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method
