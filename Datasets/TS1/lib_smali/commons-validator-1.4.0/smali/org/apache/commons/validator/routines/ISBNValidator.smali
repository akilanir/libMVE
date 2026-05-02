.class public Lorg/apache/commons/validator/routines/ISBNValidator;
.super Ljava/lang/Object;
.source "ISBNValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final GROUP:Ljava/lang/String; = "(\\d{1,5})"

.field static final ISBN10_REGEX:Ljava/lang/String; = "^(?:(\\d{9}[0-9X])|(?:(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9X])))$"

.field static final ISBN13_REGEX:Ljava/lang/String; = "^(978|979)(?:(\\d{10})|(?:(?:\\-|\\s)(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9])))$"

.field private static final ISBN_VALIDATOR:Lorg/apache/commons/validator/routines/ISBNValidator;

.field private static final ISBN_VALIDATOR_NO_CONVERT:Lorg/apache/commons/validator/routines/ISBNValidator;

.field private static final PUBLISHER:Ljava/lang/String; = "(\\d{1,7})"

.field private static final SEP:Ljava/lang/String; = "(?:\\-|\\s)"

.field private static final TITLE:Ljava/lang/String; = "(\\d{1,6})"

.field private static final serialVersionUID:J = 0x3bf200a1e78fc435L


# instance fields
.field private final convert:Z

.field private isbn10Validator:Lorg/apache/commons/validator/routines/CodeValidator;

.field private isbn13Validator:Lorg/apache/commons/validator/routines/CodeValidator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 82
    new-instance v0, Lorg/apache/commons/validator/routines/ISBNValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/ISBNValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/ISBNValidator;->ISBN_VALIDATOR:Lorg/apache/commons/validator/routines/ISBNValidator;

    .line 85
    new-instance v0, Lorg/apache/commons/validator/routines/ISBNValidator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/ISBNValidator;-><init>(Z)V

    sput-object v0, Lorg/apache/commons/validator/routines/ISBNValidator;->ISBN_VALIDATOR_NO_CONVERT:Lorg/apache/commons/validator/routines/ISBNValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 124
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/ISBNValidator;-><init>(Z)V

    .line 125
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 6
    .param p1, "convert"    # Z

    .prologue
    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(?:(\\d{9}[0-9X])|(?:(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9X])))$"

    const/16 v2, 0xa

    sget-object v3, Lorg/apache/commons/validator/routines/checkdigit/ISBN10CheckDigit;->ISBN10_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;ILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn10Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 92
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(978|979)(?:(\\d{10})|(?:(?:\\-|\\s)(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9])))$"

    const/16 v2, 0xd

    sget-object v3, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;->EAN13_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;ILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn13Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 136
    iput-boolean p1, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->convert:Z

    .line 137
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/ISBNValidator;
    .registers 1

    .prologue
    .line 103
    sget-object v0, Lorg/apache/commons/validator/routines/ISBNValidator;->ISBN_VALIDATOR:Lorg/apache/commons/validator/routines/ISBNValidator;

    return-object v0
.end method

.method public static getInstance(Z)Lorg/apache/commons/validator/routines/ISBNValidator;
    .registers 2
    .param p0, "convert"    # Z

    .prologue
    .line 116
    if-eqz p0, :cond_5

    sget-object v0, Lorg/apache/commons/validator/routines/ISBNValidator;->ISBN_VALIDATOR:Lorg/apache/commons/validator/routines/ISBNValidator;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/apache/commons/validator/routines/ISBNValidator;->ISBN_VALIDATOR_NO_CONVERT:Lorg/apache/commons/validator/routines/ISBNValidator;

    goto :goto_4
.end method


# virtual methods
.method public convertToISBN13(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "isbn10"    # Ljava/lang/String;

    .prologue
    .line 237
    if-nez p1, :cond_4

    .line 238
    const/4 v3, 0x0

    .line 251
    :goto_3
    return-object v3

    .line 241
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 242
    .local v2, "input":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_3d

    .line 243
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Invalid length "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " for \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 247
    :cond_3d
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "978"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v6, 0x9

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 249
    .local v3, "isbn13":Ljava/lang/String;
    :try_start_57
    iget-object v4, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn13Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-virtual {v4}, Lorg/apache/commons/validator/routines/CodeValidator;->getCheckDigit()Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    move-result-object v4

    invoke-interface {v4, v3}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;->calculate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "checkDigit":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_71
    .catch Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException; {:try_start_57 .. :try_end_71} :catch_73

    move-result-object v3

    .line 251
    goto :goto_3

    .line 252
    .end local v0    # "checkDigit":Ljava/lang/String;
    :catch_73
    move-exception v1

    .line 253
    .local v1, "e":Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Check digit error for \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/ISBNValidator;->isValidISBN13(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/ISBNValidator;->isValidISBN10(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isValidISBN10(Ljava/lang/String;)Z
    .registers 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn10Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-virtual {v0, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isValidISBN13(Ljava/lang/String;)Z
    .registers 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn13Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-virtual {v0, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->isValid(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/ISBNValidator;->validateISBN13(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_14

    .line 187
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/ISBNValidator;->validateISBN10(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 188
    if-eqz v0, :cond_14

    iget-boolean v1, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->convert:Z

    if-eqz v1, :cond_14

    .line 189
    invoke-virtual {p0, v0}, Lorg/apache/commons/validator/routines/ISBNValidator;->convertToISBN13(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    :cond_14
    return-object v0
.end method

.method public validateISBN10(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 206
    iget-object v1, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn10Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-virtual {v1, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->validate(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 207
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public validateISBN13(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 221
    iget-object v1, p0, Lorg/apache/commons/validator/routines/ISBNValidator;->isbn13Validator:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-virtual {v1, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->validate(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 222
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method
