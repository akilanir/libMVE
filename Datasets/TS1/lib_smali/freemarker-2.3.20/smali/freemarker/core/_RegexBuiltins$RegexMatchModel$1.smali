.class Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private final this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V
    .registers 2

    .prologue
    .line 381
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 392
    :try_start_0
    new-instance v1, Lfreemarker/template/SimpleScalar;

    iget-object v2, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    iget-object v2, v2, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v2, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 394
    :catch_e
    move-exception v0

    .line 395
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public size()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 384
    :try_start_0
    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    iget-object v1, v1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->groupCount()I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_b

    move-result v1

    add-int/lit8 v1, v1, 0x1

    return v1

    .line 386
    :catch_b
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
