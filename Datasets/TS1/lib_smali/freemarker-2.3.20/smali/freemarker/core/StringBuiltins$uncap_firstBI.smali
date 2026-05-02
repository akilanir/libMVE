.class Lfreemarker/core/StringBuiltins$uncap_firstBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "uncap_firstBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 138
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 140
    const/4 v1, 0x0

    .line 141
    .local v1, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 142
    .local v2, "ln":I
    :goto_5
    if-ge v1, v2, :cond_14

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 143
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 145
    :cond_14
    if-ge v1, v2, :cond_2a

    .line 146
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, "b":Ljava/lang/StringBuffer;
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 150
    .end local v0    # "b":Ljava/lang/StringBuffer;
    :cond_2a
    new-instance v3, Lfreemarker/template/SimpleScalar;

    invoke-direct {v3, p1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v3
.end method
