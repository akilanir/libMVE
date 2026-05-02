.class public final Lcom/google/zxing/client/result/EmailDoCoMoResultParser;
.super Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;
.source "EmailDoCoMoResultParser.java"


# static fields
.field private static final ATEXT_ALPHANUMERIC:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "[a-zA-Z0-9@.!#$%&\'*+\\-/=?^_`{|}~]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->ATEXT_ALPHANUMERIC:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/google/zxing/client/result/AbstractDoCoMoResultParser;-><init>()V

    return-void
.end method

.method static isBasicallyValidEmailAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 61
    if-eqz p0, :cond_18

    sget-object v0, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->ATEXT_ALPHANUMERIC:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_18

    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    .registers 12
    .param p1, "result"    # Lcom/google/zxing/Result;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 36
    invoke-static {p1}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v6

    .line 37
    .local v6, "rawText":Ljava/lang/String;
    const-string v0, "MATMSG:"

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 51
    :cond_e
    :goto_e
    return-object v2

    .line 40
    :cond_f
    const-string v0, "TO:"

    const/4 v8, 0x1

    invoke-static {v0, v6, v8}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "tos":[Ljava/lang/String;
    if-eqz v1, :cond_e

    .line 44
    array-length v8, v1

    move v0, v3

    :goto_1a
    if-ge v0, v8, :cond_27

    aget-object v7, v1, v0

    .line 45
    .local v7, "to":Ljava/lang/String;
    invoke-static {v7}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->isBasicallyValidEmailAddress(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 49
    .end local v7    # "to":Ljava/lang/String;
    :cond_27
    const-string v0, "SUB:"

    invoke-static {v0, v6, v3}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 50
    .local v4, "subject":Ljava/lang/String;
    const-string v0, "BODY:"

    invoke-static {v0, v6, v3}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->matchSingleDoCoMoPrefixedField(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 51
    .local v5, "body":Ljava/lang/String;
    new-instance v0, Lcom/google/zxing/client/result/EmailAddressParsedResult;

    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/client/result/EmailAddressParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v0

    goto :goto_e
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 3

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;

    move-result-object v0

    return-object v0
.end method
