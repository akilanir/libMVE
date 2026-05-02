.class Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins$RegexMatchModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Match"
.end annotation


# instance fields
.field match:Ljava/lang/String;

.field subs:Lfreemarker/template/SimpleSequence;

.field private final this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$RegexMatchModel;)V
    .registers 6

    .prologue
    .line 424
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->this$0:Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 423
    new-instance v1, Lfreemarker/template/SimpleSequence;

    invoke-direct {v1}, Lfreemarker/template/SimpleSequence;-><init>()V

    iput-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->subs:Lfreemarker/template/SimpleSequence;

    .line 425
    iget-object v1, p1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->input:Ljava/lang/String;

    iget-object v2, p1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    iget-object v3, p1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->match:Ljava/lang/String;

    .line 426
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    iget-object v1, p1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    if-ge v0, v1, :cond_39

    .line 427
    iget-object v1, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->subs:Lfreemarker/template/SimpleSequence;

    iget-object v2, p1, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;->matcher:Ljava/util/regex/Matcher;

    invoke-virtual {v2, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 426
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 429
    :cond_39
    return-void
.end method


# virtual methods
.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 431
    iget-object v0, p0, Lfreemarker/core/_RegexBuiltins$RegexMatchModel$Match;->match:Ljava/lang/String;

    return-object v0
.end method
