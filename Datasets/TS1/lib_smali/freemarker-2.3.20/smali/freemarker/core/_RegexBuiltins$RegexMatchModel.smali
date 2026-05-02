.class Lfreemarker/core/_RegexBuiltins$RegexMatchModel;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateBooleanModel;
.implements Lfreemarker/template/TemplateCollectionModel;
.implements Lfreemarker/template/TemplateSequenceModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RegexMatchModel"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;
    }
.end annotation


# instance fields
.field private data:Ljava/util/ArrayList;

.field groups:Lfreemarker/template/TemplateSequenceModel;

.field final input:Ljava/lang/String;

.field final matcher:Ljava/util/regex/Matcher;

.field final matches:Z


# direct methods
.method constructor <init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V
    .registers 4
    .param p1, "matcher"    # Ljava/util/regex/Matcher;
    .param p2, "input"    # Ljava/lang/String;

    .prologue
    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 352
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    .line 353
    iput-object p2, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->input:Ljava/lang/String;

    .line 354
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matches:Z

    .line 355
    return-void
.end method

.method private initSequence()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 372
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    .line 373
    invoke-virtual {p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 374
    .local v0, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_b
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 375
    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 377
    :cond_1b
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 362
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    if-nez v0, :cond_7

    invoke-direct {p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->initSequence()V

    .line 363
    :cond_7
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 358
    iget-boolean v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matches:Z

    return v0
.end method

.method public getGroups()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 380
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->groups:Lfreemarker/template/TemplateSequenceModel;

    if-nez v0, :cond_b

    .line 381
    new-instance v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;

    invoke-direct {v0, p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$1;-><init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V

    iput-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->groups:Lfreemarker/template/TemplateSequenceModel;

    .line 400
    :cond_b
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->groups:Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->reset()Ljava/util/regex/Matcher;

    .line 405
    new-instance v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;

    invoke-direct {v0, p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$2;-><init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V

    return-object v0
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 367
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    if-nez v0, :cond_7

    invoke-direct {p0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->initSequence()V

    .line 368
    :cond_7
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
