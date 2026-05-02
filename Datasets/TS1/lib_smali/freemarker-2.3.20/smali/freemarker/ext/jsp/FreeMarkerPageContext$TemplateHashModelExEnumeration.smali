.class Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;
.super Ljava/lang/Object;
.source "FreeMarkerPageContext.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/FreeMarkerPageContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TemplateHashModelExEnumeration"
.end annotation


# instance fields
.field private final it:Lfreemarker/template/TemplateModelIterator;


# direct methods
.method private constructor <init>(Lfreemarker/template/TemplateHashModelEx;)V
    .registers 3
    .param p1, "hashEx"    # Lfreemarker/template/TemplateHashModelEx;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 473
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 474
    invoke-interface {p1}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    invoke-interface {v0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;->it:Lfreemarker/template/TemplateModelIterator;

    .line 475
    return-void
.end method

.method constructor <init>(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/ext/jsp/FreeMarkerPageContext$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/template/TemplateHashModelEx;
    .param p2, "x1"    # Lfreemarker/ext/jsp/FreeMarkerPageContext$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-direct {p0, p1}, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;-><init>(Lfreemarker/template/TemplateHashModelEx;)V

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .registers 3

    .prologue
    .line 479
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;->it:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 480
    :catch_7
    move-exception v0

    .line 481
    .local v0, "tme":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public nextElement()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 487
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;->it:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;
    :try_end_b
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 488
    :catch_d
    move-exception v0

    .line 489
    .local v0, "tme":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
