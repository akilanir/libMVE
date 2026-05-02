.class public Lorg/apache/commons/validator/routines/CreditCardValidator;
.super Ljava/lang/Object;
.source "CreditCardValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final AMEX:J = 0x1L

.field public static final AMEX_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

.field public static final DINERS:J = 0x10L

.field public static final DINERS_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

.field public static final DISCOVER:J = 0x8L

.field private static final DISCOVER_REGEX:Lorg/apache/commons/validator/routines/RegexValidator;

.field public static final DISCOVER_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

.field private static final LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field public static final MASTERCARD:J = 0x4L

.field public static final MASTERCARD_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

.field public static final NONE:J = 0x0L

.field public static final VISA:J = 0x2L

.field public static final VISA_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

.field private static final serialVersionUID:J = 0x52a7e345cccc4b08L


# instance fields
.field private final cardTypes:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 94
    sget-object v0, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;->LUHN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 97
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(3[47]\\d{13})$"

    sget-object v2, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->AMEX_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 100
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(30[0-5]\\d{11}|3095\\d{10}|36\\d{12}|3[8-9]\\d{12})$"

    sget-object v2, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->DINERS_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 103
    new-instance v0, Lorg/apache/commons/validator/routines/RegexValidator;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "^(6011\\d{12})$"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "^(64[4-9]\\d{13})$"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "^(65\\d{14})$"

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>([Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->DISCOVER_REGEX:Lorg/apache/commons/validator/routines/RegexValidator;

    .line 106
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->DISCOVER_REGEX:Lorg/apache/commons/validator/routines/RegexValidator;

    sget-object v2, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Lorg/apache/commons/validator/routines/RegexValidator;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->DISCOVER_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 109
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(5[1-5]\\d{14})$"

    sget-object v2, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->MASTERCARD_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    .line 112
    new-instance v0, Lorg/apache/commons/validator/routines/CodeValidator;

    const-string v1, "^(4)(\\d{12}|\\d{15})$"

    sget-object v2, Lorg/apache/commons/validator/routines/CreditCardValidator;->LUHN_VALIDATOR:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/routines/CodeValidator;-><init>(Ljava/lang/String;Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;)V

    sput-object v0, Lorg/apache/commons/validator/routines/CreditCardValidator;->VISA_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 118
    const-wide/16 v0, 0xf

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;-><init>(J)V

    .line 119
    return-void
.end method

.method public constructor <init>(J)V
    .registers 5
    .param p1, "options"    # J

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    .line 130
    const-wide/16 v0, 0x2

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isOn(JJ)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 131
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->VISA_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    :cond_19
    const-wide/16 v0, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isOn(JJ)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 135
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->AMEX_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :cond_28
    const-wide/16 v0, 0x4

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isOn(JJ)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 139
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->MASTERCARD_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    :cond_37
    const-wide/16 v0, 0x8

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isOn(JJ)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 143
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->DISCOVER_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    :cond_46
    const-wide/16 v0, 0x10

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CreditCardValidator;->isOn(JJ)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 147
    iget-object v0, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    sget-object v1, Lorg/apache/commons/validator/routines/CreditCardValidator;->DINERS_VALIDATOR:Lorg/apache/commons/validator/routines/CodeValidator;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    :cond_55
    return-void
.end method

.method public constructor <init>([Lorg/apache/commons/validator/routines/CodeValidator;)V
    .registers 5
    .param p1, "creditCardValidators"    # [Lorg/apache/commons/validator/routines/CodeValidator;

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    .line 156
    if-nez p1, :cond_14

    .line 157
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Card validators are missing"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 159
    :cond_14
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    array-length v1, p1

    if-ge v0, v1, :cond_22

    .line 160
    iget-object v1, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    aget-object v2, p1, v0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 162
    :cond_22
    return-void
.end method

.method private isOn(JJ)Z
    .registers 9
    .param p1, "options"    # J
    .param p3, "flag"    # J

    .prologue
    .line 213
    and-long v0, p1, p3

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 6
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 170
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_a

    .line 179
    :cond_9
    :goto_9
    return v2

    .line 173
    :cond_a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    iget-object v3, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_9

    .line 174
    iget-object v3, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/validator/routines/CodeValidator;

    .line 175
    .local v1, "type":Lorg/apache/commons/validator/routines/CodeValidator;
    invoke-virtual {v1, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->isValid(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 176
    const/4 v2, 0x1

    goto :goto_9

    .line 173
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method

.method public validate(Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 189
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_b

    :cond_9
    move-object v1, v3

    .line 200
    :cond_a
    :goto_a
    return-object v1

    .line 192
    :cond_b
    const/4 v1, 0x0

    .line 193
    .local v1, "result":Ljava/lang/Object;
    const/4 v0, 0x0

    .end local v1    # "result":Ljava/lang/Object;
    .local v0, "i":I
    :goto_d
    iget-object v4, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_26

    .line 194
    iget-object v4, p0, Lorg/apache/commons/validator/routines/CreditCardValidator;->cardTypes:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/validator/routines/CodeValidator;

    .line 195
    .local v2, "type":Lorg/apache/commons/validator/routines/CodeValidator;
    invoke-virtual {v2, p1}, Lorg/apache/commons/validator/routines/CodeValidator;->validate(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 196
    .restart local v1    # "result":Ljava/lang/Object;
    if-nez v1, :cond_a

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .end local v1    # "result":Ljava/lang/Object;
    .end local v2    # "type":Lorg/apache/commons/validator/routines/CodeValidator;
    :cond_26
    move-object v1, v3

    .line 200
    goto :goto_a
.end method
