.class public Lfreemarker/core/_RegexBuiltins$groupsBI;
.super Lfreemarker/core/BuiltIn;
.source "_RegexBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "groupsBI"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 256
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 258
    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$groupsBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 259
    .local v0, "targetModel":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v0, p1}, Lfreemarker/core/_RegexBuiltins$groupsBI;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 260
    instance-of v1, v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    if-eqz v1, :cond_14

    .line 261
    check-cast v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    .end local v0    # "targetModel":Lfreemarker/template/TemplateModel;
    invoke-virtual {v0}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->getGroups()Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 263
    :goto_13
    return-object v1

    .line 262
    .restart local v0    # "targetModel":Lfreemarker/template/TemplateModel;
    :cond_14
    instance-of v1, v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;

    if-eqz v1, :cond_1d

    .line 263
    check-cast v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;

    .end local v0    # "targetModel":Lfreemarker/template/TemplateModel;
    iget-object v1, v0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->subs:Lfreemarker/template/SimpleSequence;

    goto :goto_13

    .line 265
    .restart local v0    # "targetModel":Lfreemarker/template/TemplateModel;
    :cond_1d
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/_RegexBuiltins$groupsBI;->target:Lfreemarker/core/Expression;

    const-string v3, "regular expression matcher"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method
