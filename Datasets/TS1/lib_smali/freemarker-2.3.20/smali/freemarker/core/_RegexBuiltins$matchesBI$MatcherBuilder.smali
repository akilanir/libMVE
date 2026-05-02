.class Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins$matchesBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MatcherBuilder"
.end annotation


# instance fields
.field matchString:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/_RegexBuiltins$matchesBI;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$matchesBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "matchString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 235
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->this$0:Lfreemarker/core/_RegexBuiltins$matchesBI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iput-object p2, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->matchString:Ljava/lang/String;

    .line 237
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 13
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    const/4 v10, 0x1

    .line 240
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 241
    .local v0, "argCnt":I
    iget-object v6, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->this$0:Lfreemarker/core/_RegexBuiltins$matchesBI;

    const/4 v9, 0x2

    invoke-virtual {v6, v0, v10, v9}, Lfreemarker/core/_RegexBuiltins$matchesBI;->checkMethodArgCount(III)V

    .line 243
    const/4 v6, 0x0

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 244
    .local v5, "patternString":Ljava/lang/String;
    if-le v0, v10, :cond_5d

    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lfreemarker/core/_RegexBuiltins;->access$000(Ljava/lang/String;)J

    move-result-wide v1

    .line 245
    .local v1, "flags":J
    :goto_20
    const-wide v9, 0x200000000L

    and-long/2addr v9, v1

    cmp-long v6, v9, v7

    if-eqz v6, :cond_4a

    .line 246
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->this$0:Lfreemarker/core/_RegexBuiltins$matchesBI;

    iget-object v7, v7, Lfreemarker/core/_RegexBuiltins$matchesBI;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " doesn\'t support the \"f\" flag."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lfreemarker/core/_RegexBuiltins;->access$100(Ljava/lang/String;)V

    .line 248
    :cond_4a
    long-to-int v6, v1

    invoke-static {v5, v6}, Lfreemarker/core/_RegexBuiltins;->getPattern(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 249
    .local v4, "pattern":Ljava/util/regex/Pattern;
    iget-object v6, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->matchString:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 250
    .local v3, "matcher":Ljava/util/regex/Matcher;
    new-instance v6, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;

    iget-object v7, p0, Lfreemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder;->matchString:Ljava/lang/String;

    invoke-direct {v6, v3, v7}, Lfreemarker/core/_RegexBuiltins$RegexMatchModel;-><init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V

    return-object v6

    .end local v1    # "flags":J
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    .end local v4    # "pattern":Ljava/util/regex/Pattern;
    :cond_5d
    move-wide v1, v7

    .line 244
    goto :goto_20
.end method
