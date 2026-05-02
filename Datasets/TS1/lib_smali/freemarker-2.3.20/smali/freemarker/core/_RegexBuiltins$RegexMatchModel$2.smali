.class Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;


# instance fields
.field hasFindInfo:Z

.field private final this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V
    .registers 3

    .prologue
    .line 405
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 406
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    iget-object v0, v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->hasFindInfo:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 409
    iget-boolean v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->hasFindInfo:Z

    return v0
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 413
    invoke-virtual {p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->hasNext()Z

    move-result v1

    if-nez v1, :cond_e

    new-instance v1, Lfreemarker/core/_TemplateModelException;

    const-string v2, "No more matches"

    invoke-direct {v1, v2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 414
    :cond_e
    new-instance v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;

    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    invoke-direct {v0, v1}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;-><init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V

    .line 415
    .local v0, "result":Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;
    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    iget-object v1, v1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    iput-boolean v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;->hasFindInfo:Z

    .line 416
    return-object v0
.end method
