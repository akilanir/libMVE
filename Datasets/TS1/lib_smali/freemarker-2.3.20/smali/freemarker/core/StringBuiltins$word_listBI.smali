.class Lfreemarker/core/StringBuiltins$word_listBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "word_listBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 168
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 170
    new-instance v0, Lfreemarker/template/SimpleSequence;

    invoke-direct {v0}, Lfreemarker/template/SimpleSequence;-><init>()V

    .line 171
    .local v0, "result":Lfreemarker/template/SimpleSequence;
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 172
    .local v1, "st":Ljava/util/StringTokenizer;
    :goto_a
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 173
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_a

    .line 175
    :cond_18
    return-object v0
.end method
