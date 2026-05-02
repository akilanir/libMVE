.class Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins$split_reBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SplitMethod"
.end annotation


# instance fields
.field private s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/_RegexBuiltins$split_reBI;


# direct methods
.method constructor <init>(Lfreemarker/core/_RegexBuiltins$split_reBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 317
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;->this$0:Lfreemarker/core/_RegexBuiltins$split_reBI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p2, p0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;->s:Ljava/lang/String;

    .line 319
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 16
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const/4 v7, 0x1

    .line 322
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 323
    .local v0, "argCnt":I
    iget-object v6, p0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;->this$0:Lfreemarker/core/_RegexBuiltins$split_reBI;

    const/4 v11, 0x2

    invoke-virtual {v6, v0, v7, v11}, Lfreemarker/core/_RegexBuiltins$split_reBI;->checkMethodArgCount(III)V

    .line 324
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 325
    .local v5, "splitString":Ljava/lang/String;
    if-le v0, v7, :cond_47

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lfreemarker/core/_RegexBuiltins;->access$000(Ljava/lang/String;)J

    move-result-wide v1

    .line 326
    .local v1, "flags":J
    :goto_20
    const/4 v4, 0x0

    .line 327
    .local v4, "result":[Ljava/lang/String;
    const-wide v11, 0x100000000L

    and-long/2addr v11, v1

    cmp-long v6, v11, v9

    if-nez v6, :cond_4b

    .line 328
    const-string v6, "split"

    invoke-static {v6, v1, v2}, Lfreemarker/core/_RegexBuiltins;->access$200(Ljava/lang/String;J)V

    .line 329
    iget-object v11, p0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;->s:Ljava/lang/String;

    invoke-static {}, Lfreemarker/core/_RegexBuiltins;->access$300()J

    move-result-wide v12

    and-long/2addr v12, v1

    cmp-long v6, v12, v9

    if-eqz v6, :cond_49

    move v6, v7

    :goto_3c
    invoke-static {v11, v5, v6}, Lfreemarker/template/utility/StringUtil;->split(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v4

    .line 335
    :goto_40
    sget-object v6, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    invoke-interface {v6, v4}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    return-object v6

    .end local v1    # "flags":J
    .end local v4    # "result":[Ljava/lang/String;
    :cond_47
    move-wide v1, v9

    .line 325
    goto :goto_20

    .restart local v1    # "flags":J
    .restart local v4    # "result":[Ljava/lang/String;
    :cond_49
    move v6, v8

    .line 329
    goto :goto_3c

    .line 332
    :cond_4b
    long-to-int v6, v1

    invoke-static {v5, v6}, Lfreemarker/core/_RegexBuiltins;->getPattern(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 333
    .local v3, "pattern":Ljava/util/regex/Pattern;
    iget-object v6, p0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;->s:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    goto :goto_40
.end method
