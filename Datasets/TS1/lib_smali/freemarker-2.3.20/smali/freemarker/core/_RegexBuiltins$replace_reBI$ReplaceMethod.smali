.class Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins$replace_reBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReplaceMethod"
.end annotation


# instance fields
.field private s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/_RegexBuiltins$replace_reBI;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$replace_reBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 279
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;->this$0:Lfreemarker/core/_RegexBuiltins$replace_reBI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    iput-object p2, p0, Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;->s:Ljava/lang/String;

    .line 281
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 18
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    .line 285
    .local v3, "argCnt":I
    move-object/from16 v0, p0

    iget-object v9, v0, Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;->this$0:Lfreemarker/core/_RegexBuiltins$replace_reBI;

    const/4 v10, 0x2

    const/4 v11, 0x3

    invoke-virtual {v9, v3, v10, v11}, Lfreemarker/core/_RegexBuiltins$replace_reBI;->checkMethodArgCount(III)V

    .line 286
    const/4 v9, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 287
    .local v1, "arg1":Ljava/lang/String;
    const/4 v9, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 288
    .local v2, "arg2":Ljava/lang/String;
    const/4 v9, 0x2

    if-le v3, v9, :cond_68

    const/4 v9, 0x2

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Lfreemarker/core/_RegexBuiltins;->access$000(Ljava/lang/String;)J

    move-result-wide v4

    .line 290
    .local v4, "flags":J
    :goto_2f
    const-wide v9, 0x100000000L

    and-long/2addr v9, v4

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-nez v9, :cond_70

    .line 291
    const-string v9, "replace"

    invoke-static {v9, v4, v5}, Lfreemarker/core/_RegexBuiltins;->access$200(Ljava/lang/String;J)V

    .line 292
    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;->s:Ljava/lang/String;

    invoke-static {}, Lfreemarker/core/_RegexBuiltins;->access$300()J

    move-result-wide v9

    and-long/2addr v9, v4

    const-wide/16 v12, 0x0

    cmp-long v9, v9, v12

    if-eqz v9, :cond_6b

    const/4 v9, 0x1

    move v10, v9

    :goto_51
    const-wide v12, 0x200000000L

    and-long/2addr v12, v4

    const-wide/16 v14, 0x0

    cmp-long v9, v12, v14

    if-eqz v9, :cond_6e

    const/4 v9, 0x1

    :goto_5e
    invoke-static {v11, v1, v2, v10, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v8

    .line 302
    .local v8, "result":Ljava/lang/String;
    :goto_62
    new-instance v9, Lfreemarker/template/SimpleScalar;

    invoke-direct {v9, v8}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v9

    .line 288
    .end local v4    # "flags":J
    .end local v8    # "result":Ljava/lang/String;
    :cond_68
    const-wide/16 v4, 0x0

    goto :goto_2f

    .line 292
    .restart local v4    # "flags":J
    :cond_6b
    const/4 v9, 0x0

    move v10, v9

    goto :goto_51

    :cond_6e
    const/4 v9, 0x0

    goto :goto_5e

    .line 296
    :cond_70
    long-to-int v9, v4

    invoke-static {v1, v9}, Lfreemarker/core/_RegexBuiltins;->getPattern(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 297
    .local v7, "pattern":Ljava/util/regex/Pattern;
    move-object/from16 v0, p0

    iget-object v9, v0, Lfreemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod;->s:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 298
    .local v6, "matcher":Ljava/util/regex/Matcher;
    const-wide v9, 0x200000000L

    and-long/2addr v9, v4

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-eqz v9, :cond_8e

    invoke-virtual {v6, v2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "result":Ljava/lang/String;
    :goto_8d
    goto :goto_62

    .end local v8    # "result":Ljava/lang/String;
    :cond_8e
    invoke-virtual {v6, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_8d
.end method
