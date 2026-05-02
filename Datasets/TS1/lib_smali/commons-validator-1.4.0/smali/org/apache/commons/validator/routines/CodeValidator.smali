.class public final Lorg/apache/commons/validator/routines/CodeValidator;
.super Ljava/lang/Object;
.source "CodeValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x633ec9490f28279L


# instance fields
.field private final checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private final maxLength:I

.field private final minLength:I

.field private final regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 6
    .param p1, "regex"    # Ljava/lang/String;
    .param p2, "minLength"    # I
    .param p3, "maxLength"    # I
    .param p4, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_19

    .line 96
    new-instance v0, Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-direct {v0, p1}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 100
    :goto_12
    iput p2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->minLength:I

    .line 101
    iput p3, p0, Lorg/apache/commons/validator/routines/CodeValidator;->maxLength:I

    .line 102
    iput-object p4, p0, Lorg/apache/commons/validator/routines/CodeValidator;->checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 103
    return-void

    .line 98
    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    goto :goto_12
.end method

.method public constructor <init>(Ljava/lang/String;ILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 4
    .param p1, "regex"    # Ljava/lang/String;
    .param p2, "length"    # I
    .param p3, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2, p2, p3}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 4
    .param p1, "regex"    # Ljava/lang/String;
    .param p2, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    const/4 v0, -0x1

    .line 68
    invoke-direct {p0, p1, v0, v0, p2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/routines/RegexValidator;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 5
    .param p1, "regexValidator"    # Lorg/apache/commons/validator/routines/RegexValidator;
    .param p2, "minLength"    # I
    .param p3, "maxLength"    # I
    .param p4, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-object p1, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 141
    iput p2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->minLength:I

    .line 142
    iput p3, p0, Lorg/apache/commons/validator/routines/CodeValidator;->maxLength:I

    .line 143
    iput-object p4, p0, Lorg/apache/commons/validator/routines/CodeValidator;->checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 144
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/routines/RegexValidator;ILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 4
    .param p1, "regexValidator"    # Lorg/apache/commons/validator/routines/RegexValidator;
    .param p2, "length"    # I
    .param p3, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    .line 126
    invoke-direct {p0, p1, p2, p2, p3}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Lorg/apache/commons/validator/routines/RegexValidator;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/routines/RegexValidator;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V
    .registers 4
    .param p1, "regexValidator"    # Lorg/apache/commons/validator/routines/RegexValidator;
    .param p2, "checkdigit"    # Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .prologue
    const/4 v0, -0x1

    .line 113
    invoke-direct {p0, p1, v0, v0, p2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Lorg/apache/commons/validator/routines/RegexValidator;IILorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    .line 114
    return-void
.end method


# virtual methods
.method public getCheckDigit()Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    return-object v0
.end method

.method public getMaxLength()I
    .registers 2

    .prologue
    .line 181
    iget v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->maxLength:I

    return v0
.end method

.method public getMinLength()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->minLength:I

    return v0
.end method

.method public getRegexValidator()Lorg/apache/commons/validator/routines/RegexValidator;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    return-object v0
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->validate(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 218
    if-nez p1, :cond_5

    move-object v0, v1

    .line 246
    :cond_4
    :goto_4
    return-object v0

    .line 222
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 223
    .local v0, "code":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_11

    move-object v0, v1

    .line 224
    goto :goto_4

    .line 228
    :cond_11
    iget-object v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    if-eqz v2, :cond_1f

    .line 229
    iget-object v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->regexValidator:Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-virtual {v2, v0}, Lorg/apache/commons/validator/routines/RegexValidator;->validate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 230
    if-nez v0, :cond_1f

    move-object v0, v1

    .line 231
    goto :goto_4

    .line 236
    :cond_1f
    iget v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->minLength:I

    if-ltz v2, :cond_2b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lorg/apache/commons/validator/routines/CodeValidator;->minLength:I

    if-lt v2, v3, :cond_37

    :cond_2b
    iget v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->maxLength:I

    if-ltz v2, :cond_39

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lorg/apache/commons/validator/routines/CodeValidator;->maxLength:I

    if-le v2, v3, :cond_39

    :cond_37
    move-object v0, v1

    .line 238
    goto :goto_4

    .line 242
    :cond_39
    iget-object v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/apache/commons/validator/routines/CodeValidator;->checkdigit:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-interface {v2, v0}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;->isValid(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    move-object v0, v1

    .line 243
    goto :goto_4
.end method
