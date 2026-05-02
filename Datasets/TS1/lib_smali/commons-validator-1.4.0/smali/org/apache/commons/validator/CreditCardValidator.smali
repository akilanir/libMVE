.class public Lorg/apache/commons/validator/CreditCardValidator;
.super Ljava/lang/Object;
.source "CreditCardValidator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/validator/CreditCardValidator$1;,
        Lorg/apache/commons/validator/CreditCardValidator$Mastercard;,
        Lorg/apache/commons/validator/CreditCardValidator$Discover;,
        Lorg/apache/commons/validator/CreditCardValidator$Amex;,
        Lorg/apache/commons/validator/CreditCardValidator$Visa;,
        Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;
    }
.end annotation


# static fields
.field public static final AMEX:I = 0x1

.field public static final DISCOVER:I = 0x8

.field public static final MASTERCARD:I = 0x4

.field public static final NONE:I = 0x0

.field public static final VISA:I = 0x2


# instance fields
.field private cardTypes:Ljava/util/Collection;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 91
    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/CreditCardValidator;-><init>(I)V

    .line 92
    return-void
.end method

.method public constructor <init>(I)V
    .registers 6
    .param p1, "options"    # I

    .prologue
    const/4 v3, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    .line 103
    new-instance v0, Lorg/apache/commons/validator/util/Flags;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;-><init>(J)V

    .line 104
    .local v0, "f":Lorg/apache/commons/validator/util/Flags;
    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOn(J)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 105
    iget-object v1, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    new-instance v2, Lorg/apache/commons/validator/CreditCardValidator$Visa;

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/CreditCardValidator$Visa;-><init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_23
    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOn(J)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 109
    iget-object v1, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    new-instance v2, Lorg/apache/commons/validator/CreditCardValidator$Amex;

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/CreditCardValidator$Amex;-><init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 112
    :cond_35
    const-wide/16 v1, 0x4

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOn(J)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 113
    iget-object v1, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    new-instance v2, Lorg/apache/commons/validator/CreditCardValidator$Mastercard;

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/CreditCardValidator$Mastercard;-><init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_47
    const-wide/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/validator/util/Flags;->isOn(J)Z

    move-result v1

    if-eqz v1, :cond_59

    .line 117
    iget-object v1, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    new-instance v2, Lorg/apache/commons/validator/CreditCardValidator$Discover;

    invoke-direct {v2, v3}, Lorg/apache/commons/validator/CreditCardValidator$Discover;-><init>(Lorg/apache/commons/validator/CreditCardValidator$1;)V

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_59
    return-void
.end method


# virtual methods
.method public addAllowedCardType(Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;)V
    .registers 3
    .param p1, "type"    # Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 7
    .param p1, "card"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 127
    if-eqz p1, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xd

    if-lt v3, v4, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x13

    if-le v3, v4, :cond_14

    .line 143
    :cond_13
    :goto_13
    return v2

    .line 131
    :cond_14
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/CreditCardValidator;->luhnCheck(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 135
    iget-object v3, p0, Lorg/apache/commons/validator/CreditCardValidator;->cardTypes:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 136
    .local v1, "types":Ljava/util/Iterator;
    :cond_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 137
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;

    .line 138
    .local v0, "type":Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;
    invoke-interface {v0, p1}, Lorg/apache/commons/validator/CreditCardValidator$CreditCardType;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 139
    const/4 v2, 0x1

    goto :goto_13
.end method

.method protected luhnCheck(Ljava/lang/String;)Z
    .registers 14
    .param p1, "cardNumber"    # Ljava/lang/String;

    .prologue
    const-wide/16 v10, 0x0

    const/4 v7, 0x0

    .line 163
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 164
    .local v2, "digits":I
    and-int/lit8 v4, v2, 0x1

    .line 165
    .local v4, "oddOrEven":I
    const-wide/16 v5, 0x0

    .line 166
    .local v5, "sum":J
    const/4 v0, 0x0

    .local v0, "count":I
    :goto_c
    if-ge v0, v2, :cond_3e

    .line 167
    const/4 v1, 0x0

    .line 169
    .local v1, "digit":I
    :try_start_f
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_29
    .catch Ljava/lang/NumberFormatException; {:try_start_f .. :try_end_29} :catch_3c

    move-result v1

    .line 174
    and-int/lit8 v8, v0, 0x1

    xor-int/2addr v8, v4

    if-nez v8, :cond_37

    .line 175
    mul-int/lit8 v1, v1, 0x2

    .line 176
    const/16 v8, 0x9

    if-le v1, v8, :cond_37

    .line 177
    add-int/lit8 v1, v1, -0x9

    .line 180
    :cond_37
    int-to-long v8, v1

    add-long/2addr v5, v8

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 170
    :catch_3c
    move-exception v3

    .line 183
    .end local v1    # "digit":I
    :cond_3d
    :goto_3d
    return v7

    :cond_3e
    cmp-long v8, v5, v10

    if-eqz v8, :cond_3d

    const-wide/16 v8, 0xa

    rem-long v8, v5, v8

    cmp-long v8, v8, v10

    if-nez v8, :cond_3d

    const/4 v7, 0x1

    goto :goto_3d
.end method
